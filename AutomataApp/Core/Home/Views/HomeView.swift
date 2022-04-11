//
//  HomeView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showMachineView: Bool = false
    
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
            CircleButtonView(iconName: showMachineView ? "macwindow.badge.plus": "info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showMachineView)
                )
            Spacer()
            Text(showMachineView ? "Machines" : "Automata")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "arrow.right")
                .rotationEffect(Angle(degrees:  showMachineView ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showMachineView.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
}
