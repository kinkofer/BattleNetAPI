//
//  Talent.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/28/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public typealias ClassTalentDictionary = [String: ClassTalent]

public class ClassTalent: Codable {
    public let specs: [CharacterSpecialization]
    public let talents: [[[TalentElement]]]
    public let `class`: String
    public let petSpecs: [CharacterSpecialization]?
}



public enum RoleType: String, Codable {
    case dps = "DPS"
    case healing = "HEALING"
    case tank = "TANK"
}



public class TalentElement: Codable {
    public let tier: Int
    public let column: Int
    public let spell: CharacterSpell
    public let spec: CharacterSpecialization?
}



public class CharacterSpell: Codable {
    public let id: Int
    public let name: String
    public let icon: String
    public let description: String
    public let castTime: CastTime
    public let range: Range?
    public let cooldown: String?
    public let powerCost: String?
    public let subtext: String?
}



public class CharacterTalent: Codable {
    public let talents: [TalentElement]
    public let spec: CharacterSpecialization?
    public let selected: Bool?
    public let calcTalent: String
    public let calcSpec: String
}



public class PVPTalentSlots: Codable, SelfDecodable {
    public let _links: SelfLink<PVPTalentSlots>
    public let talentSlots: [TalentSlot]
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public class TalentSlot: Codable, SelfDecodable {
    public let slotNumber: Int
    public let unlockPlayerLevel: Int
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
