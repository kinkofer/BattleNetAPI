//
//  D3Season.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class D3Season: Codable {
    public let seasonId: Int
    public let paragonLevel: Int
    public let paragonLevelHardcore: Int
    public let highestHardcoreLevel: Int
    
    public let kills: Kills
    public let timePlayed: TimePlayed
}



// https://us.api.battle.net/data/d3/season/?namespace=2-6-US
public class D3SeasonIndex: Codable, SelfDecodable {
    public let _links: SelfLink<D3SeasonIndex>
    public let season: [Link<D3Season>]
    
    public let currentSeason: Int
    public let serviceCurrentSeason: Int
    public let serviceSeasonState: String
    public let lastUpdateTime: String
    public let generatedBy: String
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/season/1?namespace=2-6-US
public class D3SeasonLeaderboardIndex: Codable {
    public let _links: SelfLink<D3SeasonLeaderboardIndex>
    public let leaderboard: [SeasonLeaderboardLink]
    public let seasonID: Int
    public let lastUpdateTime: String
    public let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case seasonID = "season_id"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



public class SeasonLeaderboardLink: Codable, SelfDecodable {
    public let ladder: Link<SeasonLeaderboard>
    public let heroClassString: String?
    public let teamSize: Int?
    public let hardcore: Bool?
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/season/1/leaderboard/achievement-points?namespace=2-6-US
public class SeasonLeaderboard: Codable, SelfDecodable {
    public let _links: SelfLink<SeasonLeaderboard>
    public let key: String
    public let title: LocaleString
    public let season: Int
    
    public let lastUpdateTime: String
    public let generatedBy: String
    
    public let row: [LeaderboardEntry]
    public let column: [LeaderboardColumn]
    
    public let achievementPoints: Bool
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

