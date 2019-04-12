//
//  SC2Achievement.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Achievement: Codable {
    var id: String = ""
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    
    var uiOrderHint: Int = 0
    var isChained: Bool = false
    var points: Int = 0
    var chainRewardSize: Int = 0
    var criteriaIDs: [String]? = nil
    var chainAchievementIDs: [String] = [String]()
    var flags: Int = 0
    var categoryID: String = ""
    
    
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
