//
//  GameStateDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation

enum GameStateDTO: Codable {
    case inGame
    case victory
    case defeat
    case error(_ message: String)
}
