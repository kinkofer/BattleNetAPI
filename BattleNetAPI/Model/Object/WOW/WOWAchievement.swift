//
//  WOWAchievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWAchievementIndex: Codable {
    let achievements: [WOWAchievementCategory]
}



class WOWAchievementCategory: Codable {
    let id: Int
    let name: String
    let achievements: [WOWAchievement]?
    let categories: [WOWAchievementCategory]?
}



class WOWAchievement: Codable {
    let id: Int
    let title: String
    let points: Int
    let description: String
    let reward: String?
    let rewardItems: [WOWItemSummary]
    let icon: String
    let criteria: [WOWAchievementCriterion]
    let accountWide: Bool
    let factionID: Int
    
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



class WOWAchievementCriterion: Codable {
    let id: Int
    let description: String
    let orderIndex: Int
    let max: Int
}



class WOWAchievementStatus: Codable {
    let achievementsCompleted: [Int]
    let achievementsCompletedTimestamp: [Int]
    let criteria: [Int]
    let criteriaQuantity: [Int]
    let criteriaTimestamp: [Int]
    let criteriaCreated: [Int]
}

