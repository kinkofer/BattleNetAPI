//
//  Challenge.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ChallengeIndex: Codable {
    let challenges: [Challenge]
    
    enum CodingKeys: String, CodingKey {
        case challenges = "challenge"
    }
}



/// - note: Contains camelCase and snake_case keys
class Challenge: Codable {
    let realm: RealmSummary?
    let map: ChallengeModeMap?
    let groups: [ChallengeModeGroup]
}



class ChallengeModeGroup: Codable {
    let ranking: Int
    let time: ChallengeCriteria
    let date: String
    let medal: String?
    let faction: ChallengeFactionType
    let isRecurring: Bool
    let members: [ChallengeModeMember]
}



enum ChallengeFactionType: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case none = "none"
}



class ChallengeModeMember: Codable {
    let character: WOWCharacter?
    let spec: CharacterSpecialization
}




class ChallengeCriteria: Codable {
    let time: Int
    let hours: Int
    let minutes: Int
    let seconds: Int
    let milliseconds: Int
    let isPositive: Bool
}



class ChallengeModeMap: Codable {
    let id: Int
    let name: String
    let slug: String
    let hasChallengeMode: Bool
    let bronzeCriteria: ChallengeCriteria
    let silverCriteria: ChallengeCriteria
    let goldCriteria: ChallengeCriteria
}
