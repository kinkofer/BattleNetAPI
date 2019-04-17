//
//  Perk.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class PerkIndex: Codable {
    let perks: [Perk]
}



class Perk: Codable {
    let guildLevel: Int
    let spell: Spell
}
