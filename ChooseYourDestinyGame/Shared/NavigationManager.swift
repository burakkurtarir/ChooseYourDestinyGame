//
//  Navigation.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import SwiftUI

@Observable
class NavigationManager {
    var path = [NavigationState]()
    
    func push(_ state: NavigationState) {
        path.append(state)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeAll()
    }
}

extension EnvironmentValues {
    var navigationManager: NavigationManager {
        get { self[NavigationManagerKey.self] }
        set { self[NavigationManagerKey.self] = newValue }
    }
}

private struct NavigationManagerKey: EnvironmentKey {
    static var defaultValue: NavigationManager = NavigationManager()
}
