//
//  ResourceBar.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct ResourceBar: View {
    let resources: [ResourceModel]
    let playerResources: [String: Int]
    
    var body: some View {
        HStack {
            ForEach(resources, id: \.name) { resource in
                VStack {
                    Image(systemName: "heart.fill")
                    Text("\(playerResources[resource.name] ?? 1)")
                }
            }
        }
    }
}

#Preview {
    ResourceBar(resources: [], playerResources: ["Health": 1])
}
