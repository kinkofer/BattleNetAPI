//
//  Spell.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Spell: Codable {
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var icon: String = ""
    
    var castTime: String = ""
    
    var subtext: String? = nil
    var powerCost: String? = nil
    var cooldown: String? = nil
}
