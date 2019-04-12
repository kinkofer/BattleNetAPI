//
//  Pet.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class PetIndex: Codable {
    var pets: [Pet] = [Pet]()
}



class Pet: Codable {
    var canBattle: Bool = false
    var creatureID: Int = 0
    var name: String = ""
    var family: PetFamily = .beast
    var icon: String = ""
    var qualityID: Int = 0
    var stats: PetStats = PetStats()
    var strongAgainst: [PetFamily] = [PetFamily]()
    var typeID: Int = 0
    var weakAgainst: [PetFamily] = [PetFamily]()
    
    enum CodingKeys: String, CodingKey {
        case canBattle
        case creatureID = "creatureId"
        case name
        case family
        case icon
        case qualityID = "qualityId"
        case stats
        case strongAgainst
        case typeID = "typeId"
        case weakAgainst
    }
}


enum PetFamily: String, Codable {
    case beast = "beast"
    case critter = "critter"
    case dragonkin = "dragonkin"
    case elemental = "elemental"
    case flying = "flying"
    case humanoid = "humanoid"
    case magical = "magical"
    case mechanical = "mechanical"
    case undead = "undead"
    case water = "water"
}



class PetStats: Codable {
    var speciesID: Int = 0
    var breedID: Int = 0
    var petQualityID: Int = 0
    var level: Int = 0
    var health: Int = 0
    var power: Int = 0
    var speed: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case speciesID = "speciesId"
        case breedID = "breedId"
        case petQualityID = "petQualityId"
        case level
        case health
        case power
        case speed
    }
}



class PetSpecies: Codable {
    var speciesID: Int = 0
    var petTypeID: Int = 0
    var creatureID: Int = 0
    var name: String = ""
    var canBattle: Bool = false
    var icon: String = ""
    var description: String = ""
    var source: String = ""
    var abilities: [PetSpeciesAbility] = [PetSpeciesAbility]()
    
    enum CodingKeys: String, CodingKey {
        case speciesID = "speciesId"
        case petTypeID = "petTypeId"
        case creatureID = "creatureId"
        case name
        case canBattle
        case icon
        case description
        case source
        case abilities
    }
}



class PetSpeciesAbility: Codable {
    var slot: Int = 0
    var order: Int = 0
    var requiredLevel = 0
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    var cooldown: Int = 0
    var rounds: Int = 0
    var petTypeID: Int = 0
    var isPassive: Bool = false
    var hideHints: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case slot
        case order
        case requiredLevel
        case id
        case name
        case icon
        case cooldown
        case rounds
        case petTypeID = "petTypeId"
        case isPassive
        case hideHints
    }
}



class PetAbility: Codable {
    var id: Int = 0
    var name: String = ""
    var icon: String = ""
    var cooldown: Int = 0
    var rounds: Int = 0
    var petTypeID: Int = 0
    var isPassive: Bool = false
    var hideHints: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case cooldown
        case rounds
        case petTypeID = "petTypeId"
        case isPassive
        case hideHints
    }
}



class PetTypeIndex: Codable {
    var petTypes: [PetType] = [PetType]()
}



class PetType: Codable {
    var id: Int = 0
    var key: String = ""
    var name: String = ""
    var typeAbilityID: Int = 0
    var strongAgainstID: Int = 0
    var weakAgainstID: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
        case typeAbilityID = "typeAbilityId"
        case strongAgainstID = "strongAgainstId"
        case weakAgainstID = "weakAgainstId"
    }
}



class HunterPet: Codable {
    var name: String = ""
    var creature = 0
    var slot: Int = 0
    var spec: CharacterSpecialization = CharacterSpecialization()
    var calcSpec: String = ""
    var familyID: Int = 0
    var familyName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case creature
        case slot
        case spec
        case calcSpec
        case familyID = "familyId"
        case familyName
    }
}



class CollectedPetIndex: Codable {
    var collected: [CollectedPet] = [CollectedPet]()
    var numCollected: Int = 0
    var numNotCollected: Int = 0
}



class CollectedPet: Codable {
    var spellID: Int = 0
    var qualityID: Int = 0
    var stats: PetStats = PetStats()
    var isThirdAbilitySlotSelected: Bool = false
    var canBattle: Bool = false
    var isFavorite: Bool = false
    var isSecondAbilitySlotSelected: Bool = false
    var battlePetGUID: String = ""
    var icon: String = ""
    var isFirstAbilitySlotSelected: Bool = false
    var creatureID: Int = 0
    var creatureName: String = ""
    var name: String = ""
    var itemID: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case spellID = "spellId"
        case qualityID = "qualityId"
        case stats
        case isThirdAbilitySlotSelected
        case canBattle
        case isFavorite
        case isSecondAbilitySlotSelected
        case battlePetGUID = "battlePetGuid"
        case icon
        case isFirstAbilitySlotSelected
        case creatureID = "creatureId"
        case creatureName
        case name
        case itemID = "itemId"
    }
}



class PetSlot: Codable {
    let slot: Int = 0
    let isLocked: Bool = false
    let abilities: [Int] = [Int]()
    let battlePetGUID: String = ""
    let isEmpty: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case slot
        case isLocked
        case abilities
        case battlePetGUID = "battlePetGuid"
        case isEmpty
    }
}
