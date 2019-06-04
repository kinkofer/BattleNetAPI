//
//  MythicLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/?namespace=dynamic-us
class MythicLeaderboardIndex: Codable, SelfDecodable {
    let _links: SelfLink<MythicLeaderboardIndex>
    let currentLeaderboards: [KeyLink<MythicLeaderboard>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/197/period/642?namespace=dynamic-us
/// - note: Contains camelCase and snake_case keys (with id)
class MythicLeaderboard: Codable {
    let _links: SelfLink<MythicLeaderboard>
    let name: String
    
    let map: Map
    let mapChallengeModeID: Int
    
    let period: Int
    let periodStartTimestamp: Int
    let periodEndTimestamp: Int
    
    let connectedRealm: Link<ConnectedRealm>
    let leadingGroups: [LeadingGroup]
    let keystoneAffixes: [KeystoneAffixSummary]
    
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



class LeadingGroup: Codable {
    let ranking: Int
    let duration: Int
    let completedTimestamp: Int
    let keystoneLevel: Int
    
    let members: [PartyMember]
    
    enum CodingKeys: String, CodingKey {
        case ranking
        case duration
        case completedTimestamp = "completed_timestamp"
        case keystoneLevel = "keystone_level"
        case members
    }
}



class PartyMember: Codable {
    let profile: WOWProfile
    let faction: Faction
    let specialization: KeyLink<Specialization>
}



class WOWProfile: Codable {
    let id: Int
    let name: String
    let realm: KeyLink<Realm>
}



class Faction: Codable {
    let type: FactionType
}

enum FactionType: String, Codable {
    case alliance = "ALLIANCE"
    case horde = "HORDE"
}


class WOWFaction: Codable {
    let id: Int
    let type: String
    let name: String
}


class MythicRaidLeaderboard: Codable, SelfDecodable {
    let _links: SelfLink<MythicRaidLeaderboard>
    let slug: String
    let criteriaType: String
    let zone: ZoneInfo
    let entries: [Entry]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class Entry: Codable {
    let guild: Guild
    let faction: Faction
    let timestamp: Int
    let region: APIRegion
    let rank: Int
}


class Guild: Codable {
    let name: String
    let id: Int
    let realm: RealmIndex
}



