//
//  D3Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class D3Profile: Codable {
    public let battleTag: String
    
    public let paragonLevel: Int
    public let paragonLevelHardcore: Int
    public let paragonLevelSeason: Int
    public let paragonLevelSeasonHardcore: Int
    
    public let guildName: String
    
    public let heroes: [Hero]
    public let lastHeroPlayed: Int
    public let lastUpdated: Double
    public let highestHardcoreLevel: Int
    
    public let kills: Kills
    
    public let timePlayed: TimePlayed
    public let progression: D3ProgressionCompletion
    
    public let seasonalProfiles: [String: D3Season]
    
    public let blacksmith: ArtisanLevel
    public let jeweler: ArtisanLevel
    public let mystic: ArtisanLevel
    
    public let blacksmithSeason: ArtisanLevel
    public let jewelerSeason: ArtisanLevel
    public let mysticSeason: ArtisanLevel
    
    public let blacksmithHardcore: ArtisanLevel
    public let jewelerHardcore: ArtisanLevel
    public let mysticHardcore: ArtisanLevel
}






public class Kills: Codable {
    public let elites: Int?
    public let monsters: Int?
    public let hardcoreMonsters: Int?
}



public class TimePlayed: Codable {
    public let barbarian: Double
    public let crusader: Double
    public let demonHunter: Double
    public let monk: Double
    public let necromancer: Double
    public let witchDoctor: Double
    public let wizard: Double
    
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



public class D3ProgressionCompletion: Codable {
    public let act1: Bool
    public let act2: Bool
    public let act3: Bool
    public let act4: Bool
    public let act5: Bool
}



public class ArtisanLevel: Codable {
    public let slug: String
    public let level: Int
}
