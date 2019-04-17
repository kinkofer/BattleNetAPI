//
//  Boss.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class BossIndex: Codable {
    let bosses: [Boss]
}



class Boss: Codable {
    let id: Int
    let name: String
    let urlSlug: String
    let description: String?
    let zoneID: Int
    let availableInNormalMode: Bool
    let availableInHeroicMode: Bool
    let health: Int
    let heroicHealth: Int
    let level: Int
    let heroicLevel: Int
    let journalID: Int?
    let npcs: [NPC]
    let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urlSlug
        case description
        case zoneID = "zoneId"
        case availableInNormalMode
        case availableInHeroicMode
        case health
        case heroicHealth
        case level
        case heroicLevel
        case journalID = "journalId"
        case npcs
        case location
    }
}



class NPC: Codable {
    let id: Int
    let name: String
    let urlSlug: String
    let creatureDisplayID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urlSlug
        case creatureDisplayID = "creatureDisplayId"
    }
}



class RaidBoss: Codable {
    let id: Int
    let name: String
    let normalTimestamp: Int?
    let normalKills: Int?
    let heroicTimestamp: Int?
    let heroicKills: Int?
    let lfrKills: Int?
    let lfrTimestamp: Int?
    let mythicTimestamp: Int?
    let mythicKills: Int?
}
