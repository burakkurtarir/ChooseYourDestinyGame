//
//  LocalStoryListRow.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct LocalStoryListRow: View {
    let storyHistory: StoryHistoryDTO
    let onTap: () -> Void
    
    var story: StoryModel {
        storyHistory.story.toModel()
    }
    
    var body: some View {
        VStack {
            Text(story.title)
            Text(story.description)
            Text("Current scenario id: \(storyHistory.currentScenarioId)")
            Text("State: ")
            Button("PLAY") {
                onTap()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

//#Preview {
//    LocalStoryListRow(storyHistory: StoryHistoryModel.examle) {
//
//    }
//}
