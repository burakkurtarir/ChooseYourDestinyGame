//
//  StoryManager.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

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
        do {
            stories = try await storyRemoteDataSource.fetchAllStories()
        } catch let error as NSError {
            print(error.description)
            storiesError = error.localizedDescription
        } catch {
            storiesError = error.localizedDescription
        }
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
