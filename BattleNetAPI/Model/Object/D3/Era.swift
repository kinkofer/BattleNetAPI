//
//  Era.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/d3/era/?namespace=2-6-US
public class EraIndex: Codable, SelfDecodable {
    public let _links: SelfLink<EraIndex>
    public let era: [Link<EraLeaderboardIndex>]
    public let currentEra: Int
    public let lastUpdateTime: String
    public let generatedBy: String
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/era/1?namespace=2-6-US
public class EraLeaderboardIndex: Codable {
    public let _links: SelfLink<EraLeaderboardIndex>
    public let leaderboard: [EraLeaderboardLink]
    public let eraID: Int
    public let eraStartDate: Double
    public let lastUpdateTime: String
    public let generatedBy: String
    
    enum CodingKeys: String, CodingKey {
        case _links
        case leaderboard
        case eraID = "era_id"
        case eraStartDate = "era_start_date"
        case lastUpdateTime = "last_update_time"
        case generatedBy = "generated_by"
    }
}



public class EraLeaderboardLink: Codable, SelfDecodable {
    public let ladder: Link<EraLeaderboard>
    public let heroClassString: String?
    public let teamSize: Int?
    public let hardcore: Bool?
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/d3/era/1/leaderboard/rift-barbarian?namespace=2-6-US
public class EraLeaderboard: Codable, SelfDecodable {
    public let _links: SelfLink<EraLeaderboard>
    public let key: String
    public let title: LocaleString
    public let era: Int
    
    public let lastUpdateTime: String
    public let generatedBy: String
    
    public let row: [LeaderboardEntry]
    public let column: [LeaderboardColumn]
    
    public let greaterRiftSoloClass: String
    public let greaterRift: Bool
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

