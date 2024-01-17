//
//  RootView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct RootView: View {
    @State private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            Group {
                MenuView()
            }
            .navigationDestination(for: NavigationState.self) { state in
                switch state {
                case .credits:
                    Text("Credits")
                case .stories:
                    StoriesView()
                case .storyDetail(let story):
                    StoryDetailView(story: story)
                case .menu:
                    Text("Menu")
                case .localStories:
                    LocalStoriesView()
                case .localStoryDetail(let storyHistory):
                    LocalStoryDetailView(storyHistory: storyHistory)
                }
            }
        }
        .environment(\.navigationManager, navigationManager)
    }
}

#Preview {
    RootView()
}
