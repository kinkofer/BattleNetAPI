//
//  WOWAchievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWAchievementIndex: Codable {
    var achievements: [WOWAchievementCategory] = [WOWAchievementCategory]()
}



class WOWAchievementCategory: Codable {
    var id: Int = 0
    var name: String = ""
    var achievements: [WOWAchievement]? = nil
    var categories: [WOWAchievementCategory]? = nil
}



class WOWAchievement: Codable {
    var id: Int = 0
    var title: String = ""
    var points: Int = 0
    var description: String = ""
    var reward: String? = nil
    var rewardItems: [WOWItemSummary] = [WOWItemSummary]()
    var icon: String = ""
    var criteria: [WOWAchievementCriterion] = [WOWAchievementCriterion]()
    var accountWide: Bool = false
    var factionID: Int = 0
    
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
    var id: Int = 0
    var description: String = ""
    var orderIndex: Int = 0
    var max: Int = 0
}



class WOWAchievementStatus: Codable {
    var achievementsCompleted: [Int] = [Int]()
    var achievementsCompletedTimestamp: [Int] = [Int]()
    var criteria: [Int] = [Int]()
    var criteriaQuantity: [Int] = [Int]()
    var criteriaTimestamp: [Int] = [Int]()
    var criteriaCreated: [Int] = [Int]()
}

