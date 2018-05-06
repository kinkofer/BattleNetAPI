//
//  SC2Character.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2CharacterIndex: Codable {
    var characters: [SC2Character] = [SC2Character]()
}



class SC2Character: Codable {
    var id: Int = 0
    var name: String? = nil
    var displayName: String = ""
    
    var profilePath: String = ""
    var portrait: Image = Image()
    var avatar: Image? = nil
    
    var career: Career = Career()
    var swarmLevels: SwarmLevel = SwarmLevel()
    var campaign: Campaign = Campaign()
    var season: SC2Season = SC2Season()
    var rewards: Reward = Reward()
    var achievements: SC2AchievementOverview = SC2AchievementOverview()
    
    var clanName: String = ""
    var clanTag: String = ""
    
    var realm: Int = 0
}


class SC2CharacterSummary: Codable {
    var id: Int = 0
    var displayName: String = ""
    var profilePath: String = ""
    var clanName: String = ""
    var clanTag: String = ""
    var realm: Int = 0
}


class Career: Codable {
    var primaryRace: String = ""
    
    var terranWins: Int = 0
    var protossWins: Int = 0
    var zergWins: Int = 0
    
    var seasonTotalGames: Int = 0
    var careerTotalGames: Int = 0
    
    var highest1v1Rank: String? = ""
    var highestTeamRank: String? = ""
}



class SwarmLevel: Codable {
    var level: Int = 0
    var terran: RaceLevel = RaceLevel()
    var zerg: RaceLevel = RaceLevel()
    var protoss: RaceLevel = RaceLevel()
}



class RaceLevel: Codable {
    var level: Int = 0
    var totalLevelXP: Int = 0
    var currentLevelXP: Int = 0
}



class Campaign: Codable {
    var hots: String? = nil
}



class SC2Season: Codable {
    var seasonId: Int = 0
    var seasonNumber: Int = 0
    var seasonYear: Int = 0
    var totalGamesThisSeason: Int = 0
    var stats: [SeasonStat]? = nil
}



class SeasonStat: Codable {
    var type: String = ""
    var wins: Int = 0
    var games: Int = 0
}



class Reward: Codable {
    var selected: [Int] = [Int]()
    var earned: [Int] = [Int]()
}



class SC2AchievementOverview: Codable {
    var achievements: [SC2AchievementSummary] = [SC2AchievementSummary]()
    var points: Points = Points()
}



class SC2AchievementSummary: Codable {
    var achievementId: Double = 0
    var completionDate: Double = 0
}



class Points: Codable {
    var totalPoints: Int = 0
    var categoryPoints: [String: Int] = [String: Int]()
}
