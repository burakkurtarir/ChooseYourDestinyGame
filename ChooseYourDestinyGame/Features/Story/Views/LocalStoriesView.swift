//
//  LocalStoriesView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI
import SwiftData

struct LocalStoriesView: View {
    @Environment(\.navigationManager) private var navigationManager
    
    @Query(sort: [.init(\StoryHistoryModel.updatedAt, order: .reverse)])
    private var storyHistories: [StoryHistoryModel]
    
    var body: some View {
        VStack {
            ForEach(storyHistories) { history in
                if let story = history.getDecodedStory() {
                    LocalStoryListRow(storyHistory: history) {
                        navigationManager.push(.localStoryDetail(history))
                    }
                } else {
                    Text("Story Broken")
                }
            }
        }
        .navigationTitle("Local Stories")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    LocalStoriesView()
}
