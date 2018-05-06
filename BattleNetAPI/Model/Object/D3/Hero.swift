//
//  Hero.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/11/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Hero: Codable {
    var id: Int = 0
    var name: String = ""
    var `class`: String = ""
    var classSlug: String = ""
    var gender: Int = 0
    var level: Int = 0
    var paragonLevel: Int = 0
    
    var kills: Kills = Kills()
    var hardcore: Bool = false
    var seasonal: Bool = false
    var dead: Bool = false
    var lastUpdated: Double = 0
    
    
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
    var id: Int = 0
    var name: String = ""
    var `class`: String = ""
    var gender: Int = 0
    var level: Int = 0
    var paragonLevel: Int = 0
    
    var kills: Kills = Kills()
    var hardcore: Bool = false
    var seasonal: Bool = false
    var seasonCreated: Int = 0
    
    var alive: Bool = true
    var lastUpdated: Double = 0
    var highestSoloRiftCompleted: Int = 0
    
    var stats: D3StatBlock = D3StatBlock()
    var skills: HeroSkillSet = HeroSkillSet()
    var items: EquippedItems = EquippedItems()

    var followers: HeroFollowers = HeroFollowers()
    var legendaryPowers: [D3EquippedItem] = [D3EquippedItem]()
    
    var progression: D3Progression = D3Progression()
}



class HeroFollowers: Codable {
    var enchantress: FollowerHero = FollowerHero()
    var scoundrel: FollowerHero = FollowerHero()
    var templar: FollowerHero = FollowerHero()
}



class HeroFollowerItems: Codable {
    var enchantress: FullEquippedItems = FullEquippedItems()
    var scoundrel: FullEquippedItems = FullEquippedItems()
    var templar: FullEquippedItems = FullEquippedItems()
}



class HeroSkillSet: Codable {
    var active: [D3SkillConfiguration] = [D3SkillConfiguration]()
    var passive: [D3SkillConfiguration] = [D3SkillConfiguration]()
}



class D3Progression: Codable {
    var act1: CompletedAct = CompletedAct()
    var act2: CompletedAct = CompletedAct()
    var act3: CompletedAct = CompletedAct()
    var act4: CompletedAct = CompletedAct()
    var act5: CompletedAct = CompletedAct()
}



class CompletedAct: Codable {
    var completed: Bool = false
    var completedQuests: [D3Quest] = [D3Quest]()
}



class D3StatBlock: Codable {
    var life: Float = 0.0
    var damage: Float = 0.0
    var toughness: Float = 0.0
    var healing: Float = 0.0
    var attackSpeed: Float = 0.0
    var armor: Float = 0.0
    var strength: Float = 0.0
    var dexterity: Float = 0.0
    var vitality: Float = 0.0
    var intelligence: Float = 0.0
    var physicalResist: Float = 0.0
    var fireResist: Float = 0.0
    var coldResist: Float = 0.0
    var lightningResist: Float = 0.0
    var poisonResist: Float = 0.0
    var arcaneResist: Float = 0.0
    var blockChance: Float = 0.0
    var blockAmountMin: Float = 0.0
    var blockAmountMax: Float = 0.0
    var goldFind: Float = 0.0
    var critChance: Float = 0.0
    var thorns: Float = 0.0
    var lifeSteal: Float = 0.0
    var lifePerKill: Float = 0.0
    var lifeOnHit: Float = 0.0
    var primaryResource: Float = 0.0
    var secondaryResource: Float = 0.0
}
