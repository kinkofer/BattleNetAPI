//
//  SC2Category.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Category: Codable {
    var points: Int = 0
    var uiOrderHint: Int = 0
    var featuredAchievementID: String = ""
    var id: String = ""
    var parentCategoryID: String? = nil
    var childrenCategoryIDs: [String] = [String]()
    var name: String = ""
    var medalTiers: [Int]? = nil
    
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
