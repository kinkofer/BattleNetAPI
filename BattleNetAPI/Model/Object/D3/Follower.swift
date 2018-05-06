//
//  Follower.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Follower: Codable {
    var slug: String = ""
    var name: String = ""
    var realName: String = ""
    var portrait: String = ""
    
    var skills: [D3Skill] = [D3Skill]()
}



class FollowerHero: Codable {
    var slug: String = ""
    var level = 0
    
    var items: EquippedItems = EquippedItems()
    var stats: FollowerStats = FollowerStats()
    var skills: [D3Skill] = [D3Skill]()
}



class FollowerStats: Codable {
    var goldFind: Float = 0.0
    var magicFind: Float = 0.0
    var experienceBonus: Float = 0.0
}
