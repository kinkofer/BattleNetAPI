//
//  WOWItem.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWItem: Codable {
    let id: Int
    let description: String
    let name: String
    let icon: String
    
    let artifactID: Int
    let quality: Int
    
    let equippable: Bool
    let isAuctionable: Bool
    let stackable: Int
    let maxCount: Int
    let containerSlots: Int
    let itemBind: Int
    
    let bonusStats: [WOWItemStat]
    let itemSpells: [WOWItemSpell]
    
    let buyPrice: Int
    let sellPrice: Int
    let itemClass: Int
    let itemSubClass: Int
    
    let inventoryType: Int
    let itemLevel: Int
    let maxDurability: Int
    let minFactionID: Int
    let minReputation: Int
    
    let requiredSkill: Int
    let requiredLevel: Int
    let requiredSkillRank: Int
    
    let itemSource: WOWItemSource
    let hasSockets: Bool
    
    let weaponInfo: WeaponInfo?
    let armor: Int
    let baseArmor: Int
    
    let displayInfoID: Int
    let nameDescription: String
    let nameDescriptionColor: String
    
    let heroicTooltip: Bool
    
    let upgradable: Bool
    let context: String
    let availableContexts: [String]
    
    let bonusLists: [Int]
    let bonusSummary: BonusSummary
    
    let disenchantingSkillRank: Int?


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



class BonusSummary: Codable {
//    let defaultBonusLists: []
//    let chanceBonusLists: []
//    let bonusChances: []
}



class WOWItemSource: Codable {
    let sourceID: Int
    let sourceType: String
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case sourceType
    }
}


class WOWItemSpell: Codable {
    let spellID: Int
    let scaledDescription: String
    let trigger: String
    let consumable: Bool
    let categoryID: Int
    let nCharges: Int
    
    enum CodingKeys: String, CodingKey {
        case spellID = "spellId"
        case scaledDescription
        case trigger
        case consumable
        case categoryID = "categoryId"
        case nCharges
    }
}


class WeaponInfo: Codable {
    let damage: Damage
    let weaponSpeed: Double
    let dps: Double
}



class Damage: Codable {
    let min: Int
    let max: Int
    let exactMin: Int
    let exactMax: Int
}



class WOWItemSummary: Codable {
    let id: Int
    let name: String
    let icon: String
    let quality: Int
    let itemLevel: Int
    let tooltipParams: TooltipParams
    let stats: [WOWItemStat]
    let armor: Int
    let context: String
    let bonusLists: [Int]
    let displayInfoID: Int
    let artifactID: Int
    let artifactAppearanceID: Int
//    let artifactTraits: []
//    let relics: []
    let appearance: WOWItemAppearance
    
    let weaponInfo: WeaponInfo?
    
    
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



class WOWItemAppearance: Codable {
    let transmogItemAppearanceModID: Int?
    let itemAppearanceModID: Int?
    let itemID: Int?
    let enchantDisplayInfoID: Int?
}



class TooltipParams: Codable {
    let timewalkerLevel: Int
    let azeritePowerLevel: Int
    let azeritePower0: Int
    let azeritePower1: Int
    let azeritePower2: Int
    let azeritePower3: Int
    let azeritePower4: Int
}



class WOWItemUpgrade: Codable {
    let current: Int
    let total: Int
    let itemLevelIncrement: Int
}



class WOWItemStat: Codable {
    let stat: Int
    let amount: Int
}



class WOWEquippedItems: Codable {
    let mainHand: WOWItemSummary?
    let head: WOWItemSummary?
    let neck: WOWItemSummary?
    let shoulder: WOWItemSummary?
    let back: WOWItemSummary?
    let chest: WOWItemSummary?
    let tabard: WOWItemSummary?
    let wrist: WOWItemSummary?
    let hands: WOWItemSummary?
    let finger1: WOWItemSummary?
    let finger2: WOWItemSummary?
    let waist: WOWItemSummary?
    let legs: WOWItemSummary?
    let feet: WOWItemSummary?
    let trinket1: WOWItemSummary?
    let trinket2: WOWItemSummary?
    
    let averageItemLevel: Int
    let averageItemLevelEquipped: Int
}




// MARK: - Item Sets

class WOWItemSet: Codable {
    let id: Int
    let name: String
    let setBonuses: [SetBonus]
    let items: [Int]
}



class SetBonus: Codable {
    let description: String
    let threshold: Int
}



// MARK: - Item Classes

class ItemClassIndex: Codable {
    let classes: [ItemClass]
}



class ItemClass: Codable {
    let `class`: Int
    let name: String
    let subclasses: [ItemSubclass]
}



class ItemSubclass: Codable {
    let subclass: Int
    let name: String
}
