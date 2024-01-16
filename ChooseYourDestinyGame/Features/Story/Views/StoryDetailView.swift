//
//  StoryDatailView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct StoryDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var storyHistory: StoryHistoryDTO?
    @State private var gameManager = GameManager()
    
    let story: StoryModel
    
    init(story: StoryModel) {
        self.story = story
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
            setup()
            guard let storyHistory else { return }
            modelContext.insert(storyHistory)
        }
    }
    
    func setup() {
        let playerResources = StoryHelper.getDefaultPlayerResources(self.story.resources)
        
        gameManager.initManager(
            playerResources: playerResources,
            currentScenarioId: 1,
            story: story)
        gameManager.onGameStateChanged = listenGameState
        
        storyHistory = StoryHistoryDTO(currentScenarioId: 1, story: story.toDTO(), createdAt: .now, updatedAt: .now, playerResources: playerResources, gameState: .inGame)
    }
    
    func updateStoryHistory() {
        // Maybe error handling here, maybe
        guard let storyHistory else { return }
        storyHistory.updatedAt = .now
        storyHistory.currentScenarioId = gameManager.currentScenario.id
        storyHistory.playerResources = gameManager.playerResources
    }
    
    func listenGameState(_ state: GameState) {
        // Maybe error handling here, maybe
        guard let storyHistory else { return }
        storyHistory.gameState = state.toDTO()
    }
}

#Preview {
    StoryDetailView(story: StoryModel.example)
}
