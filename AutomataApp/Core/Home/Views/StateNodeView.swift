//
//  SwiftUIView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/15/22.
//

import SwiftUI

struct StateNodeView: View {
    
    let state: st
    let machine: Machine
    
    func isAccepting() -> Color {
        if machine.qaccept.contains(state) {
            return Color.theme.background4
        }
        else{
            return Color.theme.background3
        }
    }
    @State var color = Color.theme.background3
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 60, height: 40)
                .foregroundColor(isAccepting())
            Text("\(state.name)")
                .foregroundColor(Color.theme.accent)
                .padding()
        }
    }
}

struct StateNode_Previews: PreviewProvider {
    static var previews: some View {
        let tmp = st(name: "q1")
        StateNodeView(state: tmp, machine: Machine(id: 0, name: "", type: "", Q: 0, States: [], E: [], G: [], d: [], q0: st(name: ""), qaccept: [tmp], qreject: "", recents: [], selectedItems: []))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
