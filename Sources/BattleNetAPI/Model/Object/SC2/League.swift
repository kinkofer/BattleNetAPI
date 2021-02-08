//
//  League.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 1/27/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public class League: Codable {
    public let _links: SelfLink<League>
    public let key: LeagueKey
    public let tier: [LeagueTier]
}



public class LeagueKey: Codable {
    public let leagueID: Int
    public let seasonID: Int
    public let queueID: Int
    public let teamType: Int
    
    enum CodingKeys: String, CodingKey {
        case leagueID = "league_id"
        case seasonID = "season_id"
        case queueID = "queue_id"
        case teamType = "team_type"
    }
}



public class LeagueTier: Codable {
    public let id: Int
    public let division: [Division]
}



public class Division: Codable {
    public let id: Int
    public let ladderID: Int
    public let memberCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ladderID = "ladder_id"
        case memberCount = "member_count"
    }
}
