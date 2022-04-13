//
//  RowSelectView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/12/22.
//

import SwiftUI

struct RowSelectView: View {
    
    let input: String
    
    @State var clicked = false
    
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                leftColumn
                Spacer()
                rightColumn
            }
            .frame(maxHeight:30)
        }
        .contentShape(Rectangle())
        .onTapGesture{
            clicked.toggle()
        }
    }
}
struct RowSelectView_Previews: PreviewProvider {
    static var previews: some View {
        RowSelectView(input: "q1")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
extension RowSelectView {
    private var leftColumn: some View{
        HStack(spacing:0) {
            Text("state \(input)")
                .font(.system(size: 17))
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
        }
        
    }

    private var rightColumn: some View {

        Image(systemName: clicked ? "checkmark.square" : "square")
            .frame(width:30,height:30)
            .font(.system(size: 25))
            .padding()
            
    }
    
    
    
}
