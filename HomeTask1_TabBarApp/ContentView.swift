//
//  ContentView.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 05.03.2022.
//

import SwiftUI
import PetsNetwork

class PetsViewModel: ObservableObject {
    
    @Published var pets: [Pet] = .init()
    //tag value of NavigationLink
    var petToPresent: String? = ""
    
    init() {
        PetAPI.findPetsByStatus(status: [.available]) { (result, _) in
            self.pets = result ?? Pet.getMock()
            print("pets count: \(self.pets.count)")
        }
    }
}

struct ContentView: View {
    
    @State private var selection = 2
   // @StateObject var petsViewModel: PetsViewModel = .init()
    
    @EnvironmentObject var petsViewModel: PetsViewModel
    
    var body: some View {
        
        TabView(selection: $selection) {
            MainView(tab: $selection)
                .tabItem {
                    Image(systemName: "star")
                    Text("main")
                }
                .tag(0)

            SecondScreen(pets: petsViewModel.pets)
            .tabItem {
                Image(systemName: "star")
                Text("main")
            }
            .tag(1)
            
            ThirdView()
            .tabItem {
                Image(systemName: "star")
                Text("main")
            }
            .tag(2)
        }
    }
}

struct SecondScreen: View {
    
    @State var name: String? = nil
    let pets:[Pet]
    var body: some View {
        NavigationView(){
            
            List(pets){ pet in
//                NavigationLink(
//                    destination: PetDetail(petViewModel: PetViewModel(pet: pet)),
//                    label: {
//                        Text(pet.name)
//                    }
//                    )
                NavigationLink(pet.name, tag: pet.name, selection: $name) {
                    PetDetail(petViewModel: PetViewModel(pet: pet))
                    
                }
                
}
            }
        }
    }

struct ThirdScreen: View{
    @State var isPopupActive = false
    
    var body: some View {
        Button(action: {
            // нужно ли на onDissmiss сделать isPopupActive = false. Работает и без этого
           isPopupActive = true
        })
        {
            Text("Open popup")
        }
        .sheet(isPresented: $isPopupActive)
        {
            Text("Popup")
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
