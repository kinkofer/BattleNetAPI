//
//  Hero.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/11/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class Hero: Codable {
    public let id: Int
    public let name: String
    public let `class`: String
    public let classSlug: String
    public let gender: Int
    public let level: Int
    public let paragonLevel: Int
    
    public let kills: Kills
    public let hardcore: Bool
    public let seasonal: Bool
    public let dead: Bool
    public let lastUpdated: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case `class`
        case classSlug
        case gender
        case level
        case paragonLevel
        
        case kills
        case hardcore
        case seasonal
        case dead
        case lastUpdated = "last-updated"
    }
}



public class FullHero: Codable {
    public let id: Int
    public let name: String
    public let `class`: String
    public let gender: Int
    public let level: Int
    public let paragonLevel: Int
    
    public let kills: Kills
    public let hardcore: Bool
    public let seasonal: Bool
    public let seasonCreated: Int
    
    public let alive: Bool
    public let lastUpdated: Double
    public let highestSoloRiftCompleted: Int
    
    public let stats: D3StatBlock
    public let skills: HeroSkillSet
    public let items: EquippedItems

    public let followers: HeroFollowers
    public let legendaryPowers: [D3EquippedItem]
    
    public let progression: D3Progression
}



public class HeroFollowers: Codable {
    public let enchantress: FollowerHero
    public let scoundrel: FollowerHero
    public let templar: FollowerHero
}



public class HeroFollowerItems: Codable {
    public let enchantress: FullEquippedItems
    public let scoundrel: FullEquippedItems
    public let templar: FullEquippedItems
}



public class HeroSkillSet: Codable {
    public let active: [D3SkillConfiguration]
    public let passive: [D3SkillConfiguration]
}



public class D3Progression: Codable {
    public let act1: CompletedAct
    public let act2: CompletedAct
    public let act3: CompletedAct
    public let act4: CompletedAct
    public let act5: CompletedAct
}



public class CompletedAct: Codable {
    public let completed: Bool
    public let completedQuests: [D3Quest]
}



public class D3StatBlock: Codable {
    public let life: Double
    public let damage: Double
    public let toughness: Double
    public let healing: Double
    public let attackSpeed: Double
    public let armor: Double
    public let strength: Double
    public let dexterity: Double
    public let vitality: Double
    public let intelligence: Double
    public let physicalResist: Double
    public let fireResist: Double
    public let coldResist: Double
    public let lightningResist: Double
    public let poisonResist: Double
    public let arcaneResist: Double
    public let blockChance: Double
    public let blockAmountMin: Double
    public let blockAmountMax: Double
    public let goldFind: Double
    public let critChance: Double
    public let thorns: Double
    public let lifeSteal: Double
    public let lifePerKill: Double
    public let lifeOnHit: Double
    public let primaryResource: Double
    public let secondaryResource: Double
}
