//
//  WOWLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WOWLeaderboard: Codable {
    var rows: [WOWLeaderboardEntry] = [WOWLeaderboardEntry]()
}


enum WOWLeaderboardBracket: String {
    case _2v2 = "2v2"
    case _3v3 = "3v3"
    case _5v5 = "5v5"
    case rbg
}



class WOWLeaderboardEntry: Codable {
    var ranking: Int = 0
    var rating: Int = 0
    var name: String = ""
    var realmID: Int = 0
    var realmName: String = ""
    var realmSlug: String = ""
    var raceID: Int = 0
    var classID: Int = 0
    var specID: Int = 0
    var factionID: Int = 0
    var genderID: Int = 0
    var seasonWins: Int = 0
    var seasonLosses: Int = 0
    var weeklyWins: Int = 0
    var weeklyLosses: Int = 0
    
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
    var brackets: WOWBrackets = WOWBrackets()
}



class WOWBrackets: Codable {
    var arenaBracket2V2: WOWArenaBracket = WOWArenaBracket()
    var arenaBracket2V2Skirmish: WOWArenaBracket = WOWArenaBracket()
    var arenaBracket3V3: WOWArenaBracket = WOWArenaBracket()
    var arenaBracketRbg: WOWArenaBracket = WOWArenaBracket()
    var unknown: WOWArenaBracket = WOWArenaBracket()
    
    enum CodingKeys: String, CodingKey {
        case arenaBracket3V3 = "ARENA_BRACKET_3v3"
        case arenaBracketRbg = "ARENA_BRACKET_RBG"
        case arenaBracket2V2Skirmish = "ARENA_BRACKET_2v2_SKIRMISH"
        case arenaBracket2V2 = "ARENA_BRACKET_2v2"
        case unknown = "UNKNOWN"
    }
}



class WOWArenaBracket: Codable {
    var slug: String = ""
    var rating: Int = 0
    
    var weeklyWon: Int = 0
    var weeklyLost: Int = 0
    var weeklyPlayed: Int = 0
    
    var seasonWon: Int = 0
    var seasonLost: Int = 0
    var seasonPlayed: Int = 0
}
