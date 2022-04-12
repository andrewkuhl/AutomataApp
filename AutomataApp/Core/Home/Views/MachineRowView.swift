//
//  MachineRowView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct MachineRowView: View {
    
    let machine: Machine
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            
            Spacer()
            middleColumn
            Spacer()
            rightColumn
        }
        .frame(maxHeight:45)
        
    }
}

struct MachineRowView_Previews: PreviewProvider {
    static var previews: some View {
        MachineRowView(machine: dev.machine)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        MachineRowView(machine: dev.machine)
            .previewLayout(.sizeThatFits)
    }
}

extension MachineRowView {
    private var leftColumn: some View{
        HStack(spacing:0) {
            Text("\(machine.id)")
                .font(.caption)
                .foregroundColor(Color.theme.secText)
                .frame(minWidth: 30)
            Image(systemName: "cpu")
                .frame(width:30,height:30)
                .font(.system(size: 28))
            
            Text("\(machine.name.uppercased())")
                .font(.headline)
                .padding(.leading, 1)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
        }
        
    }
    
    private var middleColumn: some View {
        Text("\(machine.Q.count) state \(machine.type)")
            .font(.headline)
            
            .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        Text("\(machine.recents.count) inputs")
            .font(.headline)
            .padding()
            .foregroundColor(Color.theme.accent)
    }
}
