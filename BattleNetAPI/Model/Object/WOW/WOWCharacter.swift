//
//  Character.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



class WOWCharacterResult: Codable {
    var characters: [WOWCharacter] = [WOWCharacter]()
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
    var name: String = ""
    var level: Int = 0
    var `class`: Int = 0
    var race: Int = 0
    var gender: Int = 0
    
    var realm: String = ""
    var battlegroup: String = ""
    var achievementPoints: Int = 0
    var thumbnail: String = ""
    var lastModified: Int = 0
    
    var guild: String? = nil
    var guildRealm: String? = nil
    
    var spec: SpecializationLegacy? = nil
}



class WOWCharacterProfile: Codable {
    var name: String = ""
    var level: Int = 0
    var `class`: Int = 0
    var race: Int = 0
    var gender: Int = 0
    
    var realm: String = ""
    var battlegroup: String = ""
    var achievementPoints: Int = 0
    var thumbnail: String = ""
    var lastModified: Int = 0
    
    var spec: SpecializationLegacy? = nil
    
    var calcClass: String? = nil
    var faction: Int? = nil
    var totalHonorableKills: Int? = nil
    
    var appearance: WOWCharacterAppearance? = nil
    var titles: [WOWCharacterTitle]? = nil
    
    var statistics: StatisticIndex? = nil
    var stats: WOWCharacterStats? = nil
    var achievements: WOWAchievementStatus? = nil
    var feed: [Feed]? = nil
    
    var items: WOWEquippedItems? = nil
    var professions: Professions? = nil
    var talents: [CharacterTalent]? = nil
    
    var reputation: [Reputation]? = nil
    var progression: WOWProgression? = nil
    var quests: [Int]? = nil
    
    var mounts: CollectedMountIndex? = nil
    var pets: CollectedPetIndex? = nil
    var petSlots: [PetSlot]? = nil
    var hunterPets: [HunterPet]? = nil
    
    var guild: WOWGuild? = nil
    var pvp: WOWPVP? = nil
    var audit: Audit? = nil
}



class RaceIndex: Codable {
    var races: [Race] = [Race]()
}



class Race: Codable {
    var id: Int = 0
    var mask: Int = 0
    var side: RaceFaction = .neutral
    var name: String = ""
}


enum RaceFaction: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case neutral = "neutral"
}



class WOWCharacterAppearance: Codable {
    var faceVariation: Int = 0
    var skinColor: Int = 0
    var hairVariation: Int = 0
    var hairColor: Int = 0
    var featureVariation: Int = 0
    var showHelm: Bool = false
    var showCloak: Bool = false
    var customDisplayOptions: [Int] = [Int]()
}



class Feed: Codable {
    var type: String = ""
    var timestamp: Int = 0
    
    var name: String? = nil
    var character: String? = nil
    var featOfStrength: Bool? = nil
    var achievement: WOWAchievement? = nil
    var criteria: WOWAchievementCriterion? = nil
    
    var itemID: Int? = nil
    var quantity: Int? = nil
    
    var context: String? = nil
    var bonusLists: [Int]? = nil
}



class Professions: Codable {
    var primary: [Profession] = [Profession]()
    var secondary: [Profession] = [Profession]()
}



class Profession: Codable {
    var id: Int = 0
    var icon: String = ""
    var recipes: [Int] = [Int]()
    var name: String = ""
    var rank: Int = 0
    var max: Int = 0
}



class WOWProgression: Codable {
    var raids: [Raid] = [Raid]()
}



class Raid: Codable {
    var id: Int = 0
    var name: String = ""
    
    var normal: Int = 0
    var heroic: Int = 0
    var mythic: Int = 0
    var lfr: Int = 0
    
    var bosses: [RaidBoss] = [RaidBoss]()
}



class Reputation: Codable {
    var id: Int = 0
    var value: Int = 0
    var name: String = ""
    var standing: Int = 0
    var max: Int = 0
}



class StatisticIndex: Codable {
    var id: Int = 0
    var name: String = ""
    var subcategories: [StatisticSubcategory] = [StatisticSubcategory]()
    
    enum CodingKeys: String, CodingKey {
        case id
        case subcategories = "subCategories"
        case name
    }
}



class StatisticSubcategory: Codable {
    var id: Int = 0
    var statistics: [Statistic] = [Statistic]()
    var subcategories: [StatisticSubcategory]? = nil
    var name: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case statistics
        case subcategories = "subCategories"
        case name
    }
}



class Statistic: Codable {
    var id: Int = 0
    var quantity: Int = 0
    var money: Bool = false
    var name: String = ""
    var lastUpdated: Int = 0
    var highest: String? = nil
}



class WOWCharacterStats: Codable {
    var mainHandDmgMin: Int = 0
    var int: Int = 0
    var hasteRating: Int = 0
    var mastery: Double = 0
    var versatilityHealingDoneBonus: Double = 0
    var parryRating: Int = 0
    var health: Int = 0
    var dodge: Int = 0
    var mana5Combat: Int = 0
    var mainHandDmgMax: Int = 0
    var offHandSpeed: Double = 0
    var sta: Int = 0
    var leechRatingBonus: Int = 0
    var leech: Int = 0
    var speedRatingBonus: Int = 0
    var offHandDmgMin: Int = 0
    var offHandDps: Double = 0
    var str: Int = 0
    var agi: Int = 0
    var spellPen: Int = 0
    var powerType: String = ""
    var mainHandSpeed: Double = 0
    var offHandDmgMax: Int = 0
    var crit: Double = 0
    var dodgeRating: Int = 0
    var rangedDmgMin: Int = 0
    var power: Int = 0
    var spellCritRating: Int = 0
    var leechRating: Int = 0
    var armor: Int = 0
    var parry: Double = 0
    var hasteRatingPercent: Double = 0
    var mana5: Int = 0
    var rangedDmgMax: Int = 0
    var avoidanceRating: Int = 0
    var spellCrit: Double = 0
    var versatilityDamageTakenBonus: Double = 0
    var critRating: Int = 0
    var haste: Double = 0
    var versatility: Int = 0
    var blockRating: Int = 0
    var mainHandDps: Double = 0
    var rangedSpeed: Int = 0
    var rangedDps: Int = 0
    var masteryRating: Int = 0
    var speedRating: Double = 0
    var versatilityDamageDoneBonus: Double = 0
    var block: Int = 0
    var avoidanceRatingBonus: Int = 0
}



class WOWCharacterTitle: Codable {
    var id: Int = 0
    var name: String = ""
    var selected: Bool? = nil
}



class Audit: Codable {
    var noSpec: Bool = false
    var appropriateArmorType: Int = 0
    var emptySockets: Int = 0
    var emptyGlyphSlots: Int = 0
    var unspentTalentPoints: Int = 0
    var lowLevelThreshold: Int = 0
    var nMissingJewelcrafterGems: Int = 0
    var numberOfIssues: Int = 0
    
    var lowLevelItems: [String: Int] = [String: Int]()
    var inappropriateArmorType: [String: Int] = [String: Int]()
    var itemsWithEmptySockets: [String: Int] = [String: Int]()
    var unenchantedItems: [String: Int] = [String: Int]()
    var slots: [String: Int] = [String: Int]()
    
    var missingEnchanterEnchants: [String: Int] = [String: Int]()
    var missingScribeEnchants: [String: Int] = [String: Int]()
    var missingExtraSockets: [String: Int] = [String: Int]()
    var missingBlacksmithSockets: [String: Int] = [String: Int]()
    var missingLeatherworkerEnchants: [String: Int] = [String: Int]()
    var missingEngineerEnchants: [String: Int] = [String: Int]()
    
    var recommendedBeltBuckle: WOWItem = WOWItem()
}
