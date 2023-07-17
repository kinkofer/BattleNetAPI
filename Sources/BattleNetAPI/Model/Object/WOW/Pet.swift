//
//  Pet.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct PetIndex: Codable {
    public let pets: [Pet]
}


public struct Pet: Codable {
    public let canBattle: Bool
    public let creatureID: Int
    public let name: String
    public let family: PetFamily
    public let icon: String
    public let qualityID: Int
    public let stats: PetStats
    public let strongAgainst: [PetFamily]
    public let typeID: Int
    public let weakAgainst: [PetFamily]
    
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


public enum PetFamily: String, Codable {
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



public struct PetStats: Codable {
    public let speciesID: Int
    public let breedID: Int
    public let petQualityID: Int
    public let level: Int
    public let health: Int
    public let power: Int
    public let speed: Int
    
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



public struct PetSpecies: Codable {
    public let speciesID: Int
    public let petTypeID: Int
    public let creatureID: Int
    public let name: String
    public let canBattle: Bool
    public let icon: String
    public let description: String
    public let source: String
    public let abilities: [PetSpeciesAbility]
    
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



public struct PetSpeciesAbility: Codable {
    public let slot: Int
    public let order: Int
    public let requiredLevel: Int
    public let id: Int
    public let name: String
    public let icon: String
    public let cooldown: Int
    public let rounds: Int
    public let petTypeID: Int
    public let isPassive: Bool
    public let hideHints: Bool
    
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



public struct PetAbility: Codable {
    public let id: Int
    public let name: String
    public let icon: String
    public let cooldown: Int
    public let rounds: Int
    public let petTypeID: Int
    public let isPassive: Bool
    public let hideHints: Bool
    
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



public struct PetTypeIndex: Codable {
    public let petTypes: [PetType]
}



public struct PetType: Codable {
    public let id: Int
    public let key: String
    public let name: String
    public let typeAbilityID: Int
    public let strongAgainstID: Int
    public let weakAgainstID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case key
        case name
        case typeAbilityID = "typeAbilityId"
        case strongAgainstID = "strongAgainstId"
        case weakAgainstID = "weakAgainstId"
    }
}



public struct HunterPet: Codable {
    public let name: String
    public let creature: Int
    public let slot: Int
    public let spec: CharacterSpecialization
    public let calcSpec: String
    public let familyID: Int
    public let familyName: String
    
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



public struct CollectedPetIndex: Codable {
    public let collected: [CollectedPet]
    public let numCollected: Int
    public let numNotCollected: Int
}



public struct CollectedPet: Codable {
    public let spellID: Int
    public let qualityID: Int
    public let stats: PetStats
    public let isThirdAbilitySlotSelected: Bool
    public let canBattle: Bool
    public let isFavorite: Bool
    public let isSecondAbilitySlotSelected: Bool
    public let battlePetGUID: String
    public let icon: String
    public let isFirstAbilitySlotSelected: Bool
    public let creatureID: Int
    public let creatureName: String
    public let name: String
    public let itemID: Int
    
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



public struct PetSlot: Codable {
    public let slot: Int
    public let isLocked: Bool
    public let abilities: [Int]
    public let battlePetGUID: String
    public let isEmpty: Bool
    
    enum CodingKeys: String, CodingKey {
        case slot
        case isLocked
        case abilities
        case battlePetGUID = "battlePetGuid"
        case isEmpty
    }
}
