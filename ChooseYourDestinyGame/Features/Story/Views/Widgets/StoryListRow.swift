//
//  StoryListRow.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct StoryListRow: View {
    let story: StoryModel
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Text(story.title)
            Text(story.description)
            Button("PLAY") {
                onTap()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    StoryListRow(story: StoryModel.example) {
        
    }
}
