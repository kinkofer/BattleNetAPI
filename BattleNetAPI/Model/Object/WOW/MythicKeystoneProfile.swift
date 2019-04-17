//
//  MythicKeystoneProfile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/16/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation


class MythicKeystoneProfile: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystoneProfile>
    let character: Link<WOWCharacterProfile>
    let currentPeriod: CurrentPeriod
    let seasons: [KeyLink<MythicKeystoneProfileSeason>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class CurrentPeriod: Codable, SelfDecodable {
    let period: KeyLink<MythicKeystoneProfileSeason>
    let bestRuns: [BestRun]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class BestRun: Codable, SelfDecodable {
    let completedTimestamp: Int
    let duration: Int
    let keystoneLevel: Int
    let keystoneAffixes: [KeyLink<KeystoneAffix>]
    let members: [Member]
    let dungeon: KeyLink<KeystoneAffix>
    let isCompletedWithinTime: Bool
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class Member: Codable, SelfDecodable {
    let character: MemberCharacter
    let specialization: KeyLink<Specialization>
    let race: KeyLink<WOWRace>
    let equippedItemLevel: Int
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class MemberCharacter: Codable {
    let name: String
    let id: Int
    let realm: MythicKeystoneRealm
}


class MythicKeystoneRealm: Codable {
    let key: Link<WOWRealm>
    let id: Int
    let slug: String
}


class MythicKeystoneProfileSeason: Codable, SelfDecodable {
    let _links: SelfLink<MythicKeystoneProfileSeason>
    let season: KeyLink<MythicKeystoneSeason>
    let bestRuns: [BestRun]
    let character: Link<WOWCharacterProfile>
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
