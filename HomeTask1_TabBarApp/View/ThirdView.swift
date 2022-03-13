//
//  ThirdView.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 13.03.2022.
//

import SwiftUI

struct ThirdView: View {
    @State var isPopupActive = false
    
    var body: some View {
        Button(action: {
            // нужно ли на onDissmiss сделать isPopupActive = false. Работает и без этого.
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
struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
#endif
