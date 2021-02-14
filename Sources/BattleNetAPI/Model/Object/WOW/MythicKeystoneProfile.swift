//
//  MythicKeystoneProfile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/16/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


public class MythicKeystoneProfile: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystoneProfile>
    public let character: Link<WOWCharacterProfile>
    public let currentPeriod: CurrentPeriod
    public let seasons: [KeyLink<MythicKeystoneProfileSeason>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public class CurrentPeriod: Codable, SelfDecodable {
    public let period: KeyLink<MythicKeystoneProfileSeason>
    public let bestRuns: [BestRun]?
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public class BestRun: Codable, SelfDecodable {
    public let completedTimestamp: Int
    public let duration: Int
    public let keystoneLevel: Int
    public let keystoneAffixes: [KeyLink<KeystoneAffix>]
    public let members: [Member]
    public let dungeon: KeyLink<KeystoneAffix>
    public let isCompletedWithinTime: Bool
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public class Member: Codable, SelfDecodable {
    public let character: MemberCharacter
    public let specialization: KeyLink<Specialization>
    public let race: KeyLink<WOWRace>
    public let equippedItemLevel: Int
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public class MemberCharacter: Codable {
    public let name: String
    public let id: Int
    public let realm: MythicKeystoneRealm
}


public class MythicKeystoneRealm: Codable {
    public let key: Link<WOWRealm>
    public let id: Int
    public let slug: String
}


public class MythicKeystoneProfileSeason: Codable, SelfDecodable {
    public let _links: SelfLink<MythicKeystoneProfileSeason>
    public let season: KeyLink<MythicKeystoneSeason>
    public let bestRuns: [BestRun]
    public let character: Link<WOWCharacterProfile>
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
