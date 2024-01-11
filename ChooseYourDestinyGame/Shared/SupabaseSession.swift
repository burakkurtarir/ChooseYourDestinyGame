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
        client = SupabaseClient(supabaseURL: URL(string: "https://hbelexobqfopthoiamge.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhiZWxleG9icWZvcHRob2lhbWdlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM0NDE3MzQsImV4cCI6MjAxOTAxNzczNH0.RP1r1kpmlSStHLJ7nHThFkJ1DabtNqLc57dCe6cjhdI")
    }
}
