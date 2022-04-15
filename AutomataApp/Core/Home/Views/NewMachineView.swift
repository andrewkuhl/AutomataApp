//
//  NewMachineView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/15/22.
//

import SwiftUI

struct NewMachineView: View {
    
    @State var machine: Machine
    
    @Environment(\.presentationMode) var presentationMode
   
    @EnvironmentObject private var _vm: HomeViewModel
    
    @StateObject var modalVM = ModalViewModel()
    
    var machs = ["DFA", "NFA", "PDA", "DTM"]
    
    @State private var _selectedMach = "none"
    
    @State private var isShowingTransitions = false
    
    @State private var isShowingSheet = false
    
    
    
    func didDismiss() {
           isShowingSheet = false// Handle the dismissing action.
       }
    
    func addState(state: st) {
        if machine.qaccept.contains(state) {
            machine.qaccept = machine.qaccept.filter{ $0 != state}
        }
        else{
            machine.qaccept.append(state)
        }
    }

    var body: some View {
        if !isShowingTransitions {
            newMachine
                .transition(.move(edge: .leading))
        }
        else{
            NewTransitions
            
        }
    }
}

struct NewMachineView_Previews: PreviewProvider {
    static var previews: some View {
        NewMachineView(machine: Machine(id: 1, name: "", type: "", Q: 0, States: [], E: [], G: [], d: [], q0: st(name: ""), qaccept: [], qreject: "", recents: [], selectedItems: Set<st.ID>()))
            .preferredColorScheme(.dark)
    }
}

extension NewMachineView {
    private var newMachine: some View{
        NavigationView{
            Form{
                machtype
                switch _selectedMach {
                    case "DFA":
                        dfatype
                    case "NFA":
                        nfatype
                    case "PDA":
                        pdatype
                    case "DTM":
                        dtmtype
                    default:
                        Text("Choose a Type of Machine to configure...")
                        .foregroundColor(Color.theme.secText)
                }
            }
            .navigationBarHidden(true)
        }
    }
    private var NewTransitions: some View {
        VStack{
        NavigationView{
            Form{
                Section(header: Text("Transitions")) {
                    
                    HStack{
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .padding(.horizontal)
                        Text("add transition")
                    }
                    .onTapGesture {
                        modalVM.codes.append(Transition(id: modalVM.codes.count, Qs: "", Qf: "", e: "", act1: "", act2: "", act3: "") )
                        isShowingSheet.toggle()
                    }
                    
                    ForEach(0..<modalVM.codes.count, id: \.self) { index in
                        HStack {
                            Button(action: {
                                modalVM.codes.remove(at: index)

                            }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            Text("\(modalVM.codes[index].Qs) read \(modalVM.codes[index].e) &rarr;  \(modalVM.codes[index].Qf)")
                            
                        }
                        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss){
                            RowTransitionView(type: "DFA", index: index)
                        
                        }
                                .environmentObject(modalVM)
                    }
                }
            }
            .navigationTitle("Transitions")
        }
            Text("save")
                    .onTapGesture {
                        machine.type = _selectedMach
                        machine.Q = modalVM.QValue
                        machine.States = modalVM.States
                        machine.E = modalVM.inputs
                        machine.G = modalVM.GValue
                        machine.d = modalVM.dValue
                        machine.q0 = modalVM.q0Value
                        machine.qreject = modalVM.qreject
                        _vm.allMachines.append(machine)
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color.theme.green)
                    .padding(.bottom, 20)
                    .font(.system(size: 27))
            Spacer(minLength: 0)
        }
    }
    
    private var machtype: some View {
        Section(header: Text("New Machine").textCase(nil).font(.system(size:30)).foregroundColor(Color.theme.accent).padding(.bottom)){
        VStack{
            Picker("Machine Type", selection: $_selectedMach) {
                ForEach(machs, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .listRowInsets(EdgeInsets())
    }
    .background(Color(UIColor.systemGroupedBackground))
    }
    
    private var dfatype: some View {
        List{
            Section(header: Text("machine name")) {
                TextField("name...", text: $machine.name)
            }
            Section(header: Text("Number of States")) {
                Stepper(onIncrement: {
                    modalVM.QValue += 1
                    modalVM.States.append(st(name: "q\(modalVM.QValue)"))
                }, onDecrement: {
                    modalVM.QValue -= 1
                    if(modalVM.States.count != 0)
                    {
                        modalVM.States.removeLast()
                    }
                }) {
                    Text("\(modalVM.QValue) states")
                }
            }
            Section(header: Text("Input Alphabet")) {
                HStack{
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .padding(.horizontal)
                    Text("add to alphabet")
                }
                .onTapGesture {
                    modalVM.inputs.append("")
                }
                ForEach(0..<modalVM.inputs.count, id: \.self) { index in
                    HStack {
                        Button(action: { modalVM.inputs.remove(at: index) }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        }
                        TextField("new input character...", text: $modalVM.inputs[index])
                    }
                    
                }
            }

            Section(header: Text("Start State")) {
                Picker("state \(modalVM.q0Value.name)", selection: $modalVM.q0Value) {
                        ForEach(modalVM.States) { state in
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
                        ForEach(modalVM.States){ state in
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
            Section{
                VStack{
                    Text("next")
                        .foregroundColor(Color.theme.green)
                        .padding(.bottom, 20)
                        .font(.system(size: 27))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .listRowInsets(EdgeInsets())
                .contentShape(Rectangle())
                .onTapGesture {
                    isShowingTransitions.toggle()
                }
                
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    private var nfatype: some View {
        Section(header: Text("machine")) {

        }
    }
    private var pdatype: some View {
        Section(header: Text("machine")) {
        }
    }
    private var dtmtype: some View {
        Section(header: Text("machine")) {
            
        }
    }
}
