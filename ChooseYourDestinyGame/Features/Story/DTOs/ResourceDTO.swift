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
    
    init(change: Int, name: String) {
        self.change = change
        self.name = name
    }
}
