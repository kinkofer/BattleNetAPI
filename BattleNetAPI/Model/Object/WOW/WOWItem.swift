//
//  WOWItem.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWItem: Codable {
    var id: Int = 0
    var description: String = ""
    var name: String = ""
    var icon: String = ""
    
    var artifactID: Int = 0
    var quality: Int = 0
    
    var equippable: Bool = false
    var isAuctionable: Bool = false
    var stackable: Int = 0
    var maxCount: Int = 0
    var containerSlots: Int = 0
    var itemBind: Int = 0
    
    var bonusStats: [WOWItemStat] = [WOWItemStat]()
    var itemSpells: [WOWItemSpell] = [WOWItemSpell]()
    
    var buyPrice: Int = 0
    var sellPrice: Int = 0
    var itemClass: Int = 0
    var itemSubClass: Int = 0
    
    var inventoryType: Int = 0
    var itemLevel: Int = 0
    var maxDurability: Int = 0
    var minFactionID: Int = 0
    var minReputation: Int = 0
    
    var requiredSkill: Int = 0
    var requiredLevel: Int = 0
    var requiredSkillRank: Int = 0
    
    var itemSource: WOWItemSource = WOWItemSource()
    var hasSockets: Bool = false
    
    var weaponInfo: WeaponInfo? = nil
    var armor: Int = 0
    var baseArmor: Int = 0
    
    var displayInfoID: Int = 0
    var nameDescription: String = ""
    var nameDescriptionColor: String = ""
    
    var heroicTooltip: Bool = false
    
    var upgradable: Bool = false
    var context: String = ""
    var availableContexts: [String] = [String]()
    
    var bonusLists: [Int] = [Int]()
    var bonusSummary: BonusSummary = BonusSummary()
    
    var disenchantingSkillRank: Int? = nil


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
//    var defaultBonusLists: []
//    var chanceBonusLists: []
//    var bonusChances: []
}



class WOWItemSource: Codable {
    var sourceID: Int = 0
    var sourceType: String = ""
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case sourceType
    }
}


class WOWItemSpell: Codable {
    var spellID: Int = 0
    var scaledDescription: String = ""
    var trigger: String = ""
    var consumable: Bool = false
    var categoryID: Int = 0
    var nCharges: Int = 0
    
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
    var damage: Damage = Damage()
    var weaponSpeed: Double = 0
    var dps: Double = 0
}



class Damage: Codable {
    var min: Int = 0
    var max: Int = 0
    var exactMin: Int = 0
    var exactMax: Int = 0
}



class WOWItemSummary: Codable {
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    var quality: Int = 0
    var itemLevel: Int = 0
    var tooltipParams: TooltipParams = TooltipParams()
    var stats: [WOWItemStat] = [WOWItemStat]()
    var armor: Int = 0
    var context: String = ""
    var bonusLists: [Int] = [Int]()
    var displayInfoID: Int = 0
    var artifactID: Int = 0
    var artifactAppearanceID: Int = 0
//    var artifactTraits: []
//    var relics: []
    var appearance: WOWItemAppearance = WOWItemAppearance()
    
    var weaponInfo: WeaponInfo? = nil
    
    
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
    var transmogItemAppearanceModID: Int? = nil
    var itemAppearanceModID: Int? = nil
    var itemID: Int? = nil
    var enchantDisplayInfoID: Int? = nil
}



class TooltipParams: Codable {
    var timewalkerLevel: Int = 0
    var azeritePowerLevel: Int = 0
    var azeritePower0: Int = 0
    var azeritePower1: Int = 0
    var azeritePower2: Int = 0
    var azeritePower3: Int = 0
    var azeritePower4: Int = 0
}



class WOWItemUpgrade: Codable {
    var current: Int = 0
    var total: Int = 0
    var itemLevelIncrement: Int = 0
}



class WOWItemStat: Codable {
    var stat: Int = 0
    var amount: Int = 0
}



class WOWEquippedItems: Codable {
    var mainHand: WOWItemSummary? = nil
    var head: WOWItemSummary? = nil
    var neck: WOWItemSummary? = nil
    var shoulder: WOWItemSummary? = nil
    var back: WOWItemSummary? = nil
    var chest: WOWItemSummary? = nil
    var tabard: WOWItemSummary? = nil
    var wrist: WOWItemSummary? = nil
    var hands: WOWItemSummary? = nil
    var finger1: WOWItemSummary? = nil
    var finger2: WOWItemSummary? = nil
    var waist: WOWItemSummary? = nil
    var legs: WOWItemSummary? = nil
    var feet: WOWItemSummary? = nil
    var trinket1: WOWItemSummary? = nil
    var trinket2: WOWItemSummary? = nil
    
    var averageItemLevel: Int = 0
    var averageItemLevelEquipped: Int = 0
}




// MARK: - Item Sets

class WOWItemSet: Codable {
    var id: Int = 0
    var name: String = ""
    var setBonuses: [SetBonus] = [SetBonus]()
    var items: [Int] = [Int]()
}



class SetBonus: Codable {
    var description: String = ""
    var threshold: Int = 0
}



// MARK: - Item Classes

class ItemClassIndex: Codable {
    var classes: [ItemClass] = [ItemClass]()
}



class ItemClass: Codable {
    var `class`: Int = 0
    var name: String = ""
    var subclasses: [ItemSubclass] = [ItemSubclass]()
}



class ItemSubclass: Codable {
    var subclass: Int = 0
    var name: String = ""
}
