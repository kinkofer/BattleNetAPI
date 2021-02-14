//
//  Mount.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class MountIndex: Codable {
    public let mounts: [Mount]
}



public class CollectedMountIndex: Codable {
    public let collected: [Mount]
    public let numCollected: Int
    public let numNotCollected: Int
}



public class Mount: Codable {
    public let name: String
    public let spellID: Int
    public let creatureID: Int
    public let itemID: Int
    public let qualityID: Int
    public let icon: String?
    public let isGround: Bool
    public let isFlying: Bool
    public let isAquatic: Bool
    public let isJumping: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case spellID = "spellId"
        case creatureID = "creatureId"
        case itemID = "itemId"
        case qualityID = "qualityId"
        case icon
        case isGround
        case isFlying
        case isAquatic
        case isJumping
    }
}
