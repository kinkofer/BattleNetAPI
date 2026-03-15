//
//  WS_WorldOfWarcraft+Profile+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_WorldOfWarcraft {
    // MARK: - Profile API
    
    // MARK: Character Collections API
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getCharacterCollections(characterName: String, realmSlug: String, namespace: APINamespace? = nil) async throws -> [WOWCharacter] {
        let data = try await webService.getCharacterCollectionsIndex(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
        return try WOWCharacterResult.decode(from: data).characters
    }
    
    
    // MARK: Character Mythic Keystone Profile API
    
    /**
     Returns a Mythic Keystone Profile index for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMythicKeystoneProfile(characterName: String, realmSlug: String) async throws -> MythicKeystoneProfile {
        let data = try await webService.getCharacterMythicKeystoneProfileIndex(characterName: characterName, realmSlug: realmSlug)
        return try MythicKeystoneProfile.decode(from: data)
    }
    
    
    /**
     Returns the Mythic Keystone season details for a character.

     - note: Returns a 404 Not Found for characters that have not yet completed a Mythic Keystone dungeon for the specified season.
     
     - parameter seasonID: The ID of the Mythic Keystone season.
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String) async throws -> MythicKeystoneProfileSeason {
        let data = try await webService.getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug)
        return try MythicKeystoneProfileSeason.decode(from: data)
    }
    
    
    // MARK: Character Profile API
    
    /**
     Returns a profile summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getCharacter(characterName: String, realmSlug: String) async throws -> WOWCharacterProfile {
        let data = try await webService.getCharacterProfileSummary(characterName: characterName, realmSlug: realmSlug)
        return try WOWCharacterProfile.decode(from: data)
    }
    
    
    // MARK: Guild Profile API
    
    /**
     Returns a single guild by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuild(slug: String, realmSlug: String) async throws -> WOWGuildProfile {
        let data = try await webService.getGuild(slug: slug, realmSlug: realmSlug)
        return try WOWGuildProfile.decode(from: data)
    }
}
