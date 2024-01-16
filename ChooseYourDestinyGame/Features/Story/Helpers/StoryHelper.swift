//
//  StoryHelper.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 14.01.2024.
//

import Foundation

final class StoryHelper {
    static func getDefaultPlayerResources(_ resources: [ResourceModel]) -> [String: Int] {
        var dictionary = [String: Int]()
        for resource in resources {
            dictionary[resource.name] = 4
        }
        return dictionary
    }
}
