//
//  Follower.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Follower: Codable {
    public let slug: String
    public let name: String
    public let realName: String
    public let portrait: String
    
    public let skills: [D3Skill]
}



public struct FollowerHero: Codable {
    public let slug: String
    public let level: Int
    
    public let items: EquippedItems
    public let stats: FollowerStats
    public let skills: [D3Skill]
}



public struct FollowerStats: Codable {
    public let goldFind: Double
    public let magicFind: Double
    public let experienceBonus: Double
}
