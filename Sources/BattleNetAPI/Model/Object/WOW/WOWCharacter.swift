//
//  Character.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



public struct WOWCharacterResult: Codable {
    public let characters: [WOWCharacter]
}


public struct WOWCharacterField: OptionSet {
    public let rawValue: Int
    
    public static let achievements = WOWCharacterField(rawValue: 1 << 0)
    public static let appearance = WOWCharacterField(rawValue: 1 << 1)
    public static let feed = WOWCharacterField(rawValue: 1 << 2)
    public static let guild = WOWCharacterField(rawValue: 1 << 3)
    public static let hunterPets = WOWCharacterField(rawValue: 1 << 4)
    public static let items = WOWCharacterField(rawValue: 1 << 5)
    public static let mounts = WOWCharacterField(rawValue: 1 << 6)
    public static let pets = WOWCharacterField(rawValue: 1 << 7)
    public static let petSlots = WOWCharacterField(rawValue: 1 << 8)
    public static let professions = WOWCharacterField(rawValue: 1 << 9)
    public static let progression = WOWCharacterField(rawValue: 1 << 10)
    public static let pvp = WOWCharacterField(rawValue: 1 << 11)
    public static let quests = WOWCharacterField(rawValue: 1 << 12)
    public static let reputation = WOWCharacterField(rawValue: 1 << 13)
    public static let statistics = WOWCharacterField(rawValue: 1 << 14)
    public static let stats = WOWCharacterField(rawValue: 1 << 15)
    public static let talents = WOWCharacterField(rawValue: 1 << 16)
    public static let titles = WOWCharacterField(rawValue: 1 << 17)
    public static let audit = WOWCharacterField(rawValue: 1 << 18)
    
    
    var toArray: [String] {
        var array = [String]()
        
        if self.contains(.achievements) { array.append("achievements") }
        if self.contains(.appearance) { array.append("appearance") }
        if self.contains(.feed) { array.append("feed") }
        if self.contains(.guild) { array.append("guild") }
        if self.contains(.hunterPets) { array.append("hunterPets") }
        if self.contains(.items) { array.append("items") }
        if self.contains(.mounts) { array.append("mounts") }
        if self.contains(.pets) { array.append("pets") }
        if self.contains(.petSlots) { array.append("petSlots") }
        if self.contains(.professions) { array.append("professions") }
        if self.contains(.progression) { array.append("progression") }
        if self.contains(.pvp) { array.append("pvp") }
        if self.contains(.quests) { array.append("quests") }
        if self.contains(.reputation) { array.append("reputation") }
        if self.contains(.statistics) { array.append("statistics") }
        if self.contains(.stats) { array.append("stats") }
        if self.contains(.talents) { array.append("talents") }
        if self.contains(.titles) { array.append("titles") }
        if self.contains(.audit) { array.append("audit") }
        
        return array
    }
    
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}


public struct WOWCharacter: Codable {
    public let name: String
    public let level: Int
    public let `class`: Int
    public let race: Int
    public let gender: Int
    
    public let realm: String
    public let battlegroup: String
    public let achievementPoints: Int
    public let thumbnail: String
    public let lastModified: Int
    
    public let guild: String?
    public let guildRealm: String?
    
    public let spec: CharacterSpecialization?
}



public struct WOWCharacterProfile: Codable {
    public let name: String
    public let level: Int
    public let `class`: Int
    public let race: Int
    public let gender: Int
    
    public let realm: String
    public let battlegroup: String
    public let achievementPoints: Int
    public let thumbnail: String
    public let lastModified: Int
    
    public let spec: CharacterSpecialization?
    
    public let calcClass: String?
    public let faction: Int?
    public let totalHonorableKills: Int?
    
    public let appearance: WOWCharacterAppearance?
    public let titles: [WOWCharacterTitle]?
    
    public let statistics: StatisticIndex?
    public let stats: WOWCharacterStats?
    public let achievements: WOWAchievementStatus?
    public let feed: [Feed]?
    
    public let items: WOWEquippedItems?
    public let professions: Professions?
    public let talents: [CharacterTalent]?
    
    public let reputation: [Reputation]?
    public let progression: WOWProgression?
    public let quests: [Int]?
    
    public let mounts: CollectedMountIndex?
    public let pets: CollectedPetIndex?
    public let petSlots: [PetSlot]?
    public let hunterPets: [HunterPet]?
    
    public let guild: WOWGuild?
    public let pvp: WOWPVP?
    public let audit: Audit?
}



public struct RaceIndex: Codable {
    public let races: [Race]
}



public struct Race: Codable {
    public let id: Int
    public let mask: Int
    public let side: RaceFaction
    public let name: String
}


public enum RaceFaction: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case neutral = "neutral"
}


public struct WOWRaceIndex: Codable {
    public let _links: SelfLink<WOWRaceIndex>
    public let races: [KeyLink<WOWRace>]
}


public struct WOWRace: Codable, SelfDecodable {
    public let _links: SelfLink<WOWRace>
    public let id: Int
    public let name: String
    public let genderName: GenderName2
    public let faction: [WOWFaction]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct WOWCharacterAppearance: Codable {
    public let faceVariation: Int
    public let skinColor: Int
    public let hairVariation: Int
    public let hairColor: Int
    public let featureVariation: Int
    public let showHelm: Bool
    public let showCloak: Bool
    public let customDisplayOptions: [Int]
}



public struct Feed: Codable {
    public let type: String
    public let timestamp: Int
    
    public let name: String?
    public let character: String?
    public let featOfStrength: Bool?
    public let achievement: WOWAchievement?
    public let criteria: WOWAchievementCriterion?
    
    public let itemID: Int?
    public let quantity: Int?
    
    public let context: String?
    public let bonusLists: [Int]?
}



public struct Professions: Codable {
    public let primary: [Profession]
    public let secondary: [Profession]
}



public struct Profession: Codable {
    public let id: Int
    public let icon: String?
    public let recipes: [Int]
    public let name: String
    public let rank: Int
    public let max: Int
}



public struct WOWProgression: Codable {
    public let raids: [Raid]
}



public struct Raid: Codable {
    public let id: Int
    public let name: String
    
    public let normal: Int
    public let heroic: Int
    public let mythic: Int
    public let lfr: Int
    
    public let bosses: [RaidBoss]
}



public struct Reputation: Codable {
    public let id: Int
    public let value: Int
    public let name: String
    public let standing: Int
    public let max: Int
}



public struct StatisticIndex: Codable {
    public let id: Int
    public let name: String
    public let subcategories: [StatisticSubcategory]
    
    enum CodingKeys: String, CodingKey {
        case id
        case subcategories = "subCategories"
        case name
    }
}



public struct StatisticSubcategory: Codable {
    public let id: Int
    public let statistics: [Statistic]
    public let subcategories: [StatisticSubcategory]?
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case statistics
        case subcategories = "subCategories"
        case name
    }
}



public struct Statistic: Codable {
    public let id: Int
    public let quantity: Int
    public let money: Bool
    public let name: String
    public let lastUpdated: Int
    public let highest: String?
}



public struct WOWCharacterStats: Codable {
    public let mainHandDmgMin: Int
    public let int: Int
    public let hasteRating: Int
    public let mastery: Double
    public let versatilityHealingDoneBonus: Double
    public let parryRating: Int
    public let health: Int
    public let dodge: Int
    public let mana5Combat: Int
    public let mainHandDmgMax: Int
    public let offHandSpeed: Double
    public let sta: Int
    public let leechRatingBonus: Int
    public let leech: Int
    public let speedRatingBonus: Int
    public let offHandDmgMin: Int
    public let offHandDps: Double
    public let str: Int
    public let agi: Int
    public let spellPen: Int
    public let powerType: String
    public let mainHandSpeed: Double
    public let offHandDmgMax: Int
    public let crit: Double
    public let dodgeRating: Int
    public let rangedDmgMin: Int
    public let power: Int
    public let spellCritRating: Int
    public let leechRating: Int
    public let armor: Int
    public let parry: Double
    public let hasteRatingPercent: Double
    public let mana5: Int
    public let rangedDmgMax: Int
    public let avoidanceRating: Int
    public let spellCrit: Double
    public let versatilityDamageTakenBonus: Double
    public let critRating: Int
    public let haste: Double
    public let versatility: Int
    public let blockRating: Int
    public let mainHandDps: Double
    public let rangedSpeed: Int
    public let rangedDps: Int
    public let masteryRating: Int
    public let speedRating: Double
    public let versatilityDamageDoneBonus: Double
    public let block: Int
    public let avoidanceRatingBonus: Int
}



public struct WOWCharacterTitle: Codable {
    public let id: Int
    public let name: String
    public let selected: Bool?
}



public struct Audit: Codable {
    public let noSpec: Bool
    public let appropriateArmorType: Int
    public let emptySockets: Int
    public let emptyGlyphSlots: Int
    public let unspentTalentPoints: Int
    public let lowLevelThreshold: Int
    public let nMissingJewelcrafterGems: Int
    public let numberOfIssues: Int
    
    public let lowLevelItems: [String: Int]
    public let inappropriateArmorType: [String: Int]
    public let itemsWithEmptySockets: [String: Int]
    public let unenchantedItems: [String: Int]
    public let slots: [String: Int]
    
    public let missingEnchanterEnchants: [String: Int]
    public let missingScribeEnchants: [String: Int]
    public let missingExtraSockets: [String: Int]
    public let missingBlacksmithSockets: [String: Int]
    public let missingLeatherworkerEnchants: [String: Int]
    public let missingEngineerEnchants: [String: Int]
    
    public let recommendedBeltBuckle: WOWItem
}
