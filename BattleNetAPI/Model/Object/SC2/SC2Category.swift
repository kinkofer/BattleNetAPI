//
//  SC2Category.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Category: Codable {
    let points: Int
    let uiOrderHint: Int
    let featuredAchievementID: String
    let id: String
    let parentCategoryID: String?
    let childrenCategoryIDs: [String]
    let name: String
    let medalTiers: [Int]?
    
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
