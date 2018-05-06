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
    var _links: SelfLink<EraIndex> = SelfLink<EraIndex>()
    var era: [Link<EraLeaderboardIndex>] = [Link<EraLeaderboardIndex>]()
    var currentEra: Int = 0
    var lastUpdateTime: String = ""
    var generatedBy: String = ""
    
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
    var _links: SelfLink<EraLeaderboardIndex> = SelfLink<EraLeaderboardIndex>()
    var leaderboard: [EraLeaderboardLink] = [EraLeaderboardLink]()
    var eraId: Int = 0
    var eraStartDate: Double = 0
    var lastUpdateTime: String = ""
    var generatedBy: String = ""
    
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
    var ladder: Link<EraLeaderboard> = Link<EraLeaderboard>()
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



// https://us.api.battle.net/data/d3/era/1/leaderboard/rift-barbarian?namespace=2-6-US
class EraLeaderboard: Codable {
    var _links: SelfLink<EraLeaderboard> = SelfLink<EraLeaderboard>()
    var key = ""
    var title = LocaleString()
    var era = 0
    
    var lastUpdateTime = ""
    var generatedBy = ""
    
    var row = [LeaderboardEntry]()
    var column = [LeaderboardColumn]()
    
    var greaterRiftSoloClass: String = ""
    let greaterRift: Bool = false
    
    
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

