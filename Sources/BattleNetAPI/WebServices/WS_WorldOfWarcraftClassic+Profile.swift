//
//  WS_WorldOfWarcraftClassic+Profile.swift
//  BattleNetAPI
//

import Foundation


extension WS_WorldOfWarcraftClassic {
    // MARK: - Profile API

    // MARK: Account Profile API

    /**
     Returns a profile summary for an account.

     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAccountProfile(namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.accountProfileSummary, namespace: namespace)
    }


    /**
     Returns a protected profile summary for a character.

     - parameter id: The ID of the character.
     - parameter realmID: The ID of the character's realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getProtectedCharacterProfile(id: Int, realmID: Int, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.protectedCharacterProfileSummary(realmID: realmID, characterID: id), namespace: namespace)
    }



    // MARK: Character Achievements API

    /**
     Returns a summary of the achievements a character has completed.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAchievementsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterAchievementsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }


    /**
     Returns a character's statistics as they pertain to achievements.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAchievementStatistics(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterAchievementStatistics(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Appearance API

    /**
     Returns a summary of a character's appearance settings.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterAppearanceSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterAppearanceSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Equipment API

    /**
     Returns a summary of the items equipped by a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterEquipmentSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterEquipmentSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Hunter Pets API

    /**
     Returns a summary of a hunter's pets.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterHunterPetsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterHunterPetsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Media API

    /**
     Returns a summary of the media assets for a character (portrait, render, etc.).

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMediaSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterMediaSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Profile API

    /**
     Returns a profile summary for a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterProfileSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterProfileSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }


    /**
     Returns the status and a unique ID for a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterProfileStatus(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterProfileStatus(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character PvP API

    /**
     Returns the PvP bracket statistics for a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter pvpBracket: The PvP bracket.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterPvPBracketStatistics(characterName: String, realmSlug: String, pvpBracket: WOWLeaderboardBracket, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterPvPBracketStatistics(realmSlug: realmSlug, characterName: characterName, pvpBracket: pvpBracket), namespace: namespace)
    }


    /**
     Returns a PvP summary for a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterPvPSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterPvPSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Specializations API

    /**
     Returns a summary of a character's specializations.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterSpecializationsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterSpecializationsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Character Statistics API

    /**
     Returns a statistics summary for a character.

     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterStatisticsSummary(characterName: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.characterStatisticsSummary(realmSlug: realmSlug, characterName: characterName), namespace: namespace)
    }



    // MARK: Guild Profile API

    /**
     Returns a single guild by its name and realm.

     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuild(slug: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.guild(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }


    /**
     Returns a stream of daily updates for a guild.

     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildActivity(slug: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.guildActivity(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }


    /**
     Returns a summary of the achievements earned by the members of the specified guild.

     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildAchievements(slug: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.guildAchievements(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }


    /**
     Returns a roster of the specified guild.

     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildRoster(slug: String, realmSlug: String, namespace: APINamespace? = .profileClassic) async throws -> Data {
        return try await call(endpoint: API.guildRoster(realmSlug: realmSlug, guildSlug: slug), namespace: namespace)
    }
}
