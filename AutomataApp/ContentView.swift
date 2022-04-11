//
//  ContentView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                Text("green color")
                    .foregroundColor(Color.theme.green)
                
                Text("red color")
                    .foregroundColor(Color.theme.red)
                
                Text("accent color")
                    .foregroundColor(Color.theme.accent)
                
                Text("secondary text color")
                    .foregroundColor(Color.theme.secText)
            }
            .font(.headline)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
