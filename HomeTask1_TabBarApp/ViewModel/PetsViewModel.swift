//
//  PetsViewmodel.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 14.03.2022.
//

import Foundation
import PetsNetwork

final class PetsViewModel: ObservableObject {
    
    @Published var pets: [Pet] = .init()
    //tag value of NavigationLink
    @Published var petToPresent: String? = ""
    
    init() {
        PetAPI.findPetsByStatus(status: [.available]) { (result, _) in
            self.pets = result ?? Pet.getMock()
            print("pets count: \(self.pets.count)")
        }
    }
}
