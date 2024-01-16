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
    
    @Query(sort: \StoryHistoryDTO.updatedAt, order: .reverse)
    private var storyHistories: [StoryHistoryDTO]
    
    var body: some View {
        VStack {
            ForEach(storyHistories) { history in
                LocalStoryListRow(storyHistory: history) {
                    navigationManager.push(.localStoryDetail(history))
                }
            }
        }
        .navigationTitle("Local Stories")
        .navigationBarTitleDisplayMode(.large)
    }
}

//#Preview {
//    LocalStoriesView()
//}
