//
//  LocalStoryDetailView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct LocalStoryDetailView: View {
    @State private var gameManager = GameManager()
    
    let storyHistory: StoryHistoryModel
    var story: StoryModel {
        storyHistory.getDecodedStory()!
    }
    
    init(storyHistory: StoryHistoryModel) {
        self.storyHistory = storyHistory
        
        gameManager.initManager(
            playerResources: storyHistory.playerResources,
            currentScenarioId: storyHistory.currentScenarioId,
            story: story)
        gameManager.onGameStateChanged = listenGameState
    }
    
    var body: some View {
        ZStack {
            switch gameManager.gameState {
            case .error(let message):
                Text(message)
            case .victory:
                Text("Victory")
            case .defeat:
                Text("Defeat")
            case .inGame:
                VStack {
                    ResourceBar(
                        resources: story.resources,
                        playerResources: storyHistory.playerResources)
                    
                    ScenarioCard(scenario: gameManager.currentScenario) { choice in
                        gameManager.makeChoice(choice)
                        updateStoryHistory()
                    }
                }
            }
        }
    }
    
    func updateStoryHistory() {
        storyHistory.updatedAt = .now
        storyHistory.currentScenarioId = gameManager.currentScenario.id
        storyHistory.playerResources = gameManager.playerResources
    }
    
    func listenGameState(_ state: GameState) {
        storyHistory.gameState = state.textValue
    }
}

#Preview {
    LocalStoryDetailView(storyHistory: .examle)
}
