//
//  NavigationState.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation

enum NavigationState: Hashable {
    case stories
    case storyDetail(_ story: StoryModel)
    case menu
    case credits
    case localStories
    case localStoryDetail(_ storyHistory: StoryHistoryModel)
}
