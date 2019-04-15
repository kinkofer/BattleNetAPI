//
//  D3Season.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Season: Codable {
    let seasonId: Int
    let paragonLevel: Int
    let paragonLevelHardcore: Int
    let highestHardcoreLevel: Int
    
    let kills: Kills
    let timePlayed: TimePlayed
}



// https://us.api.battle.net/data/d3/season/?namespace=2-6-US
class D3SeasonIndex: Codable {
    let _links: SelfLink<D3SeasonIndex>
    let season: [Link<D3Season>]
    
    let currentSeason: Int
    let serviceCurrentSeason: Int
    let serviceSeasonState: String
    let lastUpdateTime: String
    let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case season
        case currentSeason = "current_season"
        case serviceCurrentSeason = "service_current_season"
        case serviceSeasonState = "service_season_state"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



// https://us.api.battle.net/data/d3/season/1?namespace=2-6-US
class D3SeasonLeaderboardIndex: Codable {
    let _links: SelfLink<D3SeasonLeaderboardIndex>
    let leaderboard: [SeasonLeaderboardLink]
    let seasonID: Int
    let lastUpdateTime: String
    let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case seasonID = "season_id"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



class SeasonLeaderboardLink: Codable {
    let ladder: Link<SeasonLeaderboard>
    let heroClassString: String?
    let teamSize: Int?
    let hardcore: Bool?
    
    enum CodingKeys: String, CodingKey {
        case ladder
        case heroClassString = "hero_class_string"
        case teamSize = "team_size"
        case hardcore
    }
}



// https://us.api.battle.net/data/d3/season/1/leaderboard/achievement-points?namespace=2-6-US
class SeasonLeaderboard: Codable {
    let _links: SelfLink<SeasonLeaderboard>
    let key: String
    let title: LocaleString
    let season: Int
    
    let lastUpdateTime: String
    let generatedBy: String
    
    let row: [LeaderboardEntry]
    let column: [LeaderboardColumn]
    
    let achievementPoints: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case _links
        case key
        case title
        case season
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
        case row
        case column
        case achievementPoints = "achievement_points"
    }
}

