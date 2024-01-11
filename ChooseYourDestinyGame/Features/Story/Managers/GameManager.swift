//
//  GameplayManager.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation

@Observable
class GameManager {
    var playerResources = [String: Int]()
    var story = StoryModel.example
    var gameState = GameState.inGame
    var currentScenario = ScenarioModel.example
    var onGameStateChanged: ((_ state: GameState) -> Void)?
    
    func initManager(playerResources: [String: Int], currentScenarioId: Int, story: StoryModel, gameState: GameState = .inGame) {
        self.story = story
        self.playerResources = playerResources
        self.gameState = gameState
       
        if let currentScenario = story.scenarios.first(where: { $0.id == currentScenarioId }) {
            self.currentScenario = currentScenario
        } else {
            changeGameState(.error(message: "Current Scenario Not Found"))
        }
    }
    
    func makeChoice(_ choice: ChoiceModel) {
        if choice.nextScenarioId == nil {
            changeGameState(.victory)
        } else {
            goNextScenario(choice)
        }
    }
    
    private func goNextScenario(_ choice: ChoiceModel) {
        guard let nextScenario = story.scenarios.first(where: { $0.id == choice.nextScenarioId }) else { return }
        
        currentScenario = nextScenario
        updateResources(choice.resources)
        checkIfAnyResourceExhausted()
    }
    
    private func changeGameState(_ state: GameState) {
        gameState = state
        onGameStateChanged?(state)
    }
    
    private func updateResources(_ choiceResources: [ResourceModel]) {
        for resource in choiceResources {
            if let resourceLevel = playerResources[resource.name] {
                playerResources[resource.name] = resourceLevel + resource.change
            }
        }
    }
    
    private func checkIfAnyResourceExhausted() {
        for resourceLevel in playerResources.values {
            if resourceLevel <= 0 {
                return changeGameState(.defeat)
            }
        }
    }
}
