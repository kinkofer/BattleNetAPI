//
//  WOWAchievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWAchievementIndex: Codable {
    public let achievements: [WOWAchievementCategory]
}



public struct WOWAchievementCategory: Codable {
    public let id: Int
    public let name: String
    public let achievements: [WOWAchievement]?
    public let categories: [WOWAchievementCategory]?
}



public struct WOWAchievement: Codable {
    public let id: Int
    public let title: String
    public let points: Int
    public let description: String
    public let reward: String?
    public let rewardItems: [WOWItemSummary]
    public let icon: String
    public let criteria: [WOWAchievementCriterion]
    public let accountWide: Bool
    public let factionID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case points
        case description
        case reward
        case rewardItems
        case icon
        case criteria
        case accountWide
        case factionID = "factionId"
    }
}



public struct WOWAchievementCriterion: Codable {
    public let id: Int
    public let description: String
    public let orderIndex: Int
    public let max: Int
}



public struct WOWAchievementStatus: Codable {
    public let achievementsCompleted: [Int]
    public let achievementsCompletedTimestamp: [Int]
    public let criteria: [Int]
    public let criteriaQuantity: [Int]
    public let criteriaTimestamp: [Int]
    public let criteriaCreated: [Int]
}

