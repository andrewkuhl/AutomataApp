//
//  EditMachineView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/15/22.
//

import SwiftUI

struct EditMachineView: View {
    
    
    @State var machine: Machine
    
    @Environment(\.presentationMode) var presentationMode
   
    @EnvironmentObject private var _vm: HomeViewModel
    
    var opt = ["info", "transitions", "computations"]
    
    @State private var _selectedMenu = "info"
    
    func addState(state: st) {
        if machine.qaccept.contains(state) {
            machine.qaccept = machine.qaccept.filter{ $0 != state}
        }
        else{
            machine.qaccept.append(state)
        }
    }
    
    var body: some View {
        VStack{
            NavigationView{
                Form{
                    Section(header: Text("Machine \(machine.name)").textCase(nil).font(.system(size:30)).foregroundColor(Color.theme.accent).padding(.bottom))
                        {
                        Picker("menu", selection: $_selectedMenu) {
                            ForEach(opt, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    
                    switch _selectedMenu {
                    case "info":
                        infotab
                    case "transitions":
                        transtab
                    default:
                        comptab
                    }
                    Section{
                        VStack{
                            Text("save")
                                .foregroundColor(Color.theme.green)
                                .padding(.bottom, 20)
                                .font(.system(size: 27))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .listRowInsets(EdgeInsets())
                        .contentShape(Rectangle())
                        .onTapGesture {
                            machine.qaccept = Array(machine.selectedItems)
                            _vm.allMachines[machine.id-1] = machine
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    }
                    .background(Color(UIColor.systemGroupedBackground))
                    
                }
                .navigationBarHidden(true)
            }
            Spacer(minLength: 0)
        }//endvstack
        .padding(0)
    }
}

struct EditMachineView_Previews: PreviewProvider {
    static var previews: some View {
        EditMachineView(machine: Machine(id: 1, name: "DFA1", type: "DFA", Q: 2, States: [st(name: "q1"), st(name: "q2")], E: [], G: [], d: [], q0: st(name: ""), qaccept: [st(name: "q1")], qreject: "", recents: [], selectedItems: []))
            .preferredColorScheme(.dark)
    }
}

extension EditMachineView {
    private var infotab: some View{
        List{
            Section(header: Text("name")) {
                TextField("\(machine.name)", text: $machine.name)
            }
            Section(header: Text("States")) {
                
                Stepper(onIncrement: {
                    machine.Q += 1
                    machine.States.append(st(name: "q\(machine.Q)"))
                }, onDecrement: {
                    if(machine.Q != 0)
                    {
                        machine.Q -= 1
                        machine.States.removeLast()
                    }
                }) {
                    Text("\(machine.Q) states")
                }
            }
            Section(header: Text("Start State")) {
                Picker("state \(machine.q0.name)", selection: $machine.q0) {
                    ForEach(machine.States) { state in
                        Text("\(state.name)")
                                .padding(.horizontal)
                        }
                    }
                
            }
            Section(header: Text("Final States")) {
                let layout = [
                    GridItem(.adaptive(minimum: 80))
                ]
                VStack{
                    LazyVGrid(columns: layout, spacing: 20){
                        ForEach(machine.States){ state in
                            StateNodeView(state: state, machine: machine)
                                .onTapGesture {
                                    addState(state: state)
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .listRowInsets(EdgeInsets())
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    private var transtab: some View{
        VStack{
            Section(header: Text("name")) {
                TextField("\(machine.name)", text: $machine.name)
            }
            Section(header: Text("states")) {
            }
            Section(header: Text("start state")) {
                TextField("\(machine.name)", text: $machine.name)
            }
        }
    }
    private var comptab: some View{
        VStack{
            Section(header: Text("name")) {
                TextField("\(machine.name)", text: $machine.name)
            }
            
            Section(header: Text("start state")) {
                TextField("\(machine.name)", text: $machine.name)
            }
        }
    }
}
