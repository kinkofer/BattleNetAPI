//
//  League.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 1/27/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class League: Codable {
    let _links: SelfLink<League>
    let key: LeagueKey
    let tier: [LeagueTier]
}



class LeagueKey: Codable {
    let leagueID: Int
    let seasonID: Int
    let queueID: Int
    let teamType: Int
    
    enum CodingKeys: String, CodingKey {
        case leagueID = "league_id"
        case seasonID = "season_id"
        case queueID = "queue_id"
        case teamType = "team_type"
    }
}



class LeagueTier: Codable {
    let id: Int
    let division: [Division]
}



class Division: Codable {
    let id: Int
    let ladderID: Int
    let memberCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case ladderID = "ladder_id"
        case memberCount = "member_count"
    }
}
