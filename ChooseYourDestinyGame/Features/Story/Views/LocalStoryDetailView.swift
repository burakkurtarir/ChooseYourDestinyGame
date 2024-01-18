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
            Color.kSurface.ignoresSafeArea()
            
            switch gameManager.gameState {
            case .inGame:
                ScrollView {
                    ResourceBar(
                        resources: story.resources,
                        playerResources: gameManager.playerResources
                    )
                    .padding(.bottom)
                    
                    ScenarioCard(scenario: gameManager.currentScenario) { choice in
                        gameManager.makeChoice(choice)
                        updateStoryHistory()
                    }
                    
                    Spacer()
                }
            default:
                GameStateView(gameState: gameManager.gameState)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setup()
        }
    }
    
    func setup() {
        gameManager.initManager(
            playerResources: storyHistory.playerResources,
            currentScenarioId: storyHistory.currentScenarioId,
            story: story,
            gameState: storyHistory.gameState.toModel())
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
