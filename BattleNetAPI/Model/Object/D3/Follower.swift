//
//  Follower.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Follower: Codable {
    let slug: String
    let name: String
    let realName: String
    let portrait: String
    
    let skills: [D3Skill]
}



class FollowerHero: Codable {
    let slug: String
    let level: Int
    
    let items: EquippedItems
    let stats: FollowerStats
    let skills: [D3Skill]
}



class FollowerStats: Codable {
    let goldFind: Double
    let magicFind: Double
    let experienceBonus: Double
}
