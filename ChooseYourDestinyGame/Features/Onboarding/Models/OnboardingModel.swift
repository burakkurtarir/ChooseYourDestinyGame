//
//  OnboardingModel.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 18.01.2024.
//

import Foundation

struct OnboardingModel: Hashable {
    let imageName: String
    let title: String
    let description: String
    
    static let models = [
        OnboardingModel(
            imageName: "scary_background",
            title: "WELCOME TO THE APP",
            description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
        ),
        OnboardingModel(
            imageName: "scary_background_2",
            title: "EXPLORE STORIES",
            description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
        )
    ]
}
