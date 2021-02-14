//
//  SC2Category.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class SC2Category: Codable {
    public let points: Int
    public let uiOrderHint: Int
    public let featuredAchievementID: String
    public let id: String
    public let parentCategoryID: String?
    public let childrenCategoryIDs: [String]
    public let name: String
    public let medalTiers: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case points
        case uiOrderHint
        case featuredAchievementID = "featuredAchievementId"
        case id
        case parentCategoryID = "parentCategoryId"
        case childrenCategoryIDs = "childrenCategoryIds"
        case name
        case medalTiers
    }
}
