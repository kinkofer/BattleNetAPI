//
//  D3Item.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Item: Codable {
    var id = ""
    var slug = ""
    var name = ""
    
    var icon = ""
    var path = ""
    
    var slugAndID: String {
        return "\(slug)-\(id)"
    }
}



class D3ItemType: Codable {
    var id = ""
    var name = ""
    var path = ""
    
    var slug: String {
        return String(path.split(separator: "/").last ?? "")
    }
}



class D3EquippedItem: Codable {
    var id = ""
    var name = ""
    var icon = ""
    var displayColor = ""
    var tooltipParams = ""
    var transmogItem: D3EquippedItem? = nil
}



class D3FullItem: Codable {
    var id = ""
    var slug = ""
    var name = ""
    var icon = ""
    
    var typeName = ""
    var type = D3TwoHandedItemType()
    
    var accountBound = false
    
    var requiredLevel = 0
    var stackSizeMax = 0
    
    var tooltipParams = ""
    var flavorText = ""
    var flavorTextHtml = ""
    
    var damage = ""
    var damageHtml = ""
    var dps = ""
    
    var color = ""
    
    var isSeasonRequiredToDrop = false
    var seasonRequiredToDrop = -1
    
    var slots = [String]()
    var attributes = AttributeSet()
    var randomAffixes = [RandomAffix]()
    
    /// An array of item path slugs and IDs of the items in the set, not including the current item. Example: "item/firebirds-pinions-Unique_Shoulder_Set_06_x1"
    var setItems = [String]() // TODO: Determine what object is in the array
}



class D3FullEquippedItem: Codable {
    var id = ""
    var name = ""
    var icon = ""
    
    var displayColor = ""
    var dye: Dye? = nil
    var transmog: D3EquippedItem? = D3EquippedItem()

    var typeName = ""
    var type = D3TwoHandedItemType()

    var accountBound = false

    var requiredLevel = 0
    var itemLevel = 0
    var stackSizeMax = 0

    var tooltipParams = ""
    var flavorText: String? = nil

    var damage: String? = nil
    var dps: String? = nil
    var armor = 0.0
    var attacksPerSecond = 0.0
    var minDamage = 0.0
    var maxDamage = 0.0
    var blockChance: String? = nil

    var isSeasonRequiredToDrop = false
    var seasonRequiredToDrop = -1

    var slots = ""
    var attributes: EquippedAttributeSet? = nil
    var attributesHtml: EquippedAttributeSet? = nil

    var openSockets = 0
    var gems: [Gem]? = nil

    var set: D3ItemSet? = nil
}



class D3TwoHandedItemType: Codable {
    var id = ""
    var twoHanded = false
}



// MARK: Attribute

class AttributeSet: Codable {
    var primary = [Attribute]()
    var secondary: [Attribute]? = nil
    var other: [Attribute]? = nil
}



class Attribute: Codable {
    var text = ""
    var textHtml = ""
}



// MARK: Equipped Attribute

class EquippedAttributeSet: Codable {
    var primary = [String]()
    var secondary: [String]? = nil
}



// MARK:

class RandomAffix: Codable {
    var oneOf = [Attribute]()
}



class EquippedItems: Codable {
    var head: D3EquippedItem? = nil
    var neck: D3EquippedItem? = nil
    var torso: D3EquippedItem? = nil
    var shoulders: D3EquippedItem? = nil
    var legs: D3EquippedItem? = nil
    var waist: D3EquippedItem? = nil
    var hands: D3EquippedItem? = nil
    var bracers: D3EquippedItem? = nil
    var feet: D3EquippedItem? = nil
    var leftFinger: D3EquippedItem? = nil
    var rightFinger: D3EquippedItem? = nil
    var mainHand: D3EquippedItem? = nil
    var offHand: D3EquippedItem? = nil
}



class FullEquippedItems: Codable {
    var head: D3FullEquippedItem? = nil
    var neck: D3FullEquippedItem? = nil
    var torso: D3FullEquippedItem? = nil
    var shoulders: D3FullEquippedItem? = nil
    var legs: D3FullEquippedItem? = nil
    var waist: D3FullEquippedItem? = nil
    var hands: D3FullEquippedItem? = nil
    var bracers: D3FullEquippedItem? = nil
    var feet: D3FullEquippedItem? = nil
    var leftFinger: D3FullEquippedItem? = nil
    var rightFinger: D3FullEquippedItem? = nil
    var mainHand: D3FullEquippedItem? = nil
    var offHand: D3FullEquippedItem? = nil
}



class Gem: Codable {
    var item = D3Item()
    var attributes = [String]()
    var isGem = false
    var isJewel = false
    
    var jewelRank: Int? = nil
    var jewelSecondaryUnlockRank: Int? = nil
}



class D3ItemSet: Codable {
    var name = ""
    var slug = ""
    var description = ""
    var descriptionHtml = ""
}



class Dye: Codable {
    var id = ""
    var name = ""
    var icon = ""
    var tooltipParams = ""
}
