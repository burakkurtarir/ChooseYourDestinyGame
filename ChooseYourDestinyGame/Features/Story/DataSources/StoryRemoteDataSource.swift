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
    func fetchStoryById(_ id: Int8) async throws -> StoryModel
}

class StoryRemoteDataSourceImpl: StoryRemoteDataSource {
    private let database: PostgrestClient
    
    init() {
        self.database = SupabaseSession.shared.client.database
    }
    
    func fetchAllStories() async throws -> [StoryModel] {
        let stories: [StoryModel] = try await database
            .from("Stories")
//            .select("id, created_at, title, description, image_url, resources")
            .select()
            .execute()
            .value

        return stories
    }
    
    func fetchStoryById(_ id: Int8) async throws -> StoryModel {
        let story: StoryModel = try await database
            .from("Stories")
            .select()
            .eq("id", value: "\(id)")
            .limit(1)
            .single()
            .execute()
            .value

        return story
    }
    
}
