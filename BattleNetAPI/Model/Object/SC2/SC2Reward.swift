//
//  SC2Reward.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2Reward: Codable {
    let id: String
    let achievementID: String?
    let name: String

    let imageUrl: String
    let isSkin: Bool
    let uiOrderHint: Int
    let unlockableType: String
    let flags: Int
    let command: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case achievementID = "achievementId"
        case name
        case imageUrl
        case isSkin
        case uiOrderHint
        case unlockableType
        case flags
        case command
    }
}
