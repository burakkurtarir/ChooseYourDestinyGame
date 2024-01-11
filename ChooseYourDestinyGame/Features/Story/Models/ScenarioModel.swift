//
//  ScenarioModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation

@Observable
final class ScenarioModel: Codable, Hashable {
    let id: Int
    let text: String
    let choices: [ChoiceModel]
    
    init(id: Int, text: String, choices: [ChoiceModel]) {
        self.id = id
        self.text = text
        self.choices = choices
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case choices
        case _$observationRegistrar
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
    }
    
    static func == (lhs: ScenarioModel, rhs: ScenarioModel) -> Bool {
        return lhs.id == rhs.id && lhs.text == rhs.text && lhs.choices == rhs.choices
    }
    
    static let example = ScenarioModel(
        id: 1, text: "You start your journey in a small town known for its commitment to eco-friendly living. Your first decision involves choosing a mode of transportation to navigate the town.",
        choices: [ChoiceModel.example, ChoiceModel.example2]
    )
}
