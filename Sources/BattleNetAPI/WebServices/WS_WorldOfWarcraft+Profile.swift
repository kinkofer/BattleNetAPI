//
//  WS_WorldOfWarcraft+Profile.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension WS_WorldOfWarcraft {
    // MARK: - Profile API
    
    // MARK: Account Profile API
    
    /**
     Returns a profile summary for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAccountProfile(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountProfileSummary, namespace: namespace)
    }
    
    
    /**
     Returns a protected profile summary for a character.
     
     - parameter id: The ID of the character.
     - parameter realmID: The ID of the character's realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProtectedCharacterProfile(id: Int, realmID: Int, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.protectedCharacterProfileSummary(realmID: realmID, characterID: id), namespace: namespace)
    }
    
    
    /**
     Returns an index of collection types for an account.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAccountCollectionsIndex(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountCollectionsIndex, namespace: namespace)
    }
    
    
    /**
     Returns a summary of the mounts an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMountsCollectionSummary(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountMountsCollectionSummary, namespace: namespace)
    }
    
    
    /**
     Returns a summary of the battle pets an account has obtained.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetsCollectionSummary(namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.accountPetsCollectionSummary, namespace: namespace)
    }
    
    
    
    // MARK: Character Achievements API
    
    /**
     Returns a summary of the achievements a character has completed.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAchievementsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAchievementsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a character's statistics as they pertain to achievements.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAchievementStatistics(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAchievementStatistics(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Appearance API
    
    /**
     Returns a summary of a character's appearance settings.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAppearanceSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterAppearanceSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Collections API
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterCollectionsIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterCollectionsIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the mounts a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMountsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMountsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the battle pets a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterPetsCollectionSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPetsCollectionSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the heirlooms a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterHeirloomsCollection(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterHeirloomsCollection(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the toys a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterToysCollection(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterToysCollection(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the transmogs a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterTransmogsCollection(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterTransmogsCollection(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of the decor items a character has obtained.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterDecorCollection(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterDecorCollection(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Encounters API
    
    /**
     Returns a summary of a character's encounters.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterEncountersSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterEncountersSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of a character's completed dungeons.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterDungeons(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterDungeons(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    /**
     Returns a summary of a character's completed raids.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterRaids(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterRaids(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Equipment API
    
    public func getCharacterEquipmentSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterEquipmentSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character House API
    
    /**
     Returns a character's player house.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterHouse(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterHouse(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Hunter Pets API
    
    public func getCharacterHunterPetsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterHunterPetsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Media API
    
    public func getCharacterMediaSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMediaSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Mythic Keystone Profile API
    
    public func getCharacterMythicKeystoneProfileIndex(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMythicKeystoneProfileIndex(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterMythicKeystoneSeasonDetails(realmSlug: realmSlug, characterName: characterName, season: seasonID), namespace: namespace)
    }
    
    
    
    // MARK: Character Professions API
    
    public func getCharacterProfessionsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfessionsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Profile API
    
    public func getCharacterProfileSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfileSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    public func getCharacterProfileStatus(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterProfileStatus(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character PvP API
    
    public func getCharacterPvPBracketStatistics(characterName: String, realmSlug: String, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPvPBracketStatistics(realmSlug: realmSlug, characterName: characterName, pvpBracket: pvpBracket), namespace: namespace)
    }
    
    public func getCharacterPvPSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterPvPSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Quests API
    
    public func getCharacterQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    public func getCharacterCompletedQuests(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterCompletedQuests(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Reputations API
    
    public func getCharacterReputationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterReputationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Soulbinds API
    
    public func getCharacterSoulbinds(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterSoulbinds(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Specializations API
    
    public func getCharacterSpecializationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterSpecializationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Statistics API
    
    public func getCharacterStatisticsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterStatisticsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Character Titles API
    
    public func getCharacterTitlesSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.characterTitlesSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }
    
    
    
    // MARK: Guild Profile API
    
    public func getGuild(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guild(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    public func getGuildActivity(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildActivity(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    public func getGuildAchievements(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildAchievements(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
    
    public func getGuildRoster(slug: String, realmSlug: String, namespace: APINamespace? = .profile) async throws -> Data {
        return try await call(endpoint: API.guildRoster(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
}
