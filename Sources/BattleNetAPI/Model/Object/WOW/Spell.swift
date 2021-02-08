//
//  Spell.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class Spell: Codable {
    public let id: Int
    public let name: String
    public let description: String
    public let icon: String
    
    public let castTime: String
    
    public let subtext: String?
    public let powerCost: String?
    public let cooldown: String?
}
