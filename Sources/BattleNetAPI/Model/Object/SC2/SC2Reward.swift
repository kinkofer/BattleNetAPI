//
//  SC2Reward.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 11/17/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class SC2Reward: Codable {
    public let id: String
    public let achievementID: String?
    public let name: String

    public let imageUrl: String
    public let isSkin: Bool
    public let uiOrderHint: Int
    public let unlockableType: String
    public let flags: Int
    public let command: String?
    
    
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
