//
//  Character.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



class WOWCharacterResult: Codable {
    let characters: [WOWCharacter]
}


struct WOWCharacterField: OptionSet {
    let rawValue: Int
    
    static let achievements = WOWCharacterField(rawValue: 1 << 0)
    static let appearance = WOWCharacterField(rawValue: 1 << 1)
    static let feed = WOWCharacterField(rawValue: 1 << 2)
    static let guild = WOWCharacterField(rawValue: 1 << 3)
    static let hunterPets = WOWCharacterField(rawValue: 1 << 4)
    static let items = WOWCharacterField(rawValue: 1 << 5)
    static let mounts = WOWCharacterField(rawValue: 1 << 6)
    static let pets = WOWCharacterField(rawValue: 1 << 7)
    static let petSlots = WOWCharacterField(rawValue: 1 << 8)
    static let professions = WOWCharacterField(rawValue: 1 << 9)
    static let progression = WOWCharacterField(rawValue: 1 << 10)
    static let pvp = WOWCharacterField(rawValue: 1 << 11)
    static let quests = WOWCharacterField(rawValue: 1 << 12)
    static let reputation = WOWCharacterField(rawValue: 1 << 13)
    static let statistics = WOWCharacterField(rawValue: 1 << 14)
    static let stats = WOWCharacterField(rawValue: 1 << 15)
    static let talents = WOWCharacterField(rawValue: 1 << 16)
    static let titles = WOWCharacterField(rawValue: 1 << 17)
    static let audit = WOWCharacterField(rawValue: 1 << 18)
    
    
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
}


class WOWCharacter: Codable {
    let name: String
    let level: Int
    let `class`: Int
    let race: Int
    let gender: Int
    
    let realm: String
    let battlegroup: String
    let achievementPoints: Int
    let thumbnail: String
    let lastModified: Int
    
    let guild: String?
    let guildRealm: String?
    
    let spec: CharacterSpecialization?
}



class WOWCharacterProfile: Codable {
    let name: String
    let level: Int
    let `class`: Int
    let race: Int
    let gender: Int
    
    let realm: String
    let battlegroup: String
    let achievementPoints: Int
    let thumbnail: String
    let lastModified: Int
    
    let spec: CharacterSpecialization?
    
    let calcClass: String?
    let faction: Int?
    let totalHonorableKills: Int?
    
    let appearance: WOWCharacterAppearance?
    let titles: [WOWCharacterTitle]?
    
    let statistics: StatisticIndex?
    let stats: WOWCharacterStats?
    let achievements: WOWAchievementStatus?
    let feed: [Feed]?
    
    let items: WOWEquippedItems?
    let professions: Professions?
    let talents: [CharacterTalent]?
    
    let reputation: [Reputation]?
    let progression: WOWProgression?
    let quests: [Int]?
    
    let mounts: CollectedMountIndex?
    let pets: CollectedPetIndex?
    let petSlots: [PetSlot]?
    let hunterPets: [HunterPet]?
    
    let guild: WOWGuild?
    let pvp: WOWPVP?
    let audit: Audit?
}



class RaceIndex: Codable {
    let races: [Race]
}



class Race: Codable {
    let id: Int
    let mask: Int
    let side: RaceFaction
    let name: String
}


enum RaceFaction: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case neutral = "neutral"
}


class WOWRaceIndex: Codable {
    let _links: SelfLink<WOWRaceIndex>
    let races: [KeyLink<WOWRace>]
}


class WOWRace: Codable {
    let _links: SelfLink<WOWRace>
    let id: Int
    let name: String
    let genderName: GenderName2
    let faction: [WOWFaction]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id, name
        case genderName = "gender_name"
        case faction
    }
}



class WOWCharacterAppearance: Codable {
    let faceVariation: Int
    let skinColor: Int
    let hairVariation: Int
    let hairColor: Int
    let featureVariation: Int
    let showHelm: Bool
    let showCloak: Bool
    let customDisplayOptions: [Int]
}



class Feed: Codable {
    let type: String
    let timestamp: Int
    
    let name: String?
    let character: String?
    let featOfStrength: Bool?
    let achievement: WOWAchievement?
    let criteria: WOWAchievementCriterion?
    
    let itemID: Int?
    let quantity: Int?
    
    let context: String?
    let bonusLists: [Int]?
}



class Professions: Codable {
    let primary: [Profession]
    let secondary: [Profession]
}



class Profession: Codable {
    let id: Int
    let icon: String?
    let recipes: [Int]
    let name: String
    let rank: Int
    let max: Int
}



class WOWProgression: Codable {
    let raids: [Raid]
}



class Raid: Codable {
    let id: Int
    let name: String
    
    let normal: Int
    let heroic: Int
    let mythic: Int
    let lfr: Int
    
    let bosses: [RaidBoss]
}



class Reputation: Codable {
    let id: Int
    let value: Int
    let name: String
    let standing: Int
    let max: Int
}



class StatisticIndex: Codable {
    let id: Int
    let name: String
    let subcategories: [StatisticSubcategory]
    
    enum CodingKeys: String, CodingKey {
        case id
        case subcategories = "subCategories"
        case name
    }
}



class StatisticSubcategory: Codable {
    let id: Int
    let statistics: [Statistic]
    let subcategories: [StatisticSubcategory]?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case statistics
        case subcategories = "subCategories"
        case name
    }
}



class Statistic: Codable {
    let id: Int
    let quantity: Int
    let money: Bool
    let name: String
    let lastUpdated: Int
    let highest: String?
}



class WOWCharacterStats: Codable {
    let mainHandDmgMin: Int
    let int: Int
    let hasteRating: Int
    let mastery: Double
    let versatilityHealingDoneBonus: Double
    let parryRating: Int
    let health: Int
    let dodge: Int
    let mana5Combat: Int
    let mainHandDmgMax: Int
    let offHandSpeed: Double
    let sta: Int
    let leechRatingBonus: Int
    let leech: Int
    let speedRatingBonus: Int
    let offHandDmgMin: Int
    let offHandDps: Double
    let str: Int
    let agi: Int
    let spellPen: Int
    let powerType: String
    let mainHandSpeed: Double
    let offHandDmgMax: Int
    let crit: Double
    let dodgeRating: Int
    let rangedDmgMin: Int
    let power: Int
    let spellCritRating: Int
    let leechRating: Int
    let armor: Int
    let parry: Double
    let hasteRatingPercent: Double
    let mana5: Int
    let rangedDmgMax: Int
    let avoidanceRating: Int
    let spellCrit: Double
    let versatilityDamageTakenBonus: Double
    let critRating: Int
    let haste: Double
    let versatility: Int
    let blockRating: Int
    let mainHandDps: Double
    let rangedSpeed: Int
    let rangedDps: Int
    let masteryRating: Int
    let speedRating: Double
    let versatilityDamageDoneBonus: Double
    let block: Int
    let avoidanceRatingBonus: Int
}



class WOWCharacterTitle: Codable {
    let id: Int
    let name: String
    let selected: Bool?
}



class Audit: Codable {
    let noSpec: Bool
    let appropriateArmorType: Int
    let emptySockets: Int
    let emptyGlyphSlots: Int
    let unspentTalentPoints: Int
    let lowLevelThreshold: Int
    let nMissingJewelcrafterGems: Int
    let numberOfIssues: Int
    
    let lowLevelItems: [String: Int]
    let inappropriateArmorType: [String: Int]
    let itemsWithEmptySockets: [String: Int]
    let unenchantedItems: [String: Int]
    let slots: [String: Int]
    
    let missingEnchanterEnchants: [String: Int]
    let missingScribeEnchants: [String: Int]
    let missingExtraSockets: [String: Int]
    let missingBlacksmithSockets: [String: Int]
    let missingLeatherworkerEnchants: [String: Int]
    let missingEngineerEnchants: [String: Int]
    
    let recommendedBeltBuckle: WOWItem
}
