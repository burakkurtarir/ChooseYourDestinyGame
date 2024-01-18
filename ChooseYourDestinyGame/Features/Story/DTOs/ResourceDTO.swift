//
//  ResourceDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class ResourceDTO {
    let change: Int
    let name: String
    let icon: String
    
    init(change: Int, name: String, icon: String) {
        self.change = change
        self.name = name
        self.icon = icon
    }
}
