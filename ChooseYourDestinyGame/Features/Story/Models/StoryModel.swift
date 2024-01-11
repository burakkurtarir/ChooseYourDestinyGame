//
//  StoryModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation

@Observable
final class StoryModel: Codable, Hashable {
    let id: Int8
    let createdAt: Date
    let title: String
    let description: String
    let imageUrl: String?
    let scenarios: [ScenarioModel]
    let resources: [ResourceModel]
    
    func getDefaultPlayerResources() -> [String: Int] {
        var dictionary = [String: Int]()
        for resource in resources {
            dictionary[resource.name] = 4
        }
        return dictionary
    }
    
    init(id: Int8, createdAt: Date, title: String, description: String, imageUrl: String?, scenarios: [ScenarioModel], resources: [ResourceModel]) {
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
        case _$observationRegistrar
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: StoryModel, rhs: StoryModel) -> Bool {
        return lhs.id == rhs.id
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
