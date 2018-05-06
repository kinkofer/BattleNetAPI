//
//  Mount.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MountIndex: Codable {
    var mounts: [Mount] = [Mount]()
}



class CollectedMountIndex: Codable {
    var collected: [Mount] = [Mount]()
    var numCollected: Int = 0
    var numNotCollected: Int = 0
}



class Mount: Codable {
    var name: String = ""
    var spellID: Int = 0
    var creatureID: Int = 0
    var itemID: Int = 0
    var qualityID: Int = 0
    var icon: String = ""
    var isGround: Bool = false
    var isFlying: Bool = false
    var isAquatic: Bool = false
    var isJumping: Bool = false
    
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
