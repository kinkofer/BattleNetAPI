//
//  SC2Reward.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SC2RewardIndex: Codable {
    var portraits = [SC2Reward]()
}


class SC2Reward: Codable {
    var id: Double = 0
    var title = ""
    var achievementId: Double = 0
    var icon = Image()
    
    var command: String? = nil
}
