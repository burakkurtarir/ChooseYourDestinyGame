//
//  MenuButton.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 17.01.2024.
//

import SwiftUI

struct MenuButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(text)
                .padding(.vertical)
                .frame(width: 240)
        })
        .buttonStyle(.borderedProminent)
        .foregroundStyle(.kOnPrimary)
        .fontWeight(.semibold)
        .tint(.kPrimary)
    }
}

#Preview {
    MenuButton(text: "NEW GAME") {
        
    }
}
