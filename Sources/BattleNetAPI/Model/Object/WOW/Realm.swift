//
//  Realm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct RealmIndexResult: Codable {
    public let realms: [RealmIndex]
}


public struct RealmIndex: Codable {
    public let id: Int
    public let name: String
    public let slug: String
}


// https://us.api.battle.net/data/wow/realm/61?namespace=dynamic-us
public struct Realm: Codable, SelfDecodable {
    public let _links: SelfLink<Realm>?
    public let id: Int
    public let name: String
    public let slug: String
    
    public let isTournament: Bool
    
    public let type: RealmInfo
    public let category: String
    public let locale: String
    public let timezone: String
    
    public let region: KeyLink<Region>
    public let connectedRealm: Link<ConnectedRealm>
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct RealmInfo: Codable {
    public let name: String
    public let type: String
}



// MARK: - Realm Data Resource

public struct WOWRealmIndex: Codable, SelfDecodable {
    public let realms: [WOWRealm]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct WOWRealm: Codable, SelfDecodable {
    public let type: RealmType
    public let population: RealmPopulation
    public let queue: Bool
    public let status: Bool
    public let name: String
    public let slug: String
    public let battlegroup: String
    public let locale: String
    public let timezone: String
    public let connectedRealms: [String]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public enum RealmPopulation: String, Codable {
    case full = "full"
    case high = "high"
    case low = "low"
    case medium = "medium"
    case notApplicable = "n/a"
}


public enum RealmType: String, Codable {
    case normal
    case roleplaying
}



public struct RealmSummary: Codable {
    public let name: String
    public let slug: String
    public let battlegroup: String
    public let locale: String
    public let timezone: String
    public let connectedRealms: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case slug
        case battlegroup
        case locale
        case timezone
        case connectedRealms = "connected_realms"
    }
}
