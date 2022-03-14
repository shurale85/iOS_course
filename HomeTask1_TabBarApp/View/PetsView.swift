//
//  PetsView.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 13.03.2022.
//

import SwiftUI
import PetsNetwork

struct PetsView: View {
    @EnvironmentObject var petsViewModel: PetsViewModel
    let pets:[Pet]
    var body: some View {
        NavigationView(){
            
            List(pets){ pet in
                NavigationLink(pet.name, tag: pet.name, selection: $petsViewModel.petToPresent) {
                    PetDetail(petViewModel: PetViewModel(pet: pet))
                }
            }
        }
    }
}

#if DEBUG
struct PetsView_Previews: PreviewProvider {
    
    static var previews: some View {
        PetsView(pets: Pet.getMock())
    }
}
#endif
