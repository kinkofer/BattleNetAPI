//
//  Mount.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MountIndex: Codable {
    let mounts: [Mount]
}



class CollectedMountIndex: Codable {
    let collected: [Mount]
    let numCollected: Int
    let numNotCollected: Int
}



class Mount: Codable {
    let name: String
    let spellID: Int
    let creatureID: Int
    let itemID: Int
    let qualityID: Int
    let icon: String?
    let isGround: Bool
    let isFlying: Bool
    let isAquatic: Bool
    let isJumping: Bool
    
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
