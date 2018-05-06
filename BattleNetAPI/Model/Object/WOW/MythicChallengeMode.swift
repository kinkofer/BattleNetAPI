//
//  MythicChallengeMode.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/mythic-challenge-mode/?namespace=dynamic-us
class MythicChallengeMode: Codable {
    var _links: SelfLink<MythicChallengeMode> = SelfLink<MythicChallengeMode>()
    var currentPeriod: Int = 0
    var currentPeriodStartTimestamp: Int = 0
    var currentPeriodEndTimestamp: Int = 0
    var currentKeystoneAffixes: [KeystoneAffixSummary] = [KeystoneAffixSummary]()
    
    enum CodingKeys: String, CodingKey {
        case _links
        case currentPeriod = "current_period"
        case currentPeriodStartTimestamp = "current_period_start_timestamp"
        case currentPeriodEndTimestamp = "current_period_end_timestamp"
        case currentKeystoneAffixes = "current_keystone_affixes"
    }
}
