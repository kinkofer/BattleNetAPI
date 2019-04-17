//
//  Specialization.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SpecializationIndex: Codable, SelfDecodable {
    let _links: SelfLink<SpecializationIndex>
    let characterSpecializations: [KeyLink<Specialization>]
    let petSpecializations: [KeyLink<Specialization>]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



// https://us.api.battle.net/data/wow/playable-specialization/65?namespace=static-7.3.5_25875-us
class Specialization: Codable, SelfDecodable {
    let _links: SelfLink<Specialization>
    let id: Int
    let name: String

    let playableClass: KeyLink<WOWClass>
    let genderDescription: GenderName
    let role: Role
    let pvpTalents: [Talent]
    let talentTiers: [TalentTier]
    
    let media: MediaLink
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}



class Role: Codable {
    let type: String
    let name: String
}


class TalentTier: Codable {
    let level: Int
    let talents: [Talent]
}


class Talent: Codable, SelfDecodable {
    let talent: KeyLink<WOWClass>
    let spellTooltip: SpellTooltip
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class SpellTooltip: Codable, SelfDecodable {
    let description: String
    let castTime: CastTime
    let cooldown: String?
    let powerCost: String?
    let range: Range?
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


enum CastTime: String, Codable {
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


enum Range: String, Codable {
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



class CharacterSpecialization: Codable {
    let name: String
    let role: RoleType
    let backgroundImage: String
    let icon: String
    let description: String
    let order: Int
}
