//
//  Pet.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class PetIndex: Codable {
    let pets: [Pet]
}


class Pet: Codable {
    let canBattle: Bool
    let creatureID: Int
    let name: String
    let family: PetFamily
    let icon: String
    let qualityID: Int
    let stats: PetStats
    let strongAgainst: [PetFamily]
    let typeID: Int
    let weakAgainst: [PetFamily]
    
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
    let speciesID: Int
    let breedID: Int
    let petQualityID: Int
    let level: Int
    let health: Int
    let power: Int
    let speed: Int
    
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
    let speciesID: Int
    let petTypeID: Int
    let creatureID: Int
    let name: String
    let canBattle: Bool
    let icon: String
    let description: String
    let source: String
    let abilities: [PetSpeciesAbility]
    
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
    let slot: Int
    let order: Int
    let requiredLevel: Int
    let id: Int
    let name: String
    let icon: String
    let cooldown: Int
    let rounds: Int
    let petTypeID: Int
    let isPassive: Bool
    let hideHints: Bool
    
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
    let id: Int
    let name: String
    let icon: String
    let cooldown: Int
    let rounds: Int
    let petTypeID: Int
    let isPassive: Bool
    let hideHints: Bool
    
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
    let petTypes: [PetType]
}



class PetType: Codable {
    let id: Int
    let key: String
    let name: String
    let typeAbilityID: Int
    let strongAgainstID: Int
    let weakAgainstID: Int
    
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
    let name: String
    let creature: Int
    let slot: Int
    let spec: CharacterSpecialization
    let calcSpec: String
    let familyID: Int
    let familyName: String
    
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
    let collected: [CollectedPet]
    let numCollected: Int
    let numNotCollected: Int
}



class CollectedPet: Codable {
    let spellID: Int
    let qualityID: Int
    let stats: PetStats
    let isThirdAbilitySlotSelected: Bool
    let canBattle: Bool
    let isFavorite: Bool
    let isSecondAbilitySlotSelected: Bool
    let battlePetGUID: String
    let icon: String
    let isFirstAbilitySlotSelected: Bool
    let creatureID: Int
    let creatureName: String
    let name: String
    let itemID: Int
    
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
    let slot: Int
    let isLocked: Bool
    let abilities: [Int]
    let battlePetGUID: String
    let isEmpty: Bool
    
    enum CodingKeys: String, CodingKey {
        case slot
        case isLocked
        case abilities
        case battlePetGUID = "battlePetGuid"
        case isEmpty
    }
}
