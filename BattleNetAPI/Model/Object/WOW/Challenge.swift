//
//  Challenge.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ChallengeIndex: Codable {
    var challenges: [Challenge] = [Challenge]()
    
    enum CodingKeys: String, CodingKey {
        case challenges = "challenge"
    }
}



class Challenge: Codable {
    var realm: RealmSummaryLegacy? = nil
    var map: ChallengeModeMap? = nil
    var groups: [ChallengeModeGroup] = [ChallengeModeGroup]()
}



class ChallengeModeGroup: Codable {
    var ranking: Int = 0
    var time: ChallengeCriteria = ChallengeCriteria()
    var date: String = ""
    var medal: String? = nil
    var faction: ChallengeFactionType = .none
    var isRecurring: Bool = false
    var members: [ChallengeModeMember] = [ChallengeModeMember]()
}



enum ChallengeFactionType: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case none = "none"
}



class ChallengeModeMember: Codable {
    var character: WOWCharacter? = nil
    var spec: SpecializationLegacy = SpecializationLegacy()
}




class ChallengeCriteria: Codable {
    var time: Int = 0
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var milliseconds: Int = 0
    var isPositive: Bool = false
}



class ChallengeModeMap: Codable {
    var id: Int = 0
    var name: String = ""
    var slug: String = ""
    var hasChallengeMode: Bool = false
    var bronzeCriteria: ChallengeCriteria = ChallengeCriteria()
    var silverCriteria: ChallengeCriteria = ChallengeCriteria()
    var goldCriteria: ChallengeCriteria = ChallengeCriteria()
}
