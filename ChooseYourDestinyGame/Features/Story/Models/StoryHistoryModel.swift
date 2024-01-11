//
//  StoryHistoryModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation
import SwiftData

@Model
final class StoryHistoryModel {
    var currentScenarioId: Int
    let storyData: Data?
    let createdAt: Date
    var updatedAt: Date
    var playerResources: [String: Int]
    var gameState: String
    
    init(currentScenarioId: Int, story: StoryModel?, createdAt: Date, updatedAt: Date, playerResources: [String : Int], gameState: GameState) {
        self.currentScenarioId = currentScenarioId
        self.storyData = try? JSONEncoder().encode(story)
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.playerResources = playerResources
        self.gameState = gameState.textValue
    }
    
//    init(currentScenarioId: Int, storyData: Data?, createdAt: Date, updatedAt: Date, playerResources: [String : Int], gameState: String) {
//        self.currentScenarioId = currentScenarioId
//        self.storyData = storyData
//        self.createdAt = createdAt
//        self.updatedAt = updatedAt
//        self.playerResources = playerResources
//        self.gameState = gameState
//    }
    
    func getDecodedStory() -> StoryModel? {
        guard let data = storyData else { return nil }
        return try? JSONDecoder().decode(StoryModel.self, from: data)
    }
    
    static let examle = StoryHistoryModel(currentScenarioId: 1, story: StoryModel.example, createdAt: .now, updatedAt: .now, playerResources: StoryModel.example.getDefaultPlayerResources(), gameState: .inGame)
}
