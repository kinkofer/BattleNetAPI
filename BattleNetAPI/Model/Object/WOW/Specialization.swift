//
//  Specialization.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/19/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class SpecializationIndex: Codable {
    var _links: SelfLink<SpecializationIndex> = SelfLink<SpecializationIndex>()
    var characterSpecializations: [SpecializationLink] = [SpecializationLink]()
    var petSpecializations: [SpecializationLink] = [SpecializationLink]()
    
    enum CodingKeys: String, CodingKey {
        case _links
        case characterSpecializations = "character_specializations"
        case petSpecializations = "pet_specializations"
    }
}



class SpecializationLink: Codable {
    var key: Link<Specialization> = Link<Specialization>()
    var id: Int = 0
    var name: String? = nil
}



// https://us.api.battle.net/data/wow/playable-specialization/65?namespace=static-7.3.5_25875-us
class Specialization: Codable {
    var _links: SelfLink<Specialization> = SelfLink<Specialization>()
    var id: Int = 0
    var name: String = ""

    var playableClass: WOWClassLink = WOWClassLink()
    var genderDescription: GenderName = GenderName()
    var role: Role = Role()
    var pvpTalents: [Talent] = [Talent]()
    var talentTiers: [TalentTier] = [TalentTier]()
    
    var media: MediaLink = MediaLink()
    
    enum CodingKeys: String, CodingKey {
        case _links
        case id
        case playableClass = "playable_class"
        case name
        case genderDescription = "gender_description"
        case media
        case role
        case pvpTalents = "pvp_talents"
        case talentTiers = "talent_tiers"
    }
}



class Role: Codable {
    var type: String = ""
    var name: String = ""
}


class TalentTier: Codable {
    var level: Int = 0
    var talents: [Talent] = [Talent]()
}


class Talent: Codable {
    var talent: WOWClassLink = WOWClassLink()
    var spellTooltip: SpellTooltip = SpellTooltip()
    
    enum CodingKeys: String, CodingKey {
        case talent
        case spellTooltip = "spell_tooltip"
    }
}


class SpellTooltip: Codable {
    var description: String = ""
    var castTime: CastTime = .instant
    var cooldown: String? = nil
    var powerCost: String? = nil
    var range: Range? = nil
    
    enum CodingKeys: String, CodingKey {
        case description
        case castTime = "cast_time"
        case cooldown
        case powerCost = "power_cost"
        case range
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
    var name: String = ""
    var role: RoleType = .dps
    var backgroundImage: String = ""
    var icon: String = ""
    var description: String = ""
    var order: Int = 0
}
