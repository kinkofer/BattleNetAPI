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
class Realm: Codable, SelfDecodable {
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
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class RealmInfo: Codable {
    let name: String
    let type: String
}



// MARK: - Realm Data Resource

class WOWRealmIndex: Codable, SelfDecodable {
    let realms: [WOWRealm]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class WOWRealm: Codable, SelfDecodable {
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
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
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
