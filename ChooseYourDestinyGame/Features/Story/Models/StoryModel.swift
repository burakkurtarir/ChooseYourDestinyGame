//
//  StoryModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation
import Observation

@Observable
final class StoryModel: Decodable, Hashable {
    let id: Int8
    let createdAt: Date
    let title: String
    let description: String
    let imageUrl: String?
    let scenarios: [ScenarioModel]
    let resources: [ResourceModel]
    
    init(id: Int8, createdAt: Date, title: String, description: String, imageUrl: String?, scenarios: [ScenarioModel] = [], resources: [ResourceModel] = []) {
        self.id = id
        self.createdAt = createdAt
        self.title = title
        self.description = description
        self.imageUrl = imageUrl
        self.scenarios = scenarios
        self.resources = resources
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case title
        case description
        case imageUrl = "image_url"
        case scenarios
        case resources
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int8.self, forKey: .id)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageUrl = try? container.decode(String.self, forKey: .imageUrl)
        self.scenarios = try container.decode([ScenarioModel].self, forKey: .scenarios)
        self.resources = try container.decode([ResourceModel].self, forKey: .resources)
    }
    
    static func == (lhs: StoryModel, rhs: StoryModel) -> Bool {
        return lhs.id == rhs.id && lhs.createdAt == rhs.createdAt && lhs.title == rhs.title && lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static let example = StoryModel(
        id: 1,
        createdAt: .now,
        title: "EcoHarmony: Navigating the Green Path",
        description: "EcoHarmony: Navigating the Green Path invites players to make impactful choices in a town dedicated to sustainability. From eco-friendly transportation to community clean-ups, each decision shapes the environmental impact, health, and community support. Will you champion renewable energy, advocate for green initiatives, or prioritize personal well-being? This short story challenges players to navigate the delicate balance between individual choices and community values, fostering a harmonious and eco-conscious town.",
        imageUrl: "https://static.wikia.nocookie.net/feign/images/1/1f/Mad.png",
        scenarios: [ScenarioModel.example],
        resources: [ResourceModel.example, ResourceModel.example2, ResourceModel.example, ResourceModel.example2]
    )
}
