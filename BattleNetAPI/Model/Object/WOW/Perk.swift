//
//  Perk.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/25/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class PerkIndex: Codable {
    var perks: [Perk] = [Perk]()
}



class Perk: Codable {
    var guildLevel: Int = 0
    var spell: Spell = Spell()
}
