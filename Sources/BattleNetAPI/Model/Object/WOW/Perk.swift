//
//  Perk.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct PerkIndex: Codable {
    public let perks: [Perk]
}



public struct Perk: Codable {
    public let guildLevel: Int
    public let spell: Spell
}
