//
//  StoryDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class StoryDTO {
    let myId: Int8
    let createdAt: Date
    let title: String
    let definition: String
    let imageUrl: String?
    let scenarios: [ScenarioDTO]
    let resources: [ResourceDTO]
    
    init(myId: Int8, createdAt: Date, title: String, definition: String, imageUrl: String?, scenarios: [ScenarioDTO] = [], resources: [ResourceDTO] = []) {
        self.myId = myId
        self.createdAt = createdAt
        self.title = title
        self.definition = definition
        self.imageUrl = imageUrl
        self.scenarios = scenarios
        self.resources = resources
    }
}

