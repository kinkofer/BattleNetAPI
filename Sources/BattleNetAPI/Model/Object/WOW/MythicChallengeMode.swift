//
//  MythicChallengeMode.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/18/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/mythic-challenge-mode/?namespace=dynamic-us
/// - note: KeystoneAffixSummary is a property of another class that contains camelCase and snake_case keys
public class MythicChallengeMode: Codable {
    public let _links: SelfLink<MythicChallengeMode>
    public let currentPeriod: Int
    public let currentPeriodStartTimestamp: Int
    public let currentPeriodEndTimestamp: Int
    public let currentKeystoneAffixes: [KeystoneAffixSummary]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case currentPeriod = "current_period"
        case currentPeriodStartTimestamp = "current_period_start_timestamp"
        case currentPeriodEndTimestamp = "current_period_end_timestamp"
        case currentKeystoneAffixes = "current_keystone_affixes"
    }
}
