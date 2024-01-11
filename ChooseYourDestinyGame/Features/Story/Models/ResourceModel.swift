//
//  ResourceModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation

@Observable
final class ResourceModel: Codable, Hashable {
    let change: Int
    let name: String
    
    init(change: Int, name: String) {
        self.change = change
        self.name = name
    }
    
    enum CodingKeys: CodingKey {
        case change
        case name
        case _$observationRegistrar
    }
    
    static func == (lhs: ResourceModel, rhs: ResourceModel) -> Bool {
        return lhs.change == rhs.change && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static let example = ResourceModel(change: 1, name: "Eco-Friendliness")
    static let example2 = ResourceModel(change: 3, name: "Health")
}
