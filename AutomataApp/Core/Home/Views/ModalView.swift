//
//  ModalView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/12/22.
//

import SwiftUI


struct ModalView: View  {
    
    let type: Int
    @State var machine: Machine
    
    func didDismiss() {
           isShowingSheet = false// Handle the dismissing action.
       }
    
    @Environment(\.presentationMode) var presentationMode
   
    @EnvironmentObject private var _vm: HomeViewModel
    
    @StateObject var modalVM = ModalViewModel()
    
    @State private var isShowingSheet = false
    
    @State private var isShowingTransitions = false
    
    var machs = ["DFA", "NFA", "PDA", "DTM"]
    
    @State private var _selectedMach = "none"
    
    @State private var _name = ""
    
    @State var selectedItems = Set<UUID>()
    
    
        var body: some View {
            ZStack {
                Color.theme.background.edgesIgnoringSafeArea(.all)
                switch type{
                case 1:
                    NewMachine
                default:
                    EditMachine
                }
            }//endZstack
        }//end body
}//end struct
struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(type: 1, machine: Machine(id: 1, name: "DFA1", type: "", Q: [""], E: [""], G: [""], d: [Transition(id: 1, Qs: "", Qf: "", e: "", act1: "", act2: "", act3: "")], q0: "", qaccept: [""], qreject: "", recents: [Input(id: 1, list: ["1"], M: "DFA", acc: true)]))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

extension ModalView {
    private var NewMachine: some View{
        VStack{
            HStack{
                Text("cancel")
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                            .foregroundColor(Color.theme.accent)
                            
                Spacer()
            }
            .padding()
            .font(.system(size: 22))
            
            if !isShowingTransitions {
                newMachine
                    .transition(.move(edge: .leading))
            }
            else{
                NewTransitions
                
            }
            
        }//endvstack
    }
    private var newMachine: some View{
        VStack{
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
            .navigationTitle("New Machine")
        }
            Text("next")
                    .onTapGesture {
                            isShowingTransitions.toggle()
                    }
                    .foregroundColor(Color.theme.green)
                    .padding(.bottom, 20)
                    .font(.system(size: 27))
            Spacer(minLength: 0)
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
                        machine.name = _name
                        machine.type = _selectedMach
                        machine.Q = modalVM.States
                        machine.E = modalVM.inputs
                        machine.G = modalVM.GValue
                        machine.d = modalVM.dValue
                        machine.q0 = modalVM.q0Value
                        machine.qaccept = modalVM.qaccept
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
        Section(header: Text("machine")) {
            Picker("Machine Type", selection: $_selectedMach) {
                ForEach(machs, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
        }
    }
    
    private var dfatype: some View {
        
        List{
            Section(header: Text("machine name")) {
                TextField("name...", text: $_name)
            }
            Section(header: Text("Number of States")) {
                Stepper(onIncrement: {
                    modalVM.QValue += 1
                    modalVM.States.append("q\(modalVM.QValue)")
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
                Picker("state \(modalVM.q0Value)", selection: $modalVM.q0Value) {
                        ForEach(modalVM.States, id: \.self) {
                            Text($0)
                                .padding(.horizontal)
                        }
                    }
                
            }
            Section(header: Text("Final States")) {
                List(selection: $selectedItems) {
                    if modalVM.States.count == 0 {
                        Text("add a state")
                            .foregroundColor(Color.theme.secText)
                    }
                    ForEach(modalVM.States, id: \.self) { state in
                        RowSelectView(input: state)
                            .onTapGesture{
                                
                            }
                        }
                    }
            }
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
    
    private var EditMachine: some View {
        VStack{
            HStack{
                Text("cancel")
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                            .foregroundColor(Color.theme.accent)
                
                Spacer()
            }
            .padding()
            .font(.system(size: 22))
            NavigationView{
                Form{
                    Section(header: Text("name")) {
                        TextField("\(machine.name)", text: $machine.name)
                    }
                }
                .navigationTitle("Machine \(machine.name)")
            }
            Text("save")
                    .onTapGesture {
                        _vm.allMachines[machine.id-1] = machine
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color.theme.green)
                    .padding(.bottom, 20)
                    .font(.system(size: 27))
            Spacer(minLength: 0)
        }//endvstack
    }
}
