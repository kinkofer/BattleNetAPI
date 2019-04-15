//
//  SC2Criteria.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Criteria: Codable {
    let id: String
    let achievementID: String
    let uiOrderHint: Int
    let evaluationClass: String
    let necessaryQuantity: Int
    let description: String
    let flags: Int
    
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
