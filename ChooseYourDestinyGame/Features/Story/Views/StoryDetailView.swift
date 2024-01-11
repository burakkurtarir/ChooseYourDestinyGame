//
//  StoryDatailView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct StoryDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var storyHistory: StoryHistoryModel
    @State private var gameManager = GameManager()
    
    let story: StoryModel
    
    init(story: StoryModel) {
        let playerResources = story.getDefaultPlayerResources()
        
        self.story = story
        self.storyHistory = StoryHistoryModel(currentScenarioId: 1, story: story, createdAt: .now, updatedAt: .now, playerResources: playerResources, gameState: .inGame)
        
        gameManager.initManager(
            playerResources: playerResources,
            currentScenarioId: 1,
            story: story
        )
        gameManager.onGameStateChanged = listenGameState
    }
    
    var body: some View {
        ZStack {
            switch gameManager.gameState {
            case .inGame:
                VStack {
                    ResourceBar(
                        resources: story.resources,
                        playerResources: gameManager.playerResources
                    )
                    ScenarioCard(scenario: gameManager.currentScenario) { choice in
                        gameManager.makeChoice(choice)
                        updateStoryHistory()
                    }
                }
            case .error(message: let message):
                Text(message)
            case .victory:
                Text("Victory")
            case .defeat:
                Text("Defeat")
            }
        }
        .onAppear {
            modelContext.insert(storyHistory)
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
    StoryDetailView(story: StoryModel.example)
}
