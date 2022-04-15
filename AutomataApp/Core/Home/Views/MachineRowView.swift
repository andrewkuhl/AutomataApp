//
//  RowTransitionView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/12/22.
//

import SwiftUI


struct MachineRowView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    let machine: Machine
    
    
    var body: some View {
        NavigationLink(destination: ModalView(type: 2, machine: machine).environmentObject(vm).navigationBarHidden(true), label:{
            HStack(spacing: 0){
                    Text("\(machine.id)")
                        .font(.caption)
                        .foregroundColor(Color.theme.accent)
                        .frame(minWidth: 30)
                    Image(systemName: "cpu")
                        .frame(width:30,height:30)
                        .font(.system(size: 28))
                    
                    Text("\(machine.name)")
                        .font(.headline)
                        .padding(.leading, 1)
                        .foregroundColor(Color.theme.accent)
                        .lineLimit(1)
                Spacer()
                Text("\(machine.type)")
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                Spacer()
                Text("\(machine.Q) states")
                    .font(.headline)
                    .padding()
                    .foregroundColor(Color.theme.accent)
            }
        })
    }
}

