//
//  ConnectedRealm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/?namespace=dynamic-us
public struct ConnectedRealmIndex: Codable, SelfDecodable {
    public let _links: SelfLink<ConnectedRealmIndex>
    public let connectedRealms: [Link<ConnectedRealm>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/wow/connected-realm/11?namespace=dynamic-us
public struct ConnectedRealm: Codable, SelfDecodable {
    public let _links: SelfLink<ConnectedRealm>
    public let id: Int
    
    public let realms: [Realm]
    
    public let hasQueue: Bool
    public let status: ConnectedRealmStatus
    public let population: ConnectedRealmPopulation
    
    public let mythicLeaderboards: Link<MythicLeaderboard>
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct ConnectedRealmStatus: Codable {
    public let type: String
    public let name: String
}



public struct ConnectedRealmPopulation: Codable {
    public let type: String
    public let name: String
}
