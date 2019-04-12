//
//  SC2Criteria.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Criteria: Codable {
    var id: String = ""
    var achievementID: String = ""
    var uiOrderHint: Int = 0
    var evaluationClass: String
    var necessaryQuantity: Int = 0
    var description: String = ""
    var flags: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case achievementID = "achievementId"
        case uiOrderHint
        case evaluationClass
        case necessaryQuantity
        case description
        case flags
    }
}
