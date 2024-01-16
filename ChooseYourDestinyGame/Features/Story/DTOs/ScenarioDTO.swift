//
//  ScenarioDTO.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//


import Foundation
import SwiftData

@Model
final class ScenarioDTO {
    let myId: Int
    let text: String
    let choices: [ChoiceDTO]
    
    init(myId: Int, text: String, choices: [ChoiceDTO] = []) {
        self.myId = myId
        self.text = text
        self.choices = choices
    }
}
