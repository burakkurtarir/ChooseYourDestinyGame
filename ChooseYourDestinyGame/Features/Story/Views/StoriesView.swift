//
//  StoriesView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct StoriesView: View {
    @Environment(\.storyManager) private var storyManager
    @Environment(\.navigationManager) private var navigationManager
    
    var body: some View {
        ZStack {
            if storyManager.isStoriesLoading {
                ProgressView()
            } else if let error = storyManager.storiesError {
                Text(error)
            } else {
                ForEach(storyManager.stories, id: \.id) { story in
                    StoryListRow(story: story) {
                        navigationManager.push(.storyDetail(story))
                    }
                }
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
    StoriesView()
}
