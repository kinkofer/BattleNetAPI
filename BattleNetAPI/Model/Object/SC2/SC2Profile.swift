//
//  SC2Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2ProfileData: Codable {
    var rewards: [SC2Reward] = [SC2Reward]()
    var achievements: [SC2Achievement] = [SC2Achievement]()
    var criteria: [SC2Criteria] = [SC2Criteria]()
    var categories: [SC2Category] = [SC2Category]()
}


class SC2ProfileMetadata: Codable {
    var profileID = ""
    var profileUrl = ""
    var name = ""
    var realmID = 0
    var regionID = 0
    var avatarUrl = ""
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case profileUrl = "profileUrl"
        case name
        case realmID = "realmId"
        case regionID = "regionId"
        case avatarUrl
    }
}


struct SC2Profile: Codable {
    let summary: SC2ProfileSummary
    let snapshot: SC2ProfileSnapshot
    let career: SC2ProfileCareer
    let swarmLevels: SC2ProfileSwarmLevel
    let campaign: SC2ProfileCampaign
    let categoryPointProgress: [CategoryPointProgress]
    let achievementShowcase: [String]
    let earnedRewards: [EarnedReward]
    let earnedAchievements: [EarnedAchievement]
}


struct SC2ProfileSummary: Codable {
    let id: String
    let realm: Int
    let displayName: String
    let portrait: String
    let decalTerran: String
    let decalProtoss: String
    let decalZerg: String
    let totalSwarmLevel: Int
    let totalAchievementPoints: Int
}


struct SC2ProfileSnapshot: Codable {
    let seasonSnapshot: [String: SeasonSnapshot]
    let totalRankedSeasonGamesPlayed: Int
}


struct SeasonSnapshot: Codable {
    let rank: Int
    let leagueName: String?
    let totalGames: Int
    let totalWins: Int
}


struct SC2ProfileCareer: Codable {
    let terranWins: Int
    let zergWins: Int
    let protossWins: Int
    let totalCareerGames: Int
    let totalGamesThisSeason: Int
    let current1v1LeagueName: String?
    let currentBestTeamLeagueName: String?
    let best1v1Finish: BestFinish
    let bestTeamFinish: BestFinish
}


struct BestFinish: Codable {
    let leagueName: String?
    let timesAchieved: Int
}


struct SC2ProfileCampaign: Codable {
    let difficultyCompleted: DifficultyCompleted
}


struct DifficultyCompleted: Codable {
}


struct SC2ProfileSwarmLevel: Codable {
    let level: Int
    let terran: RaceLevelPoints
    let zerg: RaceLevelPoints
    let protoss: RaceLevelPoints
}


struct RaceLevelPoints: Codable {
    let level: Int
    let maxLevelPoints: Int
    let currentLevelPoints: Int
}


struct CategoryPointProgress: Codable {
    let categoryID: String
    let pointsEarned: Int
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case pointsEarned
    }
}


struct EarnedAchievement: Codable {
    let achievementID: String
    let completionDate: Double
    let numCompletedAchievementsInSeries: Int
    let totalAchievementsInSeries: Int
    let isComplete: Bool
    let inProgress: Bool
    let criteria: [SC2AchievementCriterion]
    let nextProgressEarnedQuantity: Int?
    let nextProgressRequiredQuantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case achievementID = "achievementId"
        case completionDate, numCompletedAchievementsInSeries, totalAchievementsInSeries, isComplete, inProgress, criteria, nextProgressEarnedQuantity, nextProgressRequiredQuantity
    }
}


struct SC2AchievementCriterion: Codable {
    let criterionID: String
    let earned: SC2AchievementEarned?
    
    enum CodingKeys: String, CodingKey {
        case criterionID = "criterionId"
        case earned
    }
}


struct SC2AchievementEarned: Codable {
    let quantity: Int
    let startTime: Int
}


struct EarnedReward: Codable {
    let rewardID: String
    let selected: Bool
    let achievementID: String?
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case rewardID = "rewardId"
        case selected
        case achievementID = "achievementId"
        case category
    }
}










