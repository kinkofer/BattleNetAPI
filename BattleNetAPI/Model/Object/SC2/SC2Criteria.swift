//
//  SC2Criteria.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class SC2Criteria: Codable {
    public let id: String
    public let achievementID: String
    public let uiOrderHint: Int
    public let evaluationClass: String
    public let necessaryQuantity: Int
    public let description: String
    public let flags: Int
    
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
