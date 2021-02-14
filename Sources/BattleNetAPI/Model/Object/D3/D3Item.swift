//
//  D3Item.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class D3Item: Codable {
    public let id: String
    public let slug: String
    public let name: String
    
    public let icon: String
    public let path: String
    
    public var slugAndID: String {
        return "\(slug)-\(id)"
    }
}



public class D3ItemType: Codable {
    public let id: String
    public let name: String
    public let path: String
    
    public var slug: String {
        return String(path.split(separator: "/").last ?? "")
    }
}



public class D3EquippedItem: Codable {
    public let id: String
    public let name: String
    public let icon: String
    public let displayColor: String
    public let tooltipParams: String
    public let transmogItem: D3EquippedItem?
}



public class D3FullItem: Codable {
    public let id: String
    public let slug: String
    public let name: String
    public let icon: String
    
    public let typeName: String
    public let type: D3TwoHandedItemType
    
    public let accountBound: Bool
    
    public let requiredLevel: Int
    public let stackSizeMax: Int
    
    public let tooltipParams: String
    public let flavorText: String
    public let flavorTextHtml: String
    
    public let damage: String
    public let damageHtml: String
    public let dps: String
    
    public let color: String
    
    public let isSeasonRequiredToDrop: Bool
    public let seasonRequiredToDrop: Int
    
    public let slots: [String]
    public let attributes: AttributeSet
    public let randomAffixes: [RandomAffix]
    
    /// An array of item path slugs and IDs of the items in the set, not including the current item. Example: "item/firebirds-pinions-Unique_Shoulder_Set_06_x1"
    public let setItems: [String] // TODO: Determine what object is in the array
}



public class D3FullEquippedItem: Codable {
    public let id: String
    public let name: String
    public let icon: String
    
    public let displayColor: String
    public let dye: Dye?
    public let transmog: D3EquippedItem?

    public let typeName: String
    public let type: D3TwoHandedItemType

    public let accountBound: Bool

    public let requiredLevel: Int
    public let itemLevel: Int
    public let stackSizeMax: Int

    public let tooltipParams: String
    public let flavorText: String?

    public let damage: String?
    public let dps: String?
    public let armor: Double
    public let attacksPerSecond: Double
    public let minDamage: Double
    public let maxDamage: Double
    public let blockChance: String?

    public let isSeasonRequiredToDrop: Bool
    public let seasonRequiredToDrop: Int

    public let slots: String
    public let attributes: EquippedAttributeSet?
    public let attributesHtml: EquippedAttributeSet?

    public let openSockets: Int
    public let gems: [Gem]?

    public let set: D3ItemSet?
}



public class D3TwoHandedItemType: Codable {
    public let id: String
    public let twoHanded: Bool
}



// MARK: Attribute

public class AttributeSet: Codable {
    public let primary: [Attribute]
    public let secondary: [Attribute]?
    public let other: [Attribute]?
}



public class Attribute: Codable {
    public let text: String
    public let textHtml: String
}



// MARK: Equipped Attribute

public class EquippedAttributeSet: Codable {
    public let primary: [String]
    public let secondary: [String]?
}



// MARK:

public class RandomAffix: Codable {
    public let oneOf: [Attribute]
}



public class EquippedItems: Codable {
    public let head: D3EquippedItem?
    public let neck: D3EquippedItem?
    public let torso: D3EquippedItem?
    public let shoulders: D3EquippedItem?
    public let legs: D3EquippedItem?
    public let waist: D3EquippedItem?
    public let hands: D3EquippedItem?
    public let bracers: D3EquippedItem?
    public let feet: D3EquippedItem?
    public let leftFinger: D3EquippedItem?
    public let rightFinger: D3EquippedItem?
    public let mainHand: D3EquippedItem?
    public let offHand: D3EquippedItem?
}



public class FullEquippedItems: Codable {
    public let head: D3FullEquippedItem?
    public let neck: D3FullEquippedItem?
    public let torso: D3FullEquippedItem?
    public let shoulders: D3FullEquippedItem?
    public let legs: D3FullEquippedItem?
    public let waist: D3FullEquippedItem?
    public let hands: D3FullEquippedItem?
    public let bracers: D3FullEquippedItem?
    public let feet: D3FullEquippedItem?
    public let leftFinger: D3FullEquippedItem?
    public let rightFinger: D3FullEquippedItem?
    public let mainHand: D3FullEquippedItem?
    public let offHand: D3FullEquippedItem?
}



public class Gem: Codable {
    public let item: D3Item
    public let attributes: [String]
    public let isGem: Bool
    public let isJewel: Bool
    
    public let jewelRank: Int?
    public let jewelSecondaryUnlockRank: Int?
}



public class D3ItemSet: Codable {
    public let name: String
    public let slug: String
    public let description: String
    public let descriptionHtml: String
}



public class Dye: Codable {
    public let id: String
    public let name: String
    public let icon: String
    public let tooltipParams: String
}
