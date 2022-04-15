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
    
    @Environment(\.presentationMode) var presentationMode
   
    @EnvironmentObject private var _vm: HomeViewModel
    
    @StateObject var modalVM = ModalViewModel()
    
    
        var body: some View {
            ZStack {
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
                    
                    switch type{
                    case 1:
                        NewMachineView(machine: machine)
                            .environmentObject(_vm)
                    default:
                        EditMachineView(machine: machine)
                            .environmentObject(_vm)
                    }
                }//endvstack
            }//endZstack
        }//end body
}//end struct

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ModalView(type: 1, machine: Machine(id: 1, name: "", type: "", Q: 0, States: [], E: [], G: [], d: [], q0: st(name: ""), qaccept: [], qreject: "", recents: [], selectedItems: []))
                .navigationBarHidden(true)
                .environmentObject(dev.homeVM)
        }
        .preferredColorScheme(.dark)
    }
}
