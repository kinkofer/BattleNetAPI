//
//  D3Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class D3Profile: Codable {
    var battleTag = ""
    
    var paragonLevel = 0
    var paragonLevelHardcore = 0
    var paragonLevelSeason = 0
    var paragonLevelSeasonHardcore = 0
    
    var guildName = ""
    
    var heroes = [Hero]()
    var lastHeroPlayed = 0
    var lastUpdated: Double = 0
    var highestHardcoreLevel = 0
    
    var kills = Kills()
    
    var timePlayed = TimePlayed()
    var progression = D3ProgressionCompletion()
    
    var seasonalProfiles = [String: D3Season]()
    
    var blacksmith = ArtisanLevel()
    var jeweler = ArtisanLevel()
    var mystic = ArtisanLevel()
    
    var blacksmithSeason = ArtisanLevel()
    var jewelerSeason = ArtisanLevel()
    var mysticSeason = ArtisanLevel()
    
    var blacksmithHardcore = ArtisanLevel()
    var jewelerHardcore = ArtisanLevel()
    var mysticHardcore = ArtisanLevel()
}






class Kills: Codable {
    var elites: Int? = 0
    var monsters: Int? = 0
    var hardcoreMonsters: Int? = 0
}



class TimePlayed: Codable {
    var demonHunter = 0.0
    var barbarian = 0.0
    var witchDoctor = 0.0
    var necromancer = 0.0
    var wizard = 0.0
    var monk = 0.0
    var crusader = 0.0
    
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
    var act1 = false
    var act2 = false
    var act3 = false
    var act4 = false
    var act5 = false
}



class ArtisanLevel: Codable {
    var slug = ""
    var level = 0
}
