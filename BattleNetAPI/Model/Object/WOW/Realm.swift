//
//  Realm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class RealmIndexResult: Codable {
    let realms: [RealmIndex]
}


class RealmIndex: Codable {
    let id: Int
    let name: String
    let slug: String
}


// https://us.api.battle.net/data/wow/realm/61?namespace=dynamic-us
class Realm: Codable {
    let _links: SelfLink<Realm>?
    let id: Int
    let name: String
    let slug: String
    
    let isTournament: Bool
    
    let type: RealmInfo
    let category: String
    let locale: String
    let timezone: String
    
    let region: KeyLink<Region>
    let connectedRealm: Link<ConnectedRealm>
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id
        case name
        case slug
        case isTournament = "is_tournament"
        case type
        case category
        case locale
        case timezone
        case region
        case connectedRealm = "connected_realm"
    }
}



class RealmInfo: Codable {
    let name: String
    let type: String
}



// MARK: - Realm Data Resource

class WOWRealmIndex: Codable {
    let realms: [WOWRealm]
}



class WOWRealm: Codable {
    let type: RealmType
    let population: RealmPopulation
    let queue: Bool
    let status: Bool
    let name: String
    let slug: String
    let battlegroup: String
    let locale: String
    let timezone: String
    let connectedRealms: [String]
    
    enum CodingKeys: String, CodingKey {
        case type
        case population
        case queue
        case status
        case name
        case slug
        case battlegroup
        case locale
        case timezone
        case connectedRealms = "connected_realms"
    }
}


enum RealmPopulation: String, Codable {
    case full = "full"
    case high = "high"
    case low = "low"
    case medium = "medium"
    case notApplicable = "n/a"
}


enum RealmType: String, Codable {
    case normal
    case roleplaying
}



class RealmSummary: Codable {
    let name: String
    let slug: String
    let battlegroup: String
    let locale: String
    let timezone: String
    let connectedRealms: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case slug
        case battlegroup
        case locale
        case timezone
        case connectedRealms = "connected_realms"
    }
}
