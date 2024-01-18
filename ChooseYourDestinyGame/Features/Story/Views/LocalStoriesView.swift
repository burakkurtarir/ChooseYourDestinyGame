import SwiftUI
import SwiftData

struct LocalStoriesView: View {
    @Environment(\.navigationManager) private var navigationManager
    
    @Query(sort: \StoryHistoryDTO.updatedAt, order: .reverse)
    private var storyHistories: [StoryHistoryDTO]
    
    var body: some View {
        ZStack {
            Color.kSurface.ignoresSafeArea()
            
            List {
                ForEach(storyHistories) { history in
                    LocalStoryListRow(storyHistory: history) {
                        navigationManager.push(.localStoryDetail(history))
                    }
                    .background(Color.kSurfaceVariant)
                }
                .simpleListItemStyle()
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Local Stories")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

//#Preview {
//    LocalStoriesView()
//}
