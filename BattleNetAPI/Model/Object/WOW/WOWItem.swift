//
//  WOWItem.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class WOWItem: Codable {
    public let id: Int
    public let description: String
    public let name: String
    public let icon: String
    
    public let artifactID: Int
    public let quality: Int
    
    public let equippable: Bool
    public let isAuctionable: Bool
    public let stackable: Int
    public let maxCount: Int
    public let containerSlots: Int
    public let itemBind: Int
    
    public let bonusStats: [WOWItemStat]
    public let itemSpells: [WOWItemSpell]
    
    public let buyPrice: Int
    public let sellPrice: Int
    public let itemClass: Int
    public let itemSubClass: Int
    
    public let inventoryType: Int
    public let itemLevel: Int
    public let maxDurability: Int
    public let minFactionID: Int
    public let minReputation: Int
    
    public let requiredSkill: Int
    public let requiredLevel: Int
    public let requiredSkillRank: Int
    
    public let itemSource: WOWItemSource
    public let hasSockets: Bool
    
    public let weaponInfo: WeaponInfo?
    public let armor: Int
    public let baseArmor: Int
    
    public let displayInfoID: Int
    public let nameDescription: String
    public let nameDescriptionColor: String
    
    public let heroicTooltip: Bool
    
    public let upgradable: Bool
    public let context: String
    public let availableContexts: [String]
    
    public let bonusLists: [Int]
    public let bonusSummary: BonusSummary
    
    public let disenchantingSkillRank: Int?


    enum CodingKeys: String, CodingKey {
        case id
        case disenchantingSkillRank
        case description
        case name
        case icon
        case stackable
        case itemBind
        case bonusStats
        case itemSpells
        case buyPrice
        case itemClass
        case itemSubClass
        case containerSlots
        case weaponInfo
        case inventoryType
        case equippable
        case itemLevel
        case maxCount
        case maxDurability
        case minFactionID = "minFactionId"
        case minReputation
        case quality
        case sellPrice
        case requiredSkill
        case requiredLevel
        case requiredSkillRank
        case itemSource
        case baseArmor
        case hasSockets
        case isAuctionable
        case armor
        case displayInfoID = "displayInfoId"
        case nameDescription
        case nameDescriptionColor
        case upgradable
        case heroicTooltip
        case context
        case bonusLists
        case availableContexts
        case bonusSummary
        case artifactID = "artifactId"
    }
}



public class BonusSummary: Codable {
//    public let defaultBonusLists: []
//    public let chanceBonusLists: []
//    public let bonusChances: []
}



public class WOWItemSource: Codable {
    public let sourceID: Int
    public let sourceType: String
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case sourceType
    }
}


public class WOWItemSpell: Codable {
    public let spellID: Int
    public let scaledDescription: String
    public let trigger: String
    public let consumable: Bool
    public let categoryID: Int
    public let nCharges: Int
    
    enum CodingKeys: String, CodingKey {
        case spellID = "spellId"
        case scaledDescription
        case trigger
        case consumable
        case categoryID = "categoryId"
        case nCharges
    }
}


public class WeaponInfo: Codable {
    public let damage: Damage
    public let weaponSpeed: Double
    public let dps: Double
}



public class Damage: Codable {
    public let min: Int
    public let max: Int
    public let exactMin: Int
    public let exactMax: Int
}



public class WOWItemSummary: Codable {
    public let id: Int
    public let name: String
    public let icon: String
    public let quality: Int
    public let itemLevel: Int
    public let tooltipParams: TooltipParams
    public let stats: [WOWItemStat]
    public let armor: Int
    public let context: String
    public let bonusLists: [Int]
    public let displayInfoID: Int
    public let artifactID: Int
    public let artifactAppearanceID: Int
//    public let artifactTraits: []
//    public let relics: []
    public let appearance: WOWItemAppearance
    
    public let weaponInfo: WeaponInfo?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case quality
        case itemLevel
        case tooltipParams
        case stats
        case armor
        case context
        case bonusLists
        case displayInfoID = "displayInfoId"
        case artifactID = "artifactId"
        case artifactAppearanceID = "artifactAppearanceId"
//        case artifactTraits
//        case relics
        case appearance
        case weaponInfo
    }
}



public class WOWItemAppearance: Codable {
    public let transmogItemAppearanceModID: Int?
    public let itemAppearanceModID: Int?
    public let itemID: Int?
    public let enchantDisplayInfoID: Int?
}



public class TooltipParams: Codable {
    public let timewalkerLevel: Int
    public let azeritePowerLevel: Int
    public let azeritePower0: Int
    public let azeritePower1: Int
    public let azeritePower2: Int
    public let azeritePower3: Int
    public let azeritePower4: Int
}



public class WOWItemUpgrade: Codable {
    public let current: Int
    public let total: Int
    public let itemLevelIncrement: Int
}



public class WOWItemStat: Codable {
    public let stat: Int
    public let amount: Int
}



public class WOWEquippedItems: Codable {
    public let mainHand: WOWItemSummary?
    public let head: WOWItemSummary?
    public let neck: WOWItemSummary?
    public let shoulder: WOWItemSummary?
    public let back: WOWItemSummary?
    public let chest: WOWItemSummary?
    public let tabard: WOWItemSummary?
    public let wrist: WOWItemSummary?
    public let hands: WOWItemSummary?
    public let finger1: WOWItemSummary?
    public let finger2: WOWItemSummary?
    public let waist: WOWItemSummary?
    public let legs: WOWItemSummary?
    public let feet: WOWItemSummary?
    public let trinket1: WOWItemSummary?
    public let trinket2: WOWItemSummary?
    
    public let averageItemLevel: Int
    public let averageItemLevelEquipped: Int
}




// MARK: - Item Sets

public class WOWItemSet: Codable {
    public let id: Int
    public let name: String
    public let setBonuses: [SetBonus]
    public let items: [Int]
}



public class SetBonus: Codable {
    public let description: String
    public let threshold: Int
}



// MARK: - Item Classes

public class ItemClassIndex: Codable {
    public let classes: [ItemClass]
}



public class ItemClass: Codable {
    public let `class`: Int
    public let name: String
    public let subclasses: [ItemSubclass]
}



public class ItemSubclass: Codable {
    public let subclass: Int
    public let name: String
}
