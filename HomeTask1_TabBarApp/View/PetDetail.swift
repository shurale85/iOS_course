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
            //Text(petViewModel.pet.category?.name ?? "unknown")
            TextView(text: petViewModel.pet.category?.name ?? "unknown")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight:.infinity,
                       alignment: .center) //не центрирует
                
        }
    }
}

struct TextView: UIViewRepresentable {
    
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct PetDetail_Previews: PreviewProvider {
    static var previews: some View {
        PetDetail(petViewModel: PetViewModel(pet: Pet.getMock().first!))
    }
}
