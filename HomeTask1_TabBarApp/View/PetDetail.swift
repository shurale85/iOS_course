//
//  PetDetail.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 13.03.2022.
//

import SwiftUI
import PetsNetwork

struct PetDetail: View {
    
    //стоило ли тут заводить вьюмодель, она просто дулблирует модель
    let petViewModel: PetViewModel
    
    var body: some View {
        VStack {
            Text(petViewModel.pet.name)
                .font(.title)
            
            Text(String(petViewModel.pet.id ?? 0))
            Text(petViewModel.pet.category?.name ?? "unknown")
        }
    }
}

struct PetDetail_Previews: PreviewProvider {
    static var previews: some View {
        PetDetail(petViewModel: PetViewModel(pet: Pet.getMock().first!))
    }
}
