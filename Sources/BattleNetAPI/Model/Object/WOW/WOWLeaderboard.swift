//
//  WOWLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWLeaderboard: Codable, SelfDecodable {
    public let _links: SelfLink<WOWLeaderboard>?
    public let season: KeyLink<MythicKeystoneSeason>?
    public let name: String
    public let bracket: WOWLeaderboardBracketInfo
    public let entries: [WOWLeaderboardEntry]

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct WOWLeaderboardBracketInfo: Codable {
    public let id: Int
    public let type: String
}


public enum WOWLeaderboardBracket: String {
    case _2v2 = "2v2"
    case _3v3 = "3v3"
    case _5v5 = "5v5"
    case rbg
}


public struct WOWLeaderboardEntry: Codable, SelfDecodable {
    public let character: WOWLeaderboardCharacter
    public let faction: Faction
    public let rank: Int
    public let rating: Int
    public let seasonMatchStatistics: MatchStatistics
    public let tier: KeyLink<PowerType>?

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct WOWLeaderboardCharacter: Codable {
    public let name: String
    public let id: Int
    public let realm: WOWLeaderboardRealm
}


public struct WOWLeaderboardRealm: Codable {
    public let key: Link<Realm>
    public let id: Int
    public let slug: String
}


public struct MatchStatistics: Codable {
    public let played: Int
    public let won: Int
    public let lost: Int
}



public struct WOWPVP: Codable {
    public let brackets: WOWBrackets
}



public struct WOWBrackets: Codable {
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



public struct WOWArenaBracket: Codable {
    public let slug: String
    public let rating: Int
    
    public let weeklyWon: Int
    public let weeklyLost: Int
    public let weeklyPlayed: Int
    
    public let seasonWon: Int
    public let seasonLost: Int
    public let seasonPlayed: Int
}
