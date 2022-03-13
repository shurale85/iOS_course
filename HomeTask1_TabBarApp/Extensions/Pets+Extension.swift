//
//  Pets+Extension.swift
//  HomeTask1_TabBarApp
//
//  Created by Radik Nuriev on 13.03.2022.
//

import Foundation
import PetsNetwork

extension Pet{
    
    static func getMock() -> [Pet] {
        (0...10).map{ index in
            Pet(id: index, name: "Pet \(index!)", photoUrls: [])
        }
    }
}
