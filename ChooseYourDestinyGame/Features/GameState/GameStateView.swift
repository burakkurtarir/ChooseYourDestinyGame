//
//  GameResultView.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 17.01.2024.
//

import SwiftUI

struct GameStateView: View {
    @Environment(\.navigationManager) private var navigationManager
    
    let gameState: GameState
    
    var body: some View {
        ZStack {
            Color.kSurface.ignoresSafeArea()
            
            switch gameState {
            case .defeat:
                VStack(spacing: 30) {
                    Text("DEFEAT")
                        .titleTextStyle()
                    Image(systemName: "figure.fall")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(.kError)
                    MenuButton(text: "CONTINUE") {
                        navigationManager.popToRoot()
                    }
                    .padding(.top, 32)
                }
            case .victory:
                VStack(spacing: 30) {
                    Text("VICTORY")
                        .titleTextStyle()
                    Image(systemName: "figure.dance")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(.kSuccess)
                    MenuButton(text: "CONTINUE") {
                        navigationManager.popToRoot()
                    }
                    .padding(.top, 32)
                }
            case .inGame:
                VStack(spacing: 30) {
                    Text("IN GAME")
                        .titleTextStyle()
                    Image(systemName: "figure.skiing.downhill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(.kOnSurface)
                    MenuButton(text: "CONTINUE") {
                        navigationManager.popToRoot()
                    }
                    .padding(.top, 32)
                }
            case .error(let message):
                VStack(spacing: 30) {
                    Text(message.uppercased())
                        .titleTextStyle()
                    Image(systemName: "figure.walk")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(.kOnSurface)
                    MenuButton(text: "CONTINUE") {
                        navigationManager.popToRoot()
                    }
                    .padding(.top, 32)
                }
            }
        }
    }
}

#Preview {
    GameStateView(gameState: .error("Broken Story"))
}
