//
//  TitleTextModifier.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 17.01.2024.
//

import SwiftUI

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.kOnSurface)
            .multilineTextAlignment(.center)
            .padding(.top)
    }
}

extension View {
    func titleTextStyle() -> some View {
        self.modifier(TitleTextModifier())
    }
}
