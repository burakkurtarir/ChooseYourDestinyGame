//
//  StoryExtensions.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation

extension ResourceModel {
    func toDTO() -> ResourceDTO {
        return ResourceDTO(change: change, name: name)
    }
}

extension ChoiceModel {
    func toDTO() -> ChoiceDTO {
        return ChoiceDTO(myId: id, title: title, definition: description, nextScenarioId: nextScenarioId)
    }
}

extension ScenarioModel {
    func toDTO() -> ScenarioDTO {
        return ScenarioDTO(myId: id, text: text, choices: choices.map{ $0.toDTO() })
    }
}

extension StoryModel {
    func toDTO() -> StoryDTO {
        return StoryDTO(myId: id, createdAt: createdAt, title: title, definition: description, imageUrl: imageUrl, scenarios: scenarios.map { $0.toDTO() }, resources: resources.map{ $0.toDTO() })
    }
}

extension GameState {
    func toDTO() -> GameStateDTO {
        switch self {
        case .defeat:
            return .defeat
        case .inGame:
            return .inGame
        case .victory:
            return .victory
        case .error(let message):
            return .error(message)
        }
    }
}

extension ResourceDTO {
    func toModel() -> ResourceModel {
        return ResourceModel(change: change, name: name)
    }
}

extension ChoiceDTO {
    func toModel() -> ChoiceModel {
        return ChoiceModel(id: myId, title: title, resources: resources.map{ $0.toModel() }, description: definition, nextScenarioId: nextScenarioId)
    }
}

extension ScenarioDTO {
    func toModel() -> ScenarioModel {
        return ScenarioModel(id: myId, text: text, choices: choices.map{ $0.toModel() })
    }
}

extension StoryDTO {
    func toModel() -> StoryModel {
        return StoryModel(id: myId, createdAt: createdAt, title: title, description: definition, imageUrl: imageUrl, scenarios: scenarios.map{ $0.toModel() }, resources: resources.map{ $0.toModel() })
    }
}

extension GameStateDTO {
    func toModel() -> GameState {
        switch self {
        case .defeat:
            return .defeat
        case .inGame:
            return .inGame
        case .victory:
            return .victory
        case .error(let message):
            return .error(message)
        }
    }
}
