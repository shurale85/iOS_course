//
//  MainView.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 13.03.2022.
//

import SwiftUI

struct MainView: View{
    
    @EnvironmentObject var petsViewModel: PetsViewModel
    
    @Binding var tab: Int
    var body: some View {
        Button(
            action: {
                self.tab = 1
                petsViewModel.petToPresent = petsViewModel.pets.first?.name
            })
            {
                Text("Move to Tab2")
                    .padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                            .shadow(color: .blue, radius: 10.0)
                    )
            }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tab: .constant(0))
    }
}
#endif
