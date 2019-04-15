//
//  SC2Achievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Achievement: Codable {
    let id: String
    let title: String
    let description: String
    let imageUrl: String
    
    let uiOrderHint: Int
    let isChained: Bool
    let points: Int
    let chainRewardSize: Int
    let criteriaIDs: [String]?
    let chainAchievementIDs: [String]
    let flags: Int
    let categoryID: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case imageUrl
        
        case uiOrderHint
        case isChained
        case points
        case chainRewardSize
        case criteriaIDs = "criteriaIds"
        case chainAchievementIDs = "chainAchievementIds"
        case flags
        case categoryID = "categoryId"
    }
}
