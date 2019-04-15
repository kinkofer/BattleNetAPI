//
//  Era.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/d3/era/?namespace=2-6-US
class EraIndex: Codable {
    let _links: SelfLink<EraIndex>
    let era: [Link<EraLeaderboardIndex>]
    let currentEra: Int
    let lastUpdateTime: String
    let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case era
        case currentEra = "current_era"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



// https://us.api.battle.net/data/d3/era/1?namespace=2-6-US
class EraLeaderboardIndex: Codable {
    let _links: SelfLink<EraLeaderboardIndex>
    let leaderboard: [EraLeaderboardLink]
    let eraId: Int
    let eraStartDate: Double
    let lastUpdateTime: String
    let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case eraId = "era_id"
        case eraStartDate = "era_start_date"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



class EraLeaderboardLink: Codable {
    let ladder: Link<EraLeaderboard>
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



// https://us.api.battle.net/data/d3/era/1/leaderboard/rift-barbarian?namespace=2-6-US
class EraLeaderboard: Codable {
    let _links: SelfLink<EraLeaderboard>
    let key: String
    let title: LocaleString
    let era: Int
    
    let lastUpdateTime: String
    let generatedBy: String
    
    let row: [LeaderboardEntry]
    let column: [LeaderboardColumn]
    
    let greaterRiftSoloClass: String
    let greaterRift: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case _links
        case key
        case title
        case era
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
        case row
        case column
        case greaterRiftSoloClass = "greater_rift_solo_class"
        case greaterRift = "greater_rift"
    }
}

