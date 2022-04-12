//
//  HomeView.swift
//  AutomataApp
//
//  Created by Andrew Kuhl on 4/11/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showMachineView: Bool = false
    
    var body: some View {
        
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                homeHeader
                Spacer()
                if !showMachineView {
                    inputList
                        .transition(.move(edge: .leading))
                }
                if showMachineView {
                    machineList
                        .transition(.move(edge: .trailing))
                }
                
                

                
                
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
        .preferredColorScheme(.dark)
        .environmentObject(dev.homeVM)
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
            Text("Automata")
                .font(.system(size: 25))
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
    
    private var inputList: some View{
        
        VStack(spacing:-5){
            HStack{
                Image(systemName: "externaldrive.badge.plus")
                    .font(.system(size: 50))
                    .padding(.bottom,50)
                    .padding(.top,50)
                    .padding(.leading,48)
                Image(systemName: "arrow.right")
                    .font(.system(size: 28))
            }
            Spacer()
            HStack{
                Text("Computations")
                    .font(.system(size: 28))
                Spacer()
            }
            .padding(.leading, 20)
            ZStack
            {
                Color.theme.background2
                    .cornerRadius(15)
                
                VStack
                {
                    if(vm.allInputs.count != 0)
                    {
                        HStack{
                            Text("Machine")
                            Spacer()
                            Text("Input")
                            Spacer()
                            Text("Result")
                        }
                        .font(.caption)
                        .foregroundColor(Color.theme.secText)
                        .padding(.trailing,15)
                        .padding(.leading,30)
                        ScrollView
                        {
                            ForEach(vm.allInputs)
                            { input in
                                InputRowView(input: input)
                            }
                        }
                        
                    }
                    else
                    {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .font(.system(size:45))
                            .padding()
                        Text("create a machine to run some input!")
                        CircleButtonView(iconName: "arrow.right")
                            .onTapGesture {
                                withAnimation(.spring()){
                                    showMachineView.toggle()
                                }
                            }
                            .scaleEffect(2)
                            .padding(.top, 20)
                    }
                    
                    
                }
                .padding()
            }
            .padding(.top)
        }
        .padding(10)
    }
    
    private var machineList: some View{
        
        VStack(spacing:-5){
            HStack{
                Text("Machines")
                    .font(.system(size: 28))
                Spacer()
            }
            .padding(.leading, 20)
            ZStack
            {
                Color.theme.background2
                    .cornerRadius(15)
                
                VStack
                {
                    if(vm.allMachines.count != 0)
                    {
                        HStack{
                            Text("Machine")
                            Spacer()
                            Text("Type")
                            Spacer()
                            Text("Inputs")
                        }
                        .font(.caption)
                        .foregroundColor(Color.theme.secText)
                        .padding(.trailing,15)
                        .padding(.leading,30)
                        ScrollView
                        {
                            ForEach(vm.allMachines)
                            { machine in
                                MachineRowView(machine: machine)
                            }
                        }
                        
                    }
                    else
                    {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .font(.system(size:45))
                            .padding()
                        Text("create a machine and run some input!")
                    }
                    
                    
                }
                .padding()
            }
            .padding(.top)
        }
        .padding(10)
    }
}
