//
//  ConnectedRealm.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


// https://us.api.battle.net/data/wow/connected-realm/?namespace=dynamic-us
class ConnectedRealmIndex: Codable {
    var _links: SelfLink<ConnectedRealmIndex> = SelfLink<ConnectedRealmIndex>()
    var connectedRealms: [Link<ConnectedRealm>] = [Link<ConnectedRealm>]()
    
    enum CodingKeys: String, CodingKey {
        case connectedRealms = "connected_realms"
    }
}



// https://us.api.battle.net/data/wow/connected-realm/11?namespace=dynamic-us
class ConnectedRealm: Codable {
    var _links: SelfLink<ConnectedRealm> = SelfLink<ConnectedRealm>()
    var id: Int = 0
    
    var realms: [Realm] = [Realm]()
    
    var hasQueue: Bool = false
    var status: ConnectedRealmStatus = ConnectedRealmStatus()
    var population: ConnectedRealmPopulation = ConnectedRealmPopulation()
    
    var mythicLeaderboards: Link<MythicLeaderboard> = Link<MythicLeaderboard>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case realms
        case hasQueue = "has_queue"
        case status
        case population
        case mythicLeaderboards = "mythic_leaderboards"
    }
}



class ConnectedRealmStatus: Codable {
    var type: String = ""
    var name: String = ""
}



class ConnectedRealmPopulation: Codable {
    var type: String = ""
    var name: String = ""
}
