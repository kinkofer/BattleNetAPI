//
//  WOWItem.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWItem: Codable, SelfDecodable {
    public let _links: SelfLink<WOWItem>
    public let id: Int
    public let name: String
    
    public let quality: EnumType
    
    public let isEquippable: Bool
    public let isStackable: Bool
    public let maxCount: Int
    
    public let purchasePrice: Int
    public let sellPrice: Int
    public let purchaseQuantity: Int
    
    public let itemClass: KeyLink<ItemClass>
    public let itemSubclass: KeyLink<ItemSubclass>
    
    public let inventoryType: EnumType
    public let level: Int
    public let requiredLevel: Int
    
    public let media: MediaLink
    public let appearances: [MediaLink]
    
    public let previewItem: PreviewItem
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct PreviewItem: Codable, SelfDecodable {
    public let item: MediaLink
    public let context: Int
    public let bonusList: [Int]
    public let quality: EnumType
    public let name: String
    public let media: MediaLink
    public let itemClass: KeyLink<ItemClass>
    public let itemSubclass: KeyLink<ItemSubclass>
    public let inventoryType: EnumType
    public let binding: EnumType
    public let uniqueEquipped: String
    public let weapon: Weapon
    public let stats: [Stat]
    public let spells: [WOWSpell]
    public let requirements: Requirements
    public let level: ValueForDisplay
    public let durability: ValueForDisplay

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Requirements: Codable {
    public let level: ValueForDisplay
}


public struct WOWSpell: Codable {
    public let spell: KeyLink<ItemClass>
    public let description: String
}


public struct Stat: Codable, SelfDecodable {
    public let type: EnumType
    public let value: Int
    public let isNegated: Bool?
    public let display: Display

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Display: Codable, SelfDecodable {
    public let displayString: String
    public let color: Color

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Color: Codable {
    public let r, g, b, a: Int
}


public struct Weapon: Codable, SelfDecodable {
    public let damage: Damage
    public let attackSpeed: ValueForDisplay
    public let dps: ValueForDisplay

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Damage: Codable, SelfDecodable {
    public let minValue: Int
    public let maxValue: Int
    public let displayString: String
    public let damageClass: EnumType

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct BonusSummary: Codable {
//    public let defaultBonusLists: []
//    public let chanceBonusLists: []
//    public let bonusChances: []
}



public struct WOWItemSource: Codable {
    public let sourceID: Int
    public let sourceType: String
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case sourceType
    }
}


public struct WOWItemSpell: Codable {
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


public struct WeaponInfo: Codable {
    public let damage: Damage
    public let weaponSpeed: Double
    public let dps: Double
}



public struct WOWItemSummary: Codable {
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



public struct WOWItemAppearance: Codable {
    public let transmogItemAppearanceModID: Int?
    public let itemAppearanceModID: Int?
    public let itemID: Int?
    public let enchantDisplayInfoID: Int?
}



public struct TooltipParams: Codable {
    public let timewalkerLevel: Int
    public let azeritePowerLevel: Int
    public let azeritePower0: Int
    public let azeritePower1: Int
    public let azeritePower2: Int
    public let azeritePower3: Int
    public let azeritePower4: Int
}



public struct WOWItemUpgrade: Codable {
    public let current: Int
    public let total: Int
    public let itemLevelIncrement: Int
}



public struct WOWItemStat: Codable {
    public let stat: Int
    public let amount: Int
}



public struct WOWEquippedItems: Codable {
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

public struct WOWItemSet: Codable {
    public let id: Int
    public let name: String
    public let setBonuses: [SetBonus]
    public let items: [Int]
}



public struct SetBonus: Codable {
    public let description: String
    public let threshold: Int
}



// MARK: - Item Classes

public struct ItemClassIndex: Codable {
    public let classes: [ItemClass]
}



public struct ItemClass: Codable {
    public let `struct`: Int
    public let name: String
    public let subclasses: [ItemSubclass]
}



public struct ItemSubclass: Codable {
    public let subclass: Int
    public let name: String
}
