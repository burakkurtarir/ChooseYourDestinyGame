//
//  LocalStoryDetailView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct LocalStoryDetailView: View {
    @State private var gameManager = GameManager()
    
    let storyHistory: StoryHistoryDTO
    var story: StoryModel {
        storyHistory.story.toModel()
    }
    
    init(storyHistory: StoryHistoryDTO) {
        self.storyHistory = storyHistory
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
                        playerResources: gameManager.playerResources)
                    
                    ScenarioCard(scenario: gameManager.currentScenario) { choice in
                        gameManager.makeChoice(choice)
                        updateStoryHistory()
                    }
                }
            }
        }
        .onAppear {
            setup()
        }
    }
    
    func setup() {
        gameManager.initManager(
            playerResources: storyHistory.playerResources,
            currentScenarioId: storyHistory.currentScenarioId,
            story: story)
        gameManager.onGameStateChanged = listenGameState
    }
    
    func updateStoryHistory() {
        storyHistory.updatedAt = .now
        storyHistory.currentScenarioId = gameManager.currentScenario.id
        storyHistory.playerResources = gameManager.playerResources
    }
    
    func listenGameState(_ state: GameState) {
        storyHistory.gameState = state.toDTO()
    }
}

//#Preview {
//    LocalStoryDetailView(storyHistory: .examle)
//}
