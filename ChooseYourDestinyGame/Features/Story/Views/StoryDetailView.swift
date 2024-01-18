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
        guard let storyHistory else { return }
        storyHistory.updatedAt = .now
        storyHistory.currentScenarioId = gameManager.currentScenario.id
        storyHistory.playerResources = gameManager.playerResources
    }
    
    func listenGameState(_ state: GameState) {
        guard let storyHistory else { return }
        storyHistory.gameState = state.toDTO()
    }
}

//#Preview {
//    NavigationStack {
//        StoryDetailView(story: StoryModel.example)
//    }
//}
