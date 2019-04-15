//
//  D3Item.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Item: Codable {
    let id: String
    let slug: String
    let name: String
    
    let icon: String
    let path: String
    
    var slugAndID: String {
        return "\(slug)-\(id)"
    }
}



class D3ItemType: Codable {
    let id: String
    let name: String
    let path: String
    
    var slug: String {
        return String(path.split(separator: "/").last ?? "")
    }
}



class D3EquippedItem: Codable {
    let id: String
    let name: String
    let icon: String
    let displayColor: String
    let tooltipParams: String
    let transmogItem: D3EquippedItem?
}



class D3FullItem: Codable {
    let id: String
    let slug: String
    let name: String
    let icon: String
    
    let typeName: String
    let type: D3TwoHandedItemType
    
    let accountBound: Bool
    
    let requiredLevel: Int
    let stackSizeMax: Int
    
    let tooltipParams: String
    let flavorText: String
    let flavorTextHtml: String
    
    let damage: String
    let damageHtml: String
    let dps: String
    
    let color: String
    
    let isSeasonRequiredToDrop: Bool
    let seasonRequiredToDrop: Int
    
    let slots: [String]
    let attributes: AttributeSet
    let randomAffixes: [RandomAffix]
    
    /// An array of item path slugs and IDs of the items in the set, not including the current item. Example: "item/firebirds-pinions-Unique_Shoulder_Set_06_x1"
    let setItems: [String] // TODO: Determine what object is in the array
}



class D3FullEquippedItem: Codable {
    let id: String
    let name: String
    let icon: String
    
    let displayColor: String
    let dye: Dye?
    let transmog: D3EquippedItem?

    let typeName: String
    let type: D3TwoHandedItemType

    let accountBound: Bool

    let requiredLevel: Int
    let itemLevel: Int
    let stackSizeMax: Int

    let tooltipParams: String
    let flavorText: String?

    let damage: String?
    let dps: String?
    let armor: Double
    let attacksPerSecond: Double
    let minDamage: Double
    let maxDamage: Double
    let blockChance: String?

    let isSeasonRequiredToDrop: Bool
    let seasonRequiredToDrop: Int

    let slots: String
    let attributes: EquippedAttributeSet?
    let attributesHtml: EquippedAttributeSet?

    let openSockets: Int
    let gems: [Gem]?

    let set: D3ItemSet?
}



class D3TwoHandedItemType: Codable {
    let id: String
    let twoHanded: Bool
}



// MARK: Attribute

class AttributeSet: Codable {
    let primary: [Attribute]
    let secondary: [Attribute]?
    let other: [Attribute]?
}



class Attribute: Codable {
    let text: String
    let textHtml: String
}



// MARK: Equipped Attribute

class EquippedAttributeSet: Codable {
    let primary: [String]
    let secondary: [String]?
}



// MARK:

class RandomAffix: Codable {
    let oneOf: [Attribute]
}



class EquippedItems: Codable {
    let head: D3EquippedItem?
    let neck: D3EquippedItem?
    let torso: D3EquippedItem?
    let shoulders: D3EquippedItem?
    let legs: D3EquippedItem?
    let waist: D3EquippedItem?
    let hands: D3EquippedItem?
    let bracers: D3EquippedItem?
    let feet: D3EquippedItem?
    let leftFinger: D3EquippedItem?
    let rightFinger: D3EquippedItem?
    let mainHand: D3EquippedItem?
    let offHand: D3EquippedItem?
}



class FullEquippedItems: Codable {
    let head: D3FullEquippedItem?
    let neck: D3FullEquippedItem?
    let torso: D3FullEquippedItem?
    let shoulders: D3FullEquippedItem?
    let legs: D3FullEquippedItem?
    let waist: D3FullEquippedItem?
    let hands: D3FullEquippedItem?
    let bracers: D3FullEquippedItem?
    let feet: D3FullEquippedItem?
    let leftFinger: D3FullEquippedItem?
    let rightFinger: D3FullEquippedItem?
    let mainHand: D3FullEquippedItem?
    let offHand: D3FullEquippedItem?
}



class Gem: Codable {
    let item: D3Item
    let attributes: [String]
    let isGem: Bool
    let isJewel: Bool
    
    let jewelRank: Int?
    let jewelSecondaryUnlockRank: Int?
}



class D3ItemSet: Codable {
    let name: String
    let slug: String
    let description: String
    let descriptionHtml: String
}



class Dye: Codable {
    let id: String
    let name: String
    let icon: String
    let tooltipParams: String
}
