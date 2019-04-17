//
//  Era.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/d3/era/?namespace=2-6-US
class EraIndex: Codable, SelfDecodable {
    let _links: SelfLink<EraIndex>
    let era: [Link<EraLeaderboardIndex>]
    let currentEra: Int
    let lastUpdateTime: String
    let generatedBy: String
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/era/1?namespace=2-6-US
class EraLeaderboardIndex: Codable {
    let _links: SelfLink<EraLeaderboardIndex>
    let leaderboard: [EraLeaderboardLink]
    let eraID: Int
    let eraStartDate: Double
    let lastUpdateTime: String
    let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case eraID = "era_id"
        case eraStartDate = "era_start_date"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



class EraLeaderboardLink: Codable, SelfDecodable {
    let ladder: Link<EraLeaderboard>
    let heroClassString: String?
    let teamSize: Int?
    let hardcore: Bool?
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/era/1/leaderboard/rift-barbarian?namespace=2-6-US
class EraLeaderboard: Codable, SelfDecodable {
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
    
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

