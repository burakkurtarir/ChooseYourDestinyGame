//
//  GameState.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 11.01.2024.
//

import Foundation

enum GameState: Codable {
    case inGame
    case victory
    case defeat
    case error(_ message: String)
}
