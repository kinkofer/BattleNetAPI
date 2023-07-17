//
//  SC2Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct SC2ProfileData: Codable {
    public let rewards: [SC2Reward]
    public let achievements: [SC2Achievement]
    public let criteria: [SC2Criteria]
    public let categories: [SC2Category]
}


public struct SC2ProfileMetadata: Codable {
    public let profileID: String
    public let profileUrl: String
    public let name: String
    public let realmID: Int
    public let regionID: Int
    public let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case profileUrl = "profileUrl"
        case name
        case realmID = "realmId"
        case regionID = "regionId"
        case avatarUrl
    }
}


public struct SC2Profile: Codable {
    public let summary: SC2ProfileSummary
    public let snapshot: SC2ProfileSnapshot
    public let career: SC2ProfileCareer
    public let swarmLevels: SC2ProfileSwarmLevel
    public let campaign: SC2ProfileCampaign
    public let categoryPointProgress: [CategoryPointProgress]
    public let achievementShowcase: [String]
    public let earnedRewards: [EarnedReward]
    public let earnedAchievements: [EarnedAchievement]
}


public struct SC2ProfileSummary: Codable {
    public let id: String
    public let realm: Int
    public let displayName: String
    public let portrait: String
    public let decalTerran: String
    public let decalProtoss: String
    public let decalZerg: String
    public let totalSwarmLevel: Int
    public let totalAchievementPoints: Int
}


public struct SC2ProfileSnapshot: Codable {
    public let seasonSnapshot: [String: SeasonSnapshot]
    public let totalRankedSeasonGamesPlayed: Int
}


public struct SeasonSnapshot: Codable {
    public let rank: Int
    public let leagueName: String?
    public let totalGames: Int
    public let totalWins: Int
}


public struct SC2ProfileCareer: Codable {
    public let terranWins: Int
    public let zergWins: Int
    public let protossWins: Int
    public let totalCareerGames: Int
    public let totalGamesThisSeason: Int
    public let current1v1LeagueName: String?
    public let currentBestTeamLeagueName: String?
    public let best1v1Finish: BestFinish
    public let bestTeamFinish: BestFinish
}


public struct BestFinish: Codable {
    public let leagueName: String?
    public let timesAchieved: Int
}


public struct SC2ProfileCampaign: Codable {
    public let difficultyCompleted: DifficultyCompleted
}


public struct DifficultyCompleted: Codable {
}


public struct SC2ProfileSwarmLevel: Codable {
    public let level: Int
    public let terran: RaceLevelPoints
    public let zerg: RaceLevelPoints
    public let protoss: RaceLevelPoints
}


public struct RaceLevelPoints: Codable {
    public let level: Int
    public let maxLevelPoints: Int
    public let currentLevelPoints: Int
}


public struct CategoryPointProgress: Codable {
    public let categoryID: String
    public let pointsEarned: Int
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case pointsEarned
    }
}


public struct EarnedAchievement: Codable {
    public let achievementID: String
    public let completionDate: Double
    public let numCompletedAchievementsInSeries: Int
    public let totalAchievementsInSeries: Int
    public let isComplete: Bool
    public let inProgress: Bool
    public let criteria: [SC2AchievementCriterion]
    public let nextProgressEarnedQuantity: Int?
    public let nextProgressRequiredQuantity: Int?
    
    enum CodingKeys: String, CodingKey {
        case achievementID = "achievementId"
        case completionDate, numCompletedAchievementsInSeries, totalAchievementsInSeries, isComplete, inProgress, criteria, nextProgressEarnedQuantity, nextProgressRequiredQuantity
    }
}


public struct SC2AchievementCriterion: Codable {
    public let criterionID: String
    public let earned: SC2AchievementEarned?
    
    enum CodingKeys: String, CodingKey {
        case criterionID = "criterionId"
        case earned
    }
}


public struct SC2AchievementEarned: Codable {
    public let quantity: Int
    public let startTime: Int
}


public struct EarnedReward: Codable {
    public let rewardID: String
    public let selected: Bool
    public let achievementID: String?
    public let category: String?
    
    enum CodingKeys: String, CodingKey {
        case rewardID = "rewardId"
        case selected
        case achievementID = "achievementId"
        case category
    }
}










