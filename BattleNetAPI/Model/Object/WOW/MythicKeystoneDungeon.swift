//
//  MythicDungeon.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class MythicKeystoneIndex: Codable {
    let _links: SelfLink<MythicKeystoneIndex>
    let seasons: Link<MythicKeystoneSeasonIndex>
    let dungeons: Link<MythicKeystoneDungeonIndex>
}


class MythicKeystoneDungeonIndex: Codable {
    let _links: SelfLink<MythicKeystoneDungeonIndex>
    let dungeons: [KeyLink<MythicKeystoneDungeon>]
}


class MythicKeystoneDungeon: Codable {
    let _links: SelfLink<MythicKeystoneDungeon>
    let id: Int
    let name: String
    let map: Map
    let zone: ZoneSlug
    let keystoneUpgrades: [KeystoneUpgrade]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id, name, map, zone
        case keystoneUpgrades = "keystone_upgrades"
    }
}


class KeystoneUpgrade: Codable {
    let upgradeLevel: Int
    let qualifyingDuration: Int
    
    enum CodingKeys: String, CodingKey {
        case upgradeLevel = "upgrade_level"
        case qualifyingDuration = "qualifying_duration"
    }
}


class Map: Codable {
    let name: String
    let id: Int
}



class MythicKeystonePeriodIndex: Codable {
    let _links: SelfLink<MythicKeystonePeriodIndex>
    let periods: [KeyLink<MythicKeystonePeriod>]
    let currentPeriod: KeyLink<MythicKeystonePeriod>
    
    enum CodingKeys: String, CodingKey {
        case _links
        case periods
        case currentPeriod = "current_period"
    }
}


class MythicKeystonePeriod: Codable {
    let _links: SelfLink<MythicKeystonePeriod>
    let id: Int
    let startTimestamp: Int
    let endTimestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id
        case startTimestamp = "start_timestamp"
        case endTimestamp = "end_timestamp"
    }
}


class MythicKeystoneSeasonIndex: Codable {
    let _links: SelfLink<MythicKeystoneSeasonIndex>
    let seasons: [KeyLink<MythicKeystoneSeason>]
    let currentSeason: KeyLink<MythicKeystoneSeason>
    
    enum CodingKeys: String, CodingKey {
        case _links
        case seasons
        case currentSeason = "current_season"
    }
}



class MythicKeystoneSeason: Codable {
    let _links: SelfLink<MythicKeystoneSeason>
    let id: Int
    let startTimestamp: Int
    let endTimestamp: Int
    let periods: [KeyLink<MythicKeystonePeriod>]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id
        case startTimestamp = "start_timestamp"
        case endTimestamp = "end_timestamp"
        case periods
    }
}
