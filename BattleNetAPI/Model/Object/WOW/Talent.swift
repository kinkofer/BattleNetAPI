//
//  Talent.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


typealias ClassTalentDictionary = [String: ClassTalent]

class ClassTalent: Codable {
    let specs: [CharacterSpecialization]
    let talents: [[[TalentElement]]]
    let `class`: String
    let petSpecs: [CharacterSpecialization]?
}



enum RoleType: String, Codable {
    case dps = "DPS"
    case healing = "HEALING"
    case tank = "TANK"
}



class TalentElement: Codable {
    let tier: Int
    let column: Int
    let spell: CharacterSpell
    let spec: CharacterSpecialization?
}



class CharacterSpell: Codable {
    let id: Int
    let name: String
    let icon: String
    let description: String
    let castTime: CastTime
    let range: Range?
    let cooldown: String?
    let powerCost: String?
    let subtext: String?
}



class CharacterTalent: Codable {
    let talents: [TalentElement]
    let spec: CharacterSpecialization?
    let selected: Bool?
    let calcTalent: String
    let calcSpec: String
}



class PVPTalentSlots: Codable, SelfDecodable {
    let _links: SelfLink<PVPTalentSlots>
    let talentSlots: [TalentSlot]
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


class TalentSlot: Codable, SelfDecodable {
    let slotNumber: Int
    let unlockPlayerLevel: Int
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
