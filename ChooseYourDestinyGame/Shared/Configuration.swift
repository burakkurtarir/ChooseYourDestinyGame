//
//  Configuration.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation

final class Configuration {
    static let supabaseApiKey = Bundle.main.infoDictionary?["SUPABASE_API_KEY"] as! String
}
