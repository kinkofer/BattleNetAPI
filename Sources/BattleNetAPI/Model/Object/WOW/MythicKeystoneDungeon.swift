//
//  MythicDungeon.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/13/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public struct MythicKeystoneIndex: Codable {
    public let _links: SelfLink<MythicKeystoneIndex>
    public let seasons: Link<MythicKeystoneSeasonIndex>
    public let dungeons: Link<MythicKeystoneDungeonIndex>
}


public struct MythicKeystoneDungeonIndex: Codable {
    public let _links: SelfLink<MythicKeystoneDungeonIndex>
    public let dungeons: [KeyLink<MythicKeystoneDungeon>]
}


public struct MythicKeystoneDungeon: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystoneDungeon>
    public let id: Int
    public let name: String
    public let map: Map
    public let zone: ZoneSlug
    public let keystoneUpgrades: [KeystoneUpgrade]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct KeystoneUpgrade: Codable, SelfDecodable {
    public let upgradeLevel: Int
    public let qualifyingDuration: Int
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Map: Codable {
    public let name: String
    public let id: Int
}



public struct MythicKeystonePeriodIndex: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystonePeriodIndex>
    public let periods: [KeyLink<MythicKeystonePeriod>]
    public let currentPeriod: KeyLink<MythicKeystonePeriod>
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct MythicKeystonePeriod: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystonePeriod>
    public let id: Int
    public let startTimestamp: Int
    public let endTimestamp: Int
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct MythicKeystoneSeasonIndex: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystoneSeasonIndex>
    public let seasons: [KeyLink<MythicKeystoneSeason>]
    public let currentSeason: KeyLink<MythicKeystoneSeason>
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct MythicKeystoneSeason: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystoneSeason>
    public let id: Int
    public let startTimestamp: Int
    public let endTimestamp: Int
    public let periods: [KeyLink<MythicKeystonePeriod>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
