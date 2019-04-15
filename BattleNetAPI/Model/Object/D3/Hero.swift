//
//  Hero.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/11/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Hero: Codable {
    let id: Int
    let name: String
    let `class`: String
    let classSlug: String
    let gender: Int
    let level: Int
    let paragonLevel: Int
    
    let kills: Kills
    let hardcore: Bool
    let seasonal: Bool
    let dead: Bool
    let lastUpdated: Double
    
    
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



class FullHero: Codable {
    let id: Int
    let name: String
    let `class`: String
    let gender: Int
    let level: Int
    let paragonLevel: Int
    
    let kills: Kills
    let hardcore: Bool
    let seasonal: Bool
    let seasonCreated: Int
    
    let alive: Bool
    let lastUpdated: Double
    let highestSoloRiftCompleted: Int
    
    let stats: D3StatBlock
    let skills: HeroSkillSet
    let items: EquippedItems

    let followers: HeroFollowers
    let legendaryPowers: [D3EquippedItem]
    
    let progression: D3Progression
}



class HeroFollowers: Codable {
    let enchantress: FollowerHero
    let scoundrel: FollowerHero
    let templar: FollowerHero
}



class HeroFollowerItems: Codable {
    let enchantress: FullEquippedItems
    let scoundrel: FullEquippedItems
    let templar: FullEquippedItems
}



class HeroSkillSet: Codable {
    let active: [D3SkillConfiguration]
    let passive: [D3SkillConfiguration]
}



class D3Progression: Codable {
    let act1: CompletedAct
    let act2: CompletedAct
    let act3: CompletedAct
    let act4: CompletedAct
    let act5: CompletedAct
}



class CompletedAct: Codable {
    let completed: Bool
    let completedQuests: [D3Quest]
}



class D3StatBlock: Codable {
    let life: Double
    let damage: Double
    let toughness: Double
    let healing: Double
    let attackSpeed: Double
    let armor: Double
    let strength: Double
    let dexterity: Double
    let vitality: Double
    let intelligence: Double
    let physicalResist: Double
    let fireResist: Double
    let coldResist: Double
    let lightningResist: Double
    let poisonResist: Double
    let arcaneResist: Double
    let blockChance: Double
    let blockAmountMin: Double
    let blockAmountMax: Double
    let goldFind: Double
    let critChance: Double
    let thorns: Double
    let lifeSteal: Double
    let lifePerKill: Double
    let lifeOnHit: Double
    let primaryResource: Double
    let secondaryResource: Double
}
