//
//  Perk.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class PerkIndex: Codable {
    public let perks: [Perk]
}



public class Perk: Codable {
    public let guildLevel: Int
    public let spell: Spell
}
