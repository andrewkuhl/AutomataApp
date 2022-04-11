//
//  HomeView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showNewMachine: Bool = false
    
    var body: some View {
        
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            
            //
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
        
    }
}

extension HomeView {
    
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showNewMachine ? "macwindow.badge.plus": "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showNewMachine)
                )
            Spacer()
            Text(showNewMachine ? "Machines" : "Automata")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "arrow.right")
                .rotationEffect(Angle(degrees:  showNewMachine ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showNewMachine.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
}
