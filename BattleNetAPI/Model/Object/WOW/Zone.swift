//
//  Zone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ZoneIndex: Codable {
    let zones: [Zone]
}


class ZoneInfo: Codable {
    let key: Link<ZoneInfo>
    let name: String
}


class Zone: Codable {
    let id: Int
    let name: String
    let urlSlug: String
    let description: String
    let location: Location
    let expansionID: Int
    let patch: String?
    let numPlayers: NumPlayers = .five
    let isDungeon: Bool
    let isRaid: Bool
    let advisedMinLevel: Int
    let advisedMaxLevel: Int
    let advisedHeroicMinLevel: Int
    let advisedHeroicMaxLevel: Int
    let availableModes: [ZoneMode]
    let lfgNormalMinGearLevel: Int
    let lfgHeroicMinGearLevel: Int
    let floors: Int
    let bosses: [Boss]
    
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


class ZoneSlug: Codable {
    let slug: String
}


class Location: Codable {
    let id: Int
    let name: String
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
