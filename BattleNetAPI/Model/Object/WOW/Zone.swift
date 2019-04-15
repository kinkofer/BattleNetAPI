//
//  Zone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ZoneIndex: Codable {
    var zones: [Zone] = [Zone]()
}


class ZoneInfo: Codable {
    let key: Link<ZoneInfo>
    let name: String
}


class Zone: Codable {
    var id: Int = 0
    var name: String = ""
    var urlSlug: String = ""
    var description: String = ""
    var location: Location = Location()
    var expansionID: Int = 0
    var patch: String? = nil
    var numPlayers: NumPlayers = .five
    var isDungeon: Bool = false
    var isRaid: Bool = false
    var advisedMinLevel: Int = 0
    var advisedMaxLevel: Int = 0
    var advisedHeroicMinLevel: Int = 0
    var advisedHeroicMaxLevel: Int = 0
    var availableModes: [ZoneMode] = [ZoneMode]()
    var lfgNormalMinGearLevel: Int = 0
    var lfgHeroicMinGearLevel: Int = 0
    var floors: Int = 0
    var bosses: [Boss] = [Boss]()
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case urlSlug
        case description
        case location
        case expansionID = "expansionId"
        case patch
        case numPlayers
        case isDungeon
        case isRaid
        case advisedMinLevel
        case advisedMaxLevel
        case advisedHeroicMinLevel
        case advisedHeroicMaxLevel
        case availableModes
        case lfgNormalMinGearLevel
        case lfgHeroicMinGearLevel
        case floors
        case bosses
    }
}


enum ZoneMode: String, Codable {
    case dungeonHeroic = "DUNGEON_HEROIC"
    case dungeonMythic = "DUNGEON_MYTHIC"
    case dungeonNormal = "DUNGEON_NORMAL"
    case legacyRaid40 = "LEGACY_RAID_40"
    case raid10Heroic = "RAID_10_HEROIC"
    case raid10Normal = "RAID_10_NORMAL"
    case raid25Heroic = "RAID_25_HEROIC"
    case raid25Normal = "RAID_25_NORMAL"
    case raidFlexHeroic = "RAID_FLEX_HEROIC"
    case raidFlexLFR = "RAID_FLEX_LFR"
    case raidFlexNormal = "RAID_FLEX_NORMAL"
    case raidLFR = "RAID_LFR"
    case raidMythic = "RAID_MYTHIC"
}


struct ZoneSlug: Codable {
    let slug: String
}


class Location: Codable {
    var id: Int = 0
    var name: String = ""
}


enum NumPlayers: String, Codable {
    case ten = "10"
    case tenTwentyFive = "10/25"
    case tenToThirty = "10-30"
    case twentyFive = "25"
    case thirty = "30"
    case forty = "40"
    case five = "5"
}
