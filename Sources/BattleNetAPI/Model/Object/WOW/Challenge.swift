//
//  Challenge.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct ChallengeIndex: Codable {
    public let challenges: [Challenge]
    
    enum CodingKeys: String, CodingKey {
        case challenges = "challenge"
    }
}



/// - note: Contains camelCase and snake_case keys
public struct Challenge: Codable {
    public let realm: RealmSummary?
    public let map: ChallengeModeMap?
    public let groups: [ChallengeModeGroup]
}



public struct ChallengeModeGroup: Codable {
    public let ranking: Int
    public let time: ChallengeCriteria
    public let date: String
    public let medal: String?
    public let faction: ChallengeFactionType
    public let isRecurring: Bool
    public let members: [ChallengeModeMember]
}



public enum ChallengeFactionType: String, Codable {
    case alliance = "alliance"
    case horde = "horde"
    case none = "none"
}



public struct ChallengeModeMember: Codable {
    public let character: WOWCharacter?
    public let spec: CharacterSpecialization
}




public struct ChallengeCriteria: Codable {
    public let time: Int
    public let hours: Int
    public let minutes: Int
    public let seconds: Int
    public let milliseconds: Int
    public let isPositive: Bool
}



public struct ChallengeModeMap: Codable {
    public let id: Int
    public let name: String
    public let slug: String
    public let hasChallengeMode: Bool
    public let bronzeCriteria: ChallengeCriteria
    public let silverCriteria: ChallengeCriteria
    public let goldCriteria: ChallengeCriteria
}
