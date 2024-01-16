//
//  StoryRemoteDataSource.swift
//  ChooseYourDestinyGame
//
//  Created by Burak Kurtarır on 10.01.2024.
//

import Foundation
import Supabase

protocol StoryRemoteDataSource {
    func fetchAllStories() async throws -> [StoryModel]
}

class StoryRemoteDataSourceImpl: StoryRemoteDataSource {
    private let database: PostgrestClient
    
    init() {
        self.database = SupabaseSession.shared.client.database
    }
    
    func fetchAllStories() async throws -> [StoryModel] {
        let stories: [StoryModel] = try await database
            .from("Stories")
            .select()
            .execute()
            .value

        return stories
    }
}
