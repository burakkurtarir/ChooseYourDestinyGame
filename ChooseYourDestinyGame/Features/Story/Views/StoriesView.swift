import SwiftUI

struct StoriesView: View {
    @Environment(\.storyManager) private var storyManager
    @Environment(\.navigationManager) private var navigationManager
    
    var body: some View {
        ZStack {
            Color.kSurface.ignoresSafeArea()
            
            if storyManager.isStoriesLoading {
                ProgressView()
            } else if let error = storyManager.storiesError {
                Text(error)
            } else {
                List {
                    ForEach(storyManager.stories, id: \.id) { story in
                        StoryListRow(story: story) {
                            navigationManager.push(.storyDetail(story))
                        }
                        .background(Color.kSurfaceVariant)
                    }
                    .simpleListItemStyle()
                }
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle("Stories")
        .navigationBarTitleDisplayMode(.large)
        .task {
            await storyManager.fetchStories()
        }
    }
}

#Preview {
    NavigationStack {
        StoriesView()
    }
}
