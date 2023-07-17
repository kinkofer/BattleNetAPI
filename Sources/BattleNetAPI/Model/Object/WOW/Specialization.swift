//
//  Specialization.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct SpecializationIndex: Codable, SelfDecodable {
    public let _links: SelfLink<SpecializationIndex>
    public let characterSpecializations: [KeyLink<Specialization>]
    public let petSpecializations: [KeyLink<Specialization>]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/wow/playable-specialization/65?namespace=static-7.3.5_25875-us
public struct Specialization: Codable, SelfDecodable {
    public let _links: SelfLink<Specialization>
    public let id: Int
    public let name: String

    public let playableClass: KeyLink<WOWClass>
    public let genderDescription: GenderName
    public let role: Role
    public let pvpTalents: [Talent]
    public let talentTiers: [TalentTier]
    
    public let media: MediaLink
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



public struct Role: Codable {
    public let type: String
    public let name: String
}


public struct TalentTier: Codable {
    public let level: Int
    public let talents: [Talent]
}


public struct Talent: Codable, SelfDecodable {
    public let talent: KeyLink<WOWClass>
    public let spellTooltip: SpellTooltip
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct SpellTooltip: Codable, SelfDecodable {
    public let description: String
    public let castTime: CastTime
    public let cooldown: String?
    public let powerCost: String?
    public let range: Range?
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public enum CastTime: String, Codable {
    case channeled = "Channeled"
    case instant = "Instant"
    case passive = "Passive"
    case zeroFiveSecCast = "0.5 sec cast"
    case oneFiveSecCast = "1.5 sec cast"
    case oneSevenSecCast = "1.7 sec cast"
    case oneEightSecCast = "1.8 sec cast"
    case oneSecCast = "1 sec cast"
    case twoFiveSecCast = "2.5 sec cast"
    case twoSecCast = "2 sec cast"
    case threeSecCast = "3 sec cast"
}


public enum Range: String, Codable {
    case meleeRange = "Melee Range"
    case tenYdRange = "10 yd range"
    case fifteenYdRange = "15 yd range"
    case twentyYdRange = "20 yd range"
    case thirtyYdRange = "30 yd range"
    case thirtyFiveYdRange = "35 yd range"
    case fortyYdRange = "40 yd range"
    case fiftyYdRange = "50 yd range"
    case fiveToTwentyFiveYdRange = "5-25 yd range"
    case SixtyYdRange = "60 yd range"
    case eightToTwentyFiveYdRange = "8-25 yd range"
    case eightYdRange = "8 yd range"
}



public struct CharacterSpecialization: Codable {
    public let name: String
    public let role: RoleType
    public let backgroundImage: String
    public let icon: String
    public let description: String
    public let order: Int
}
