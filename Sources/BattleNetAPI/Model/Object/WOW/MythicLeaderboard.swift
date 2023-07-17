//
//  MythicLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/?namespace=dynamic-us
public struct MythicLeaderboardIndex: Codable, SelfDecodable {
    public let _links: SelfLink<MythicLeaderboardIndex>
    public let currentLeaderboards: [KeyLink<MythicLeaderboard>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/197/period/642?namespace=dynamic-us
/// - note: Contains camelCase and snake_case keys (with id)
public struct MythicLeaderboard: Codable {
    public let _links: SelfLink<MythicLeaderboard>
    public let name: String
    
    public let map: Map
    public let mapChallengeModeID: Int
    
    public let period: Int
    public let periodStartTimestamp: Int
    public let periodEndTimestamp: Int
    
    public let connectedRealm: Link<ConnectedRealm>
    public let leadingGroups: [LeadingGroup]
    public let keystoneAffixes: [KeystoneAffixSummary]
    
    enum CodingKeys: String, CodingKey {
        case _links
        case map
        case period
        case periodStartTimestamp = "period_start_timestamp"
        case periodEndTimestamp = "period_end_timestamp"
        case connectedRealm = "connected_realm"
        case leadingGroups = "leading_groups"
        case keystoneAffixes = "keystone_affixes"
        case mapChallengeModeID = "map_challenge_mode_id"
        case name
    }
}



public struct LeadingGroup: Codable {
    public let ranking: Int
    public let duration: Int
    public let completedTimestamp: Int
    public let keystoneLevel: Int
    
    public let members: [PartyMember]
    
    enum CodingKeys: String, CodingKey {
        case ranking
        case duration
        case completedTimestamp = "completed_timestamp"
        case keystoneLevel = "keystone_level"
        case members
    }
}



public struct PartyMember: Codable {
    public let profile: WOWProfile
    public let faction: Faction
    public let specialization: KeyLink<Specialization>
}



public struct WOWProfile: Codable {
    public let id: Int
    public let name: String
    public let realm: KeyLink<Realm>
}



public struct Faction: Codable {
    public let type: FactionType
}

public enum FactionType: String, Codable {
    case alliance = "ALLIANCE"
    case horde = "HORDE"
}


public struct WOWFaction: Codable {
    public let id: Int
    public let type: String
    public let name: String
}


public struct MythicRaidLeaderboard: Codable, SelfDecodable {
    public let _links: SelfLink<MythicRaidLeaderboard>
    public let slug: String
    public let criteriaType: String
    public let zone: ZoneInfo
    public let entries: [Entry]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Entry: Codable {
    public let guild: Guild
    public let faction: Faction
    public let timestamp: Int
    public let region: APIRegion
    public let rank: Int
}


public struct Guild: Codable {
    public let name: String
    public let id: Int
    public let realm: RealmIndex
}



