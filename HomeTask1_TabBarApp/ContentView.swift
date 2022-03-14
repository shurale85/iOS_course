//
//  ContentView.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 05.03.2022.
//

import SwiftUI
import PetsNetwork



struct ContentView: View {
    
    @State private var selection = 0
    @EnvironmentObject var petsViewModel: PetsViewModel
    
    var body: some View {
        
        TabView(selection: $selection) {
            MainView(tab: $selection)
                .tabItem {
                    Image(systemName: "star")
                    Text("main")
                }
                .tag(0)

            PetsView(pets: petsViewModel.pets)
            .tabItem {
                Image(systemName: "pawprint.circle")
                Text("Pets")
            }
            .tag(1)
            
            ThirdView()
            .tabItem {
                Image(systemName: "star")
                Text("chevron.up.square")
            }
            .tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
