//
//  StoryHistoryDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftData

@Model
final class StoryHistoryDTO {
    var currentScenarioId: Int
    let story: StoryDTO
    let createdAt: Date
    var updatedAt: Date
    var playerResources: [String: Int]
    var gameState: GameStateDTO
    
    init(currentScenarioId: Int, story: StoryDTO, createdAt: Date, updatedAt: Date, playerResources: [String : Int], gameState: GameStateDTO) {
        self.currentScenarioId = currentScenarioId
        self.story = story
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.playerResources = playerResources
        self.gameState = gameState
    }
}
