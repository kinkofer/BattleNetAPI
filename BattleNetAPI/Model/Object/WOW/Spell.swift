//
//  Spell.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Spell: Codable {
    let id: Int
    let name: String
    let description: String
    let icon: String
    
    let castTime: String
    
    let subtext: String?
    let powerCost: String?
    let cooldown: String?
}
