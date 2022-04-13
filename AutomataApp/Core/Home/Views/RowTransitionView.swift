//
//  RowTransitionView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/12/22.
//

import SwiftUI


struct RowTransitionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject private var ModalVM: ModalViewModel
    
    let type: String
    let index: Int
    
    @State var qs = "Qs"
    @State var e = "e"
    @State var qf = "Qf"
    
    var body: some View {
        ZStack{
            Color.theme.background.edgesIgnoringSafeArea(.all)
            NavigationView{
                List{
                    Section(header: Text("starting state")) {
                        Picker("state \(qs)", selection: $qs) {
                                ForEach(ModalVM.States, id: \.self) {
                                    Text($0)
                                        .padding(.horizontal)
                                }
                            }
                    }
                    Section(header: Text("input")) {
                        Picker("input \(e)", selection: $e) {
                                ForEach(ModalVM.inputs, id: \.self) {
                                    Text($0)
                                        .padding(.horizontal)
                                }
                            }
                    }
                    Section(header: Image(systemName: "arrow.right").font(.system(size:30))) {
                    }
                    .padding()
                    Section(header: Text("ending state")) {
                        Picker("input \(qf)", selection: $qf) {
                                ForEach(ModalVM.States, id: \.self) {
                                    Text($0)
                                        .padding(.horizontal)
                                }
                            }
                    }
                    Button("save") {
                        ModalVM.codes[index].Qs = qs
                        ModalVM.codes[index].e = e
                        ModalVM.codes[index].Qf = qf
                        dismiss()
                           }
                           .foregroundColor(Color.theme.green)
                }.navigationTitle("New Transition")
                    .foregroundColor(Color.theme.accent)
                
            }
            
        }
    }
}

struct RowTransitionView_Previews: PreviewProvider {
    static var previews: some View {
        RowTransitionView(type: "DFA", index: 1)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .environmentObject(ModalViewModel())
    }
}
