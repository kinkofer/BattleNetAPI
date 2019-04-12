//
//  Realm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



class RealmIndexResult: Codable {
    var realms: [RealmIndex] = [RealmIndex]()
}



class RealmIndex: Codable {
    var id: Int = 0
    var name: String = ""
    var slug: String = ""
}


class RealmLink: Codable {
    var key: Link<Region> = Link<Region>()
    var id: Int = 0
    var slug: String = ""
}


// https://us.api.battle.net/data/wow/realm/61?namespace=dynamic-us
class Realm: Codable {
    var id = 0
    var name = ""
    var slug = ""
    
    var isTournament = false
    
    var type = RealmType()
    var category = ""
    var locale = ""
    var timezone = ""
    
    var region = RegionLink()
    var connectedRealm: Link<ConnectedRealm> = Link<ConnectedRealm>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case isTournament = "is_tournament"
        case type
        case category
        case timezone
        case region
    }
}



class RealmType: Codable {
    var name: String = ""
    var type: String = ""
}



// MARK: - Realm Legacy

class RealmIndexLegacy: Codable {
    var realms: [RealmLegacy] = [RealmLegacy]()
}



class RealmLegacy: Codable {
    var type: RealmTypeLegacy = .normal
    var population: RealmPopulation = .notApplicable
    var queue: Bool = false
    var status: Bool = false
    var name: String = ""
    var slug: String = ""
    var battlegroup: String = ""
    var locale: String = ""
    var timezone: String = ""
    var connectedRealms: [String] = [String]()
    
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


enum RealmTypeLegacy: String, Codable {
    case normal
    case roleplaying
}



class RealmSummaryLegacy: Codable {
    var name: String = ""
    var slug: String = ""
    var battlegroup: String = ""
    var locale: String = ""
    var timezone: String = ""
    var connectedRealms: [String] = [String]()
    
    enum CodingKeys: String, CodingKey {
        case name
        case slug
        case battlegroup
        case locale
        case timezone
        case connectedRealms = "connected_realms"
    }
}
