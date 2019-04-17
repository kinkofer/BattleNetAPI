//
//  ConnectedRealm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/?namespace=dynamic-us
class ConnectedRealmIndex: Codable, SelfDecodable {
    let _links: SelfLink<ConnectedRealmIndex>
    let connectedRealms: [Link<ConnectedRealm>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/wow/connected-realm/11?namespace=dynamic-us
class ConnectedRealm: Codable, SelfDecodable {
    let _links: SelfLink<ConnectedRealm>
    let id: Int
    
    let realms: [Realm]
    
    let hasQueue: Bool
    let status: ConnectedRealmStatus
    let population: ConnectedRealmPopulation
    
    let mythicLeaderboards: Link<MythicLeaderboard>
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class ConnectedRealmStatus: Codable {
    let type: String
    let name: String
}



class ConnectedRealmPopulation: Codable {
    let type: String
    let name: String
}
