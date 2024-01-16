//
//  SupabaseSession.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation
import Supabase

class SupabaseSession {
    static let shared = SupabaseSession()
    
    let client: SupabaseClient
    
    private init() {
        // TODO: Move the secret values to the environment
        client = SupabaseClient(supabaseURL: URL(string: "https://hbelexobqfopthoiamge.supabase.co")!, supabaseKey: Configuration.supabaseApiKey)
    }
}
