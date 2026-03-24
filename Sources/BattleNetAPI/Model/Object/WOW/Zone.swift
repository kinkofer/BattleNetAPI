//
//  Zone.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct ZoneIndex: Codable {
    public let zones: [Zone]
}


public struct ZoneInfo: Codable {
    public let key: Link<ZoneInfo>
    public let name: String
}


public struct Zone: Codable {
    public let id: Int
    public let name: String
    public let urlSlug: String
    public let description: String
    public let location: Location
    public let expansionID: Int
    public let patch: String?
    public let numPlayers: NumPlayers = .five
    public let isDungeon: Bool
    public let isRaid: Bool
    public let advisedMinLevel: Int
    public let advisedMaxLevel: Int
    public let advisedHeroicMinLevel: Int
    public let advisedHeroicMaxLevel: Int
    public let availableModes: [ZoneMode]
    public let lfgNormalMinGearLevel: Int
    public let lfgHeroicMinGearLevel: Int
    public let floors: Int
    public let bosses: [Boss]
    
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


public enum ZoneMode: String, Codable {
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


public struct ZoneSlug: Codable {
    public let slug: String
}


public struct Location: Codable {
    public let id: Int
    public let name: String
}


public enum NumPlayers: String, Codable {
    case ten = "10"
    case tenTwentyFive = "10/25"
    case tenToThirty = "10-30"
    case twentyFive = "25"
    case thirty = "30"
    case forty = "40"
    case five = "5"
}
