//
//  WOWAchievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWAchievementCategoryIndex: Codable, SelfDecodable {
    public let _links: SelfLink<WOWAchievementCategoryIndex>?
    public let categories: [KeyLink<WOWAchievementCategory>]
    public let rootCategories: [KeyLink<WOWAchievementCategory>]
    public let guildCategories: [KeyLink<WOWAchievementCategory>]
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


/// Game Data API achievement index - returns flat list of achievements
public struct WOWAchievementIndex: Codable {
    public let _links: SelfLink<WOWAchievementIndex>?
    public let achievements: [KeyLink<WOWAchievement>]
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


public struct WOWAchievementCatgoryIndex: Codable {
    public let _links: SelfLink<WOWAchievementCatgoryIndex>?
    public let achievements: [KeyLink<WOWAchievementCategory>]
}


public struct WOWAchievementCategory: Codable, SelfDecodable {
    public let _links: SelfLink<WOWAchievementCategory>?
    public let id: Int
    public let name: String
    public let achievements: [KeyLink<WOWAchievement>]?
    public let subcategories: [KeyLink<WOWAchievementCategory>]?
    public let isGuildCategory: Bool?
    public let aggregatesByFaction: AggregatesByFaction?
    public let displayOrder: Int?
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct AggregatesByFaction: Codable {
    public let alliance: FactionAggregate
    public let horde: FactionAggregate
}


public struct FactionAggregate: Codable {
    public let quantity: Int
    public let points: Int
}


public struct WOWAchievementStatus: Codable {
    public let achievementsCompleted: [Int]
    public let achievementsCompletedTimestamp: [Int]
    public let criteria: [Int]
    public let criteriaQuantity: [Int]
    public let criteriaTimestamp: [Int]
    public let criteriaCreated: [Int]
}
