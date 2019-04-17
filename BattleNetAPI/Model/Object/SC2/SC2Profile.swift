//
//  SC2Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2ProfileData: Codable {
    let rewards: [SC2Reward]
    let achievements: [SC2Achievement]
    let criteria: [SC2Criteria]
    let categories: [SC2Category]
}


class SC2ProfileMetadata: Codable {
    let profileID: String
    let profileUrl: String
    let name: String
    let realmID: Int
    let regionID: Int
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case profileUrl = "profileUrl"
        case name
        case realmID = "realmId"
        case regionID = "regionId"
        case avatarUrl
    }
}


class SC2Profile: Codable {
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


class SC2ProfileSummary: Codable {
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


class SC2ProfileSnapshot: Codable {
    let seasonSnapshot: [String: SeasonSnapshot]
    let totalRankedSeasonGamesPlayed: Int
}


class SeasonSnapshot: Codable {
    let rank: Int
    let leagueName: String?
    let totalGames: Int
    let totalWins: Int
}


class SC2ProfileCareer: Codable {
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


class BestFinish: Codable {
    let leagueName: String?
    let timesAchieved: Int
}


class SC2ProfileCampaign: Codable {
    let difficultyCompleted: DifficultyCompleted
}


class DifficultyCompleted: Codable {
}


class SC2ProfileSwarmLevel: Codable {
    let level: Int
    let terran: RaceLevelPoints
    let zerg: RaceLevelPoints
    let protoss: RaceLevelPoints
}


class RaceLevelPoints: Codable {
    let level: Int
    let maxLevelPoints: Int
    let currentLevelPoints: Int
}


class CategoryPointProgress: Codable {
    let categoryID: String
    let pointsEarned: Int
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case pointsEarned
    }
}


class EarnedAchievement: Codable {
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


class SC2AchievementCriterion: Codable {
    let criterionID: String
    let earned: SC2AchievementEarned?
    
    enum CodingKeys: String, CodingKey {
        case criterionID = "criterionId"
        case earned
    }
}


class SC2AchievementEarned: Codable {
    let quantity: Int
    let startTime: Int
}


class EarnedReward: Codable {
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










