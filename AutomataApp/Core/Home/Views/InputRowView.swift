//
//  InputRowView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct InputRowView: View {
    
    let input: Input
    
    var body: some View {
        ZStack{
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
}
struct InputRowView_Previews: PreviewProvider {
    static var previews: some View {
        InputRowView(input: Input(id: 1, list: ["1","1","1","0","0","0"], M: dev.machine.name, acc: true))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
extension InputRowView {
    private var leftColumn: some View{
        HStack(spacing:0) {
            Text("\(input.id)")
                .font(.caption)
                .foregroundColor(Color.theme.secText)
                .frame(minWidth: 30)
            Image(systemName: "memorychip")
                .frame(width:30,height:30)
                .font(.system(size: 28))
                .padding(.top, 3)
                .padding(.bottom, 3)
            Text("\(input.M)")
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
        }
        
    }
    
    private var middleColumn: some View{
        HStack (spacing: 0){
            ForEach(input.list, id: \.self) { input in
                            Text(input)
                        }
        }
        .lineLimit(1)
    }
    private var rightColumn: some View {

        Image(systemName: "macmini.fill")
            .frame(width:30,height:30)
            .font(.system(size: 30))
            .padding(.trailing)
            .foregroundColor(input.acc ? Color.theme.green : Color.theme.red)
    }
    
    
    
}
