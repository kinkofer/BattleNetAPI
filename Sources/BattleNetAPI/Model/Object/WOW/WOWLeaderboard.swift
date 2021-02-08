//
//  WOWLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class WOWLeaderboard: Codable {
    public let rows: [WOWLeaderboardEntry]
}


public enum WOWLeaderboardBracket: String {
    case _2v2 = "2v2"
    case _3v3 = "3v3"
    case _5v5 = "5v5"
    case rbg
}



public class WOWLeaderboardEntry: Codable {
    public let ranking: Int
    public let rating: Int
    public let name: String
    public let realmID: Int
    public let realmName: String
    public let realmSlug: String
    public let raceID: Int
    public let classID: Int
    public let specID: Int
    public let factionID: Int
    public let genderID: Int
    public let seasonWins: Int
    public let seasonLosses: Int
    public let weeklyWins: Int
    public let weeklyLosses: Int
    
    enum CodingKeys: String, CodingKey {
        case ranking
        case rating
        case name
        case realmID = "realmId"
        case realmName
        case realmSlug
        case raceID = "raceId"
        case classID = "classId"
        case specID = "specId"
        case factionID = "factionId"
        case genderID = "genderId"
        case seasonWins
        case seasonLosses
        case weeklyWins
        case weeklyLosses
    }
}



public class WOWPVP: Codable {
    public let brackets: WOWBrackets
}



public class WOWBrackets: Codable {
    public let arenaBracket2V2: WOWArenaBracket
    public let arenaBracket2V2Skirmish: WOWArenaBracket
    public let arenaBracket3V3: WOWArenaBracket
    public let arenaBracketRbg: WOWArenaBracket
    public let unknown: WOWArenaBracket
    
    enum CodingKeys: String, CodingKey {
        case arenaBracket3V3 = "ARENA_BRACKET_3v3"
        case arenaBracketRbg = "ARENA_BRACKET_RBG"
        case arenaBracket2V2Skirmish = "ARENA_BRACKET_2v2_SKIRMISH"
        case arenaBracket2V2 = "ARENA_BRACKET_2v2"
        case unknown = "UNKNOWN"
    }
}



public class WOWArenaBracket: Codable {
    public let slug: String
    public let rating: Int
    
    public let weeklyWon: Int
    public let weeklyLost: Int
    public let weeklyPlayed: Int
    
    public let seasonWon: Int
    public let seasonLost: Int
    public let seasonPlayed: Int
}
