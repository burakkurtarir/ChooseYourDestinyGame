//
//  ChooseYourDestinyGameApp.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI
import SwiftData

@main
struct ChooseYourDestinyGameApp: App {
    @State private var storyManager = StoryManager(storyRemoteDataSource: StoryRemoteDataSourceImpl())
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: StoryHistoryModel.self)
        .environment(\.storyManager, storyManager)
    }
}
