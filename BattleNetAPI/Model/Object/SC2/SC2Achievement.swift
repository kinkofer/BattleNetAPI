//
//  SC2Achievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class SC2Achievement: Codable {
    public let id: String
    public let title: String
    public let description: String
    public let imageUrl: String
    
    public let uiOrderHint: Int
    public let isChained: Bool
    public let points: Int
    public let chainRewardSize: Int
    public let criteriaIDs: [String]?
    public let chainAchievementIDs: [String]
    public let flags: Int
    public let categoryID: String
    
    
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
