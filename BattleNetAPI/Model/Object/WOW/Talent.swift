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
    var specs: [CharacterSpecialization] = [CharacterSpecialization]()
    var talents: [[[TalentElement]]] = [[[TalentElement]]]()
    var `class`: String = ""
    var petSpecs: [CharacterSpecialization]? = nil
}



enum RoleType: String, Codable {
    case dps = "DPS"
    case healing = "HEALING"
    case tank = "TANK"
}



class TalentElement: Codable {
    var tier: Int = 0
    var column: Int = 0
    var spell: CharacterSpell = CharacterSpell()
    var spec: CharacterSpecialization? = nil
}



class CharacterSpell: Codable {
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    var description: String = ""
    var castTime: CastTime = .instant
    var range: Range? = nil
    var cooldown: String? = nil
    var powerCost: String? = nil
    var subtext: String? = nil
}



class CharacterTalent: Codable {
    var talents: [TalentElement] = [TalentElement]()
    var spec: CharacterSpecialization? = nil
    var selected: Bool? = nil
    var calcTalent: String = ""
    var calcSpec: String = ""
}



