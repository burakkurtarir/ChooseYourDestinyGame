import SwiftUI

@Observable
class StoryManager {
    var stories = [StoryModel]()
    var storiesError: String?
    var isStoriesLoading = false
    
    let storyRemoteDataSource: StoryRemoteDataSource
    
    init(storyRemoteDataSource: StoryRemoteDataSource) {
        self.storyRemoteDataSource = storyRemoteDataSource
    }
    
    func fetchStories() async {
        isStoriesLoading = true
        do {
            stories = try await storyRemoteDataSource.fetchAllStories()
        } catch {
            storiesError = error.localizedDescription
        }
        isStoriesLoading = false
    }
}

extension EnvironmentValues {
    var storyManager: StoryManager {
        get { self[StoryManagerKey.self] }
        set { self[StoryManagerKey.self] = newValue }
    }
}

private struct StoryManagerKey: EnvironmentKey {
    static var defaultValue: StoryManager = StoryManager(storyRemoteDataSource: StoryRemoteDataSourceImpl())
}
