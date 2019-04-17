//
//  D3Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Profile: Codable {
    let battleTag: String
    
    let paragonLevel: Int
    let paragonLevelHardcore: Int
    let paragonLevelSeason: Int
    let paragonLevelSeasonHardcore: Int
    
    let guildName: String
    
    let heroes: [Hero]
    let lastHeroPlayed: Int
    let lastUpdated: Double
    let highestHardcoreLevel: Int
    
    let kills: Kills
    
    let timePlayed: TimePlayed
    let progression: D3ProgressionCompletion
    
    let seasonalProfiles: [String: D3Season]
    
    let blacksmith: ArtisanLevel
    let jeweler: ArtisanLevel
    let mystic: ArtisanLevel
    
    let blacksmithSeason: ArtisanLevel
    let jewelerSeason: ArtisanLevel
    let mysticSeason: ArtisanLevel
    
    let blacksmithHardcore: ArtisanLevel
    let jewelerHardcore: ArtisanLevel
    let mysticHardcore: ArtisanLevel
}






class Kills: Codable {
    let elites: Int?
    let monsters: Int?
    let hardcoreMonsters: Int?
}



class TimePlayed: Codable {
    let demonHunter: Double
    let barbarian: Double
    let witchDoctor: Double
    let necromancer: Double
    let wizard: Double
    let monk: Double
    let crusader: Double
    
    enum CodingKeys: String, CodingKey {
        case demonHunter = "demon-hunter"
        case barbarian
        case witchDoctor = "witch-doctor"
        case necromancer
        case wizard
        case monk
        case crusader
    }
}



class D3ProgressionCompletion: Codable {
    let act1: Bool
    let act2: Bool
    let act3: Bool
    let act4: Bool
    let act5: Bool
}



class ArtisanLevel: Codable {
    let slug: String
    let level: Int
}
