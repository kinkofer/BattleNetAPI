//
//  Boss.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class BossIndex: Codable {
    public let bosses: [Boss]
}



public class Boss: Codable {
    public let id: Int
    public let name: String
    public let urlSlug: String
    public let description: String?
    public let zoneID: Int
    public let availableInNormalMode: Bool
    public let availableInHeroicMode: Bool
    public let health: Int
    public let heroicHealth: Int
    public let level: Int
    public let heroicLevel: Int
    public let journalID: Int?
    public let npcs: [NPC]
    public let location: Location?
    
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



public class NPC: Codable {
    public let id: Int
    public let name: String
    public let urlSlug: String
    public let creatureDisplayID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urlSlug
        case creatureDisplayID = "creatureDisplayId"
    }
}



public class RaidBoss: Codable {
    public let id: Int
    public let name: String
    public let normalTimestamp: Int?
    public let normalKills: Int?
    public let heroicTimestamp: Int?
    public let heroicKills: Int?
    public let lfrKills: Int?
    public let lfrTimestamp: Int?
    public let mythicTimestamp: Int?
    public let mythicKills: Int?
}
