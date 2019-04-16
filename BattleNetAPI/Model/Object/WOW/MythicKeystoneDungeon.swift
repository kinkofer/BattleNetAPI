//
//  MythicDungeon.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class MythicKeystoneIndex: Codable {
    let _links: SelfLink<MythicKeystoneIndex>
    let seasons: Link<MythicKeystoneSeasonIndex>
    let dungeons: Link<MythicKeystoneDungeonIndex>
}


class MythicKeystoneDungeonIndex: Codable {
    let _links: SelfLink<MythicKeystoneDungeonIndex>
    let dungeons: [KeyLink<MythicKeystoneDungeon>]
}


class MythicKeystoneDungeon: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystoneDungeon>
    let id: Int
    let name: String
    let map: Map
    let zone: ZoneSlug
    let keystoneUpgrades: [KeystoneUpgrade]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class KeystoneUpgrade: Codable, SelfDecodable {
    let upgradeLevel: Int
    let qualifyingDuration: Int
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class Map: Codable {
    let name: String
    let id: Int
}



class MythicKeystonePeriodIndex: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystonePeriodIndex>
    let periods: [KeyLink<MythicKeystonePeriod>]
    let currentPeriod: KeyLink<MythicKeystonePeriod>
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class MythicKeystonePeriod: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystonePeriod>
    let id: Int
    let startTimestamp: Int
    let endTimestamp: Int
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class MythicKeystoneSeasonIndex: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystoneSeasonIndex>
    let seasons: [KeyLink<MythicKeystoneSeason>]
    let currentSeason: KeyLink<MythicKeystoneSeason>
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class MythicKeystoneSeason: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystoneSeason>
    let id: Int
    let startTimestamp: Int
    let endTimestamp: Int
    let periods: [KeyLink<MythicKeystonePeriod>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
