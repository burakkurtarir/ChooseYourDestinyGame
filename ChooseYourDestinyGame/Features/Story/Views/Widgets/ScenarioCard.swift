//
//  ScenarioCard.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

struct ScenarioCard: View {
    let scenario: ScenarioModel
    let onTap: (_ choice: ChoiceModel) -> Void
    
    var body: some View {
        VStack {
            Text(scenario.text)
            
            VStack {
                ForEach(scenario.choices, id: \.self) { choice in
                    Button(choice.description) {
                        onTap(choice)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ScenarioCard(scenario: ScenarioModel.example) { choice in
        
    }
}
