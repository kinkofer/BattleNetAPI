//
//  WOWLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWLeaderboard: Codable {
    let rows: [WOWLeaderboardEntry]
}


enum WOWLeaderboardBracket: String {
    case _2v2 = "2v2"
    case _3v3 = "3v3"
    case _5v5 = "5v5"
    case rbg
}



class WOWLeaderboardEntry: Codable {
    let ranking: Int
    let rating: Int
    let name: String
    let realmID: Int
    let realmName: String
    let realmSlug: String
    let raceID: Int
    let classID: Int
    let specID: Int
    let factionID: Int
    let genderID: Int
    let seasonWins: Int
    let seasonLosses: Int
    let weeklyWins: Int
    let weeklyLosses: Int
    
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



class WOWPVP: Codable {
    let brackets: WOWBrackets
}



class WOWBrackets: Codable {
    let arenaBracket2V2: WOWArenaBracket
    let arenaBracket2V2Skirmish: WOWArenaBracket
    let arenaBracket3V3: WOWArenaBracket
    let arenaBracketRbg: WOWArenaBracket
    let unknown: WOWArenaBracket
    
    enum CodingKeys: String, CodingKey {
        case arenaBracket3V3 = "ARENA_BRACKET_3v3"
        case arenaBracketRbg = "ARENA_BRACKET_RBG"
        case arenaBracket2V2Skirmish = "ARENA_BRACKET_2v2_SKIRMISH"
        case arenaBracket2V2 = "ARENA_BRACKET_2v2"
        case unknown = "UNKNOWN"
    }
}



class WOWArenaBracket: Codable {
    let slug: String
    let rating: Int
    
    let weeklyWon: Int
    let weeklyLost: Int
    let weeklyPlayed: Int
    
    let seasonWon: Int
    let seasonLost: Int
    let seasonPlayed: Int
}
