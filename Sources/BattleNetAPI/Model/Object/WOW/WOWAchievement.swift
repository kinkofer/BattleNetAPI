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



public struct WOWAchievement: Codable, SelfDecodable {
    public let id: Int
    public let category: KeyLink<WOWAchievementCategory>
    public let name: String
    public let description: String
    public let points: Int
    public let isAccountWide: Bool
    public let criteria: WOWAchievementCriterion
    public let nextCriteria: KeyLink<WOWAchievement>?
    public let media: MediaLink
    public let displayOrder: Int
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct WOWAchievementCriterion: Codable {
    public let id: Int
    public let description: String
    public let amount: Int
}



public struct WOWAchievementStatus: Codable {
    public let achievementsCompleted: [Int]
    public let achievementsCompletedTimestamp: [Int]
    public let criteria: [Int]
    public let criteriaQuantity: [Int]
    public let criteriaTimestamp: [Int]
    public let criteriaCreated: [Int]
}

