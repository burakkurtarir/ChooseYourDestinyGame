//
//  GameState.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 11.01.2024.
//

import Foundation

enum GameState {
    case error(message: String)
    case victory
    case defeat
    case inGame
    
    var textValue: String {
        switch self {
        case .defeat:
            return "defeat"
        case .error(message: let message):
            return "error,\(message)"
        case .victory:
            return "victory"
        case .inGame:
            return "ingame"
        }
    }
    
    static func findState(_ text: String) -> GameState {
        switch text {
        case text where text.contains("defeat"):
            return .defeat
        case text where text.contains("victory"):
            return .victory
        case text where text.contains("ingame"):
            return .inGame
        case text where text.contains("error"):
            let message = text.split(separator: ",")[1]
            return .error(message: String(message))
        default:
            return .error(message: "ERROR")
        }
    }
}
