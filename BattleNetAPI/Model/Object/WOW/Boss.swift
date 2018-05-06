//
//  Boss.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class BossIndex: Codable {
    var bosses: [Boss] = [Boss]()
}



class Boss: Codable {
    var id: Int = 0
    var name: String = ""
    var urlSlug: String = ""
    var description: String? = nil
    var zoneID: Int = 0
    var availableInNormalMode: Bool = false
    var availableInHeroicMode: Bool = false
    var health: Int = 0
    var heroicHealth: Int = 0
    var level: Int = 0
    var heroicLevel: Int = 0
    var journalID: Int? = nil
    var npcs: [NPC] = [NPC]()
    var location: Location? = nil
    
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
    var id: Int = 0
    var name: String = ""
    var urlSlug: String = ""
    var creatureDisplayID: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urlSlug
        case creatureDisplayID = "creatureDisplayId"
    }
}



class RaidBoss: Codable {
    var id: Int = 0
    var name: String = ""
    var normalTimestamp: Int? = nil
    var normalKills: Int? = nil
    var heroicTimestamp: Int? = nil
    var heroicKills: Int? = nil
    var lfrKills: Int? = nil
    var lfrTimestamp: Int? = nil
    var mythicTimestamp: Int? = nil
    var mythicKills: Int? = nil
}
