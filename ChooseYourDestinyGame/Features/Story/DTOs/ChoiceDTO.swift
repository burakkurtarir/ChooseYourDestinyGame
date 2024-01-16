//
//  ChoiceDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class ChoiceDTO {
    let myId: Int
    let title: String
    let resources: [ResourceDTO]
    let definition: String
    let nextScenarioId: Int?
    
    init(myId: Int, title: String, resources: [ResourceDTO] = [], definition: String, nextScenarioId: Int?) {
        self.myId = myId
        self.title = title
        self.resources = resources
        self.definition = definition
        self.nextScenarioId = nextScenarioId
    }
}

