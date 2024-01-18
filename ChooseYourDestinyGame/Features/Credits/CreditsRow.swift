//
//  CreditsRow.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 17.01.2024.
//

import SwiftUI

struct CreditsRow: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .fontWeight(.bold)
                .font(.title3)
                .foregroundStyle(.kOnSurface)
            Text(subtitle)
                .font(.title3)
                .foregroundStyle(.kOnSurface)
        }
    }
}

#Preview {
    CreditsRow(title: "Game Designer", subtitle: "Burak Kurtarır")
}
