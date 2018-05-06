//
//  MythicLeaderboard.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/?namespace=dynamic-us
class MythicLeaderboardIndex: Codable {
    var _links: SelfLink<MythicLeaderboardIndex> = SelfLink<MythicLeaderboardIndex>()
    var currentLeaderboards: [MythicLeaderboardLink] = [MythicLeaderboardLink]()
    
    enum CodingKeys: String, CodingKey {
        case _links
        case currentLeaderboards = "current_leaderboards"
    }
}



class MythicLeaderboardLink: Codable {
    var key: Link<MythicLeaderboard> = Link<MythicLeaderboard>()
    var id: Int = 0
    var name: String = ""
}



// https://us.api.battle.net/data/wow/connected-realm/11/mythic-leaderboard/197/period/642?namespace=dynamic-us
class MythicLeaderboard: Codable {
    var _links: SelfLink<MythicLeaderboard> = SelfLink<MythicLeaderboard>()
    var name: String = ""
    
    var map: WOWMap = WOWMap()
    var mapChallengeModeID: Int = 0
    
    var period: Int = 0
    var periodStartTimestamp: Int = 0
    var periodEndTimestamp: Int = 0
    
    var connectedRealm: Link<ConnectedRealm> = Link<ConnectedRealm>()
    var leadingGroups: [LeadingGroup] = [LeadingGroup]()
    var keystoneAffixes: [KeystoneAffixSummary] = [KeystoneAffixSummary]()
    
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



class KeystoneAffixSummary: Codable {
    var keystoneAffix: KeystoneAffixLink = KeystoneAffixLink()
    var startingLevel: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case keystoneAffix = "keystone_affix"
        case startingLevel = "starting_level"
    }
}



class KeystoneAffixLink: Codable {
    var key: Link<KeystoneAffix> = Link<KeystoneAffix>()
    var id: Int = 0
    var name: String = ""
}


/**
 - note: The KeystoneAffix service is currently inaccessible to the public
 */
// https://us.api.battle.net/data/wow/keystone-affix/6?namespace=static-7.3.5_25875-us
class KeystoneAffix: Codable {
    
}



class LeadingGroup: Codable {
    var ranking: Int = 0
    var duration: Int = 0
    var completedTimestamp: Int = 0
    var keystoneLevel: Int = 0
    
    var members: [PartyMember] = [PartyMember]()
    
    enum CodingKeys: String, CodingKey {
        case ranking
        case duration
        case completedTimestamp = "completed_timestamp"
        case keystoneLevel = "keystone_level"
        case members
    }
}



class PartyMember: Codable {
    var profile: Profile = Profile()
    var faction: Faction = Faction()
    var specialization: SpecializationLink = SpecializationLink()
}



class Profile: Codable {
    var id: Int = 0
    var name: String = ""
    var realm: RealmLink = RealmLink()
}



class Faction: Codable {
    var type: FactionType = .alliance
}

enum FactionType: String, Codable {
    case alliance = "ALLIANCE"
    case horde = "HORDE"
}



class WOWMap: Codable {
    var id: Int = 0
    var name: String = ""
}

