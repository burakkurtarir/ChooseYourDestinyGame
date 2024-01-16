//
//  ChoiceModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation
import Observation

@Observable
final class ChoiceModel: Decodable, Hashable {
    let id: Int
    let title: String
    let resources: [ResourceModel]
    let description: String
    let nextScenarioId: Int?
    
    init(id: Int, title: String, resources: [ResourceModel] = [], description: String, nextScenarioId: Int?) {
        self.id = id
        self.title = title
        self.resources = resources
        self.description = description
        self.nextScenarioId = nextScenarioId
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case resources
        case description
        case nextScenarioId = "next_scenario_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.resources = try container.decode([ResourceModel].self, forKey: .resources)
        self.description = try container.decode(String.self, forKey: .description)
        self.nextScenarioId = try? container.decode(Int.self, forKey: .nextScenarioId)
    }
    
    static func == (lhs: ChoiceModel, rhs: ChoiceModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.resources == rhs.resources && lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static let example = ChoiceModel(
        id: 1,
        title: "Bicycle Commute",
        resources: [ResourceModel.example, ResourceModel.example],
        description: "Choose to ride a bicycle, promoting eco-friendliness and personal health.",
        nextScenarioId: 2
    )
    
    static let example2 = ChoiceModel(
        id: 1,
        title: "Bicycle Commute",
        resources: [ResourceModel.example, ResourceModel.example2],
        description: "Choose to ride a bicycle.",
        nextScenarioId: 2
    )
}
