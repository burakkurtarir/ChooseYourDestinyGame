//
//  LocalStoryListRow.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct LocalStoryListRow: View {
    let storyHistory: StoryHistoryModel
    let onTap: () -> Void
    var story: StoryModel {
        return storyHistory.getDecodedStory()!
    }
    
    var body: some View {
        VStack {
            Text(story.title)
            Text(story.description)
            Text("Current scenario id: \(storyHistory.currentScenarioId)")
            Text("State: \(storyHistory.gameState)")
            Button("PLAY") {
                onTap()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    LocalStoryListRow(storyHistory: StoryHistoryModel.examle) {
        
    }
}
