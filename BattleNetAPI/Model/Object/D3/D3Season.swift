//
//  D3Season.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Season: Codable {
    var seasonId: Int = 0
    var paragonLevel: Int = 0
    var paragonLevelHardcore: Int = 0
    var highestHardcoreLevel: Int = 0
    
    var kills: Kills = Kills()
    var timePlayed: TimePlayed = TimePlayed()
}



// https://us.api.battle.net/data/d3/season/?namespace=2-6-US
class D3SeasonIndex: Codable {
    var _links: SelfLink<D3SeasonIndex> = SelfLink<D3SeasonIndex>()
    var season: [Link<D3Season>] = [Link<D3Season>]()
    
    var currentSeason: Int = 0
    var serviceCurrentSeason: Int = 0
    var serviceSeasonState: String = ""
    var lastUpdateTime: String = ""
    var generatedBy: String = ""
    
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
    var _links: SelfLink<D3SeasonLeaderboardIndex> = SelfLink<D3SeasonLeaderboardIndex>()
    var leaderboard: [SeasonLeaderboardLink] = [SeasonLeaderboardLink]()
    var seasonID: Int = 0
    var lastUpdateTime: String = ""
    var generatedBy: String = ""
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case seasonID = "season_id"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



class SeasonLeaderboardLink: Codable {
    var ladder: Link<SeasonLeaderboard> = Link<SeasonLeaderboard>()
    var heroClassString: String? = nil
    var teamSize: Int? = nil
    var hardcore: Bool? = nil
    
    enum CodingKeys: String, CodingKey {
        case ladder
        case heroClassString = "hero_class_string"
        case teamSize = "team_size"
        case hardcore
    }
}



// https://us.api.battle.net/data/d3/season/1/leaderboard/achievement-points?namespace=2-6-US
class SeasonLeaderboard: Codable {
    var _links: SelfLink<SeasonLeaderboard> = SelfLink<SeasonLeaderboard>()
    var key: String = ""
    var title: LocaleString = LocaleString()
    var season: Int = 0
    
    var lastUpdateTime: String = ""
    var generatedBy: String = ""
    
    var row: [LeaderboardEntry] = [LeaderboardEntry]()
    var column: [LeaderboardColumn] = [LeaderboardColumn]()
    
    var achievementPoints: Bool = false
    
    
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

