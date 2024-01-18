//
//  OnboardingItem.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 18.01.2024.
//

import SwiftUI

struct OnboardingItem: View {
    let model: OnboardingModel
    let isLast: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text(model.title)
                .titleTextStyle()
                .padding(.top, 60)
            Image(model.imageName)
                .resizable()
                .scaledToFit()
            Text(model.description)
                .font(.title2)
                .foregroundStyle(.kOnSurface)
                .multilineTextAlignment(.center)
            MenuButton(text: isLast ? "START" : "NEXT") {
                onTap()
            }
            Spacer()
        }
        .padding()
        .transition(.slide)
    }
}

#Preview {
    OnboardingItem(model: OnboardingModel.models[0], isLast: false) {
        
    }
}
