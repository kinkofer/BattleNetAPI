//
//  WS_WorldOfWarcraft+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_WorldOfWarcraft {
    // MARK: - Profile API
    
    /**
     Returns an index of collection types for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [WOWCharacter] if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getCharacterCollections(characterName:realmSlug:namespace:)")
    public func getCharacterCollections(characterName: String, realmSlug: String, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<[WOWCharacter], Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterCollections(characterName: characterName, realmSlug: realmSlug, namespace: namespace)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
    
    
    // MARK: - WoW Mythic Keystone Character Profile API
    
    /**
     Returns a Mythic Keystone Profile index for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystoneProfile if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterMythicKeystoneProfile(characterName:realmSlug:)")
    public func getCharacterMythicKeystoneProfile(characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfile, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMythicKeystoneProfile(characterName: characterName, realmSlug: realmSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the MythicKeystoneProfileSeason if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacterMythicKeystoneProfileSeason(seasonID:characterName:realmSlug:)")
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfileSeason, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
    
    
    
    // MARK: - Connected Realm API
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [Link<ConnectedRealm>] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConnectedRealmIndex()")
    public func getConnectedRealmIndex(completion: @escaping (_ result: Result<[Link<ConnectedRealm>], Error>) -> Void) {
        Task {
            do {
                let result = try await getConnectedRealmIndex()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of connected realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealmIndex() async throws -> [Link<ConnectedRealm>] {
        let data = try await webService.getConnectedRealmIndex()
        return try ConnectedRealmIndex.decode(from: data).connectedRealms
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the ConnectedRealm if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getConnectedRealm(id:)")
    public func getConnectedRealm(id: Int, completion: @escaping (_ result: Result<ConnectedRealm, Error>) -> Void) {
        Task {
            do {
                let result = try await getConnectedRealm(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a connected realm by ID.
     
     - parameter id: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getConnectedRealm(id: Int) async throws -> ConnectedRealm {
        let data = try await webService.getConnectedRealm(id: id)
        return try ConnectedRealm.decode(from: data)
    }
    
    
    
    // MARK: - Mythic Keystone Affix API
    
    /**
     Returns an index of mythic keystone affixes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the KeystoneAffixIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneAffixes()")
    public func getMythicKeystoneAffixes(completion: @escaping (_ result: Result<KeystoneAffixIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneAffixes()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of mythic keystone affixes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneAffixes() async throws -> KeystoneAffixIndex {
        let data = try await webService.getMythicKeystoneAffixIndex()
        return try KeystoneAffixIndex.decode(from: data)
    }
    
    
    /**
     Returns a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the KeystoneAffix if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneAffix(id:)")
    public func getMythicKeystoneAffix(id: Int, completion: @escaping (_ result: Result<KeystoneAffix, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneAffix(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a mythic keystone affix by ID.
     
     - parameter id: The ID of the mythic keystone affix.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneAffix(id: Int) async throws -> KeystoneAffix {
        let data = try await webService.getMythicKeystoneAffix(id: id)
        return try KeystoneAffix.decode(from: data)
    }
    
    
    // MARK: - Mythic Raid Leaderboard API
    
    /**
     Returns the leaderboard for a given raid and faction.
     
     - parameter raid: The raid for a leaderboard
     - parameter faction: Player faction ('alliance' or 'horde')
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicRaidLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicRaidLeaderboard(raid:faction:)")
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, completion: @escaping (_ result: Result<MythicRaidLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicRaidLeaderboard(raid: raid, faction: faction)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the leaderboard for a given raid and faction.
     
     - parameter raid: The raid for a leaderboard
     - parameter faction: Player faction ('alliance' or 'horde')
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType) async throws -> MythicRaidLeaderboard {
        let data = try await webService.getMythicRaidLeaderboard(raid: raid, faction: faction)
        return try MythicRaidLeaderboard.decode(from: data)
    }
    
    
    // MARK: - Mythic Keystone Dungeon API
    
    /**
     Returns an index of Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystoneDungeonIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneDungeons()")
    public func getMythicKeystoneDungeons(completion: @escaping (_ result: Result<MythicKeystoneDungeonIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneDungeons()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneDungeons() async throws -> MythicKeystoneDungeonIndex {
        let data = try await webService.getMythicKeystoneDungeonIndex()
        return try MythicKeystoneDungeonIndex.decode(from: data)
    }
    
    
    /**
     Returns a Mythic Keystone dungeon by ID.
     
     - parameter id: The ID of the dungeon.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystoneDungeon if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneDungeon(id:)")
    public func getMythicKeystoneDungeon(id: Int, completion: @escaping (_ result: Result<MythicKeystoneDungeon, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneDungeon(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone dungeon by ID.
     
     - parameter id: The ID of the dungeon.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneDungeon(id: Int) async throws -> MythicKeystoneDungeon {
        let data = try await webService.getMythicKeystoneDungeon(id: id)
        return try MythicKeystoneDungeon.decode(from: data)
    }
    
    
    /**
     Returns an index of links to other documents related to Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystoneIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystones()")
    public func getMythicKeystones(completion: @escaping (_ result: Result<MythicKeystoneIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystones()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of links to other documents related to Mythic Keystone dungeons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystones() async throws -> MythicKeystoneIndex {
        let data = try await webService.getMythicKeystoneIndex()
        return try MythicKeystoneIndex.decode(from: data)
    }
    
    
    /**
     Returns an index of Mythic Keystone periods.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystonePeriodIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystonePeriods()")
    public func getMythicKeystonePeriods(completion: @escaping (_ result: Result<MythicKeystonePeriodIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystonePeriods()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone periods.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystonePeriods() async throws -> MythicKeystonePeriodIndex {
        let data = try await webService.getMythicKeystonePeriodIndex()
        return try MythicKeystonePeriodIndex.decode(from: data)
    }
    
    
    /**
     Returns a Mythic Keystone period by ID.
     
     - parameter id: The ID of the Mythic Keystone season period.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystonePeriod if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystonePeriod(id:)")
    public func getMythicKeystonePeriod(id: Int, completion: @escaping (_ result: Result<MythicKeystonePeriod, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystonePeriod(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone period by ID.
     
     - parameter id: The ID of the Mythic Keystone season period.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystonePeriod(id: Int) async throws -> MythicKeystonePeriod {
        let data = try await webService.getMythicKeystonePeriod(id: id)
        return try MythicKeystonePeriod.decode(from: data)
    }
    
    
    /**
     Returns an index of Mythic Keystone seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneSeasons()")
    public func getMythicKeystoneSeasons(completion: @escaping (_ result: Result<MythicKeystoneSeasonIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneSeasons()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone seasons.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneSeasons() async throws -> MythicKeystoneSeasonIndex {
        let data = try await webService.getMythicKeystoneSeasonIndex()
        return try MythicKeystoneSeasonIndex.decode(from: data)
    }
    
    
    /**
     Returns a Mythic Keystone season by ID.
     
     - parameter id: The ID of the Mythic Keystone season.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicKeystoneSeason if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicKeystoneSeason(id:)")
    public func getMythicKeystoneSeason(id: Int, completion: @escaping (_ result: Result<MythicKeystoneSeason, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicKeystoneSeason(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a Mythic Keystone season by ID.
     
     - parameter id: The ID of the Mythic Keystone season.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicKeystoneSeason(id: Int) async throws -> MythicKeystoneSeason {
        let data = try await webService.getMythicKeystoneSeason(id: id)
        return try MythicKeystoneSeason.decode(from: data)
    }
    
    
    // MARK: - Mythic Keystone Leaderboard API
    
    /**
     Returns an index of Mythic Keystone Leaderboard dungeon instances for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicLeaderboardIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicLeaderboards(connectedRealmID:)")
    public func getMythicLeaderboards(connectedRealmID: Int, completion: @escaping (_ result: Result<MythicLeaderboardIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicLeaderboards(connectedRealmID: connectedRealmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of Mythic Keystone Leaderboard dungeon instances for a connected realm.
     
     - parameter connectedRealmID: The ID of the connected realm
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicLeaderboards(connectedRealmID: Int) async throws -> MythicLeaderboardIndex {
        let data = try await webService.getMythicLeaderboardIndex(connectedRealmID: connectedRealmID)
        return try MythicLeaderboardIndex.decode(from: data)
    }
    
    
    /**
     Returns a weekly Mythic Keystone Leaderboard by period.
     
     - parameter connectedRealmID: The id of the connected realm
     - parameter dungeonID: The id of the dungeon
     - parameter period: The unique identifier for the leaderboard period
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the MythicLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMythicLeaderboard(connectedRealmID:dungeonID:period:)")
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, completion: @escaping (_ result: Result<MythicLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a weekly Mythic Keystone Leaderboard by period.
     
     - parameter connectedRealmID: The id of the connected realm
     - parameter dungeonID: The id of the dungeon
     - parameter period: The unique identifier for the leaderboard period
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int) async throws -> MythicLeaderboard {
        let data = try await webService.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period)
        return try MythicLeaderboard.decode(from: data)
    }
    
    
    
    // MARK: - Playable Class API
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWClassIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClasses()")
    public func getPlayableClasses(completion: @escaping (_ result: Result<WOWClassIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClasses()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClasses() async throws -> WOWClassIndex {
        let data = try await webService.getPlayableClassIndex()
        return try WOWClassIndex.decode(from: data)
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWClass if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClass(id:)")
    public func getPlayableClass(id: Int, completion: @escaping (_ result: Result<WOWClass, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClass(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable class by ID.
     
     - parameter id: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClass(id: Int) async throws -> WOWClass {
        let data = try await webService.getPlayableClass(id: id)
        return try WOWClass.decode(from: data)
    }
    
    
    /**
     Returns the PvP talent slots for a playable class by ID.
     
     - parameter classID: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the PVPTalentSlots if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableClassPvPTalentSlots(classID:)")
    public func getPlayableClassPvPTalentSlots(classID: Int, completion: @escaping (_ result: Result<PVPTalentSlots, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableClassPvPTalentSlots(classID: classID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the PvP talent slots for a playable class by ID.
     
     - parameter classID: The ID of the playable class.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableClassPvPTalentSlots(classID: Int) async throws -> PVPTalentSlots {
        let data = try await webService.getPlayableClassPvPTalentSlots(classID: classID)
        return try PVPTalentSlots.decode(from: data)
    }
    
    
    
    // MARK: - Playable Specialization API
    
    /**
     Returns an index of playable specializations.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the SpecializationIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableSpecializations()")
    public func getPlayableSpecializations(completion: @escaping (_ result: Result<SpecializationIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableSpecializations()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable specializations.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableSpecializations() async throws -> SpecializationIndex {
        let data = try await webService.getPlayableSpecializationIndex()
        return try SpecializationIndex.decode(from: data)
    }
    
    
    /**
     Returns a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Specialization if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableSpecialization(id:)")
    public func getPlayableSpecialization(id: Int, completion: @escaping (_ result: Result<Specialization, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableSpecialization(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable specialization by ID.
     
     - parameter id: The ID of the playable specialization.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableSpecialization(id: Int) async throws -> Specialization {
        let data = try await webService.getPlayableSpecialization(id: id)
        return try Specialization.decode(from: data)
    }
    
    
    
    // MARK: - Power Type API
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the PowerTypeIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPowerTypes()")
    public func getPowerTypes(completion: @escaping (_ result: Result<PowerTypeIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getPowerTypes()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of power types.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerTypes() async throws -> PowerTypeIndex {
        let data = try await webService.getPowerTypeIndex()
        return try PowerTypeIndex.decode(from: data)
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the PowerType if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPowerType(id:)")
    public func getPowerType(id: Int, completion: @escaping (_ result: Result<PowerType, Error>) -> Void) {
        Task {
            do {
                let result = try await getPowerType(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a power type by ID.
     
     - parameter id: The ID of the power type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPowerType(id: Int) async throws -> PowerType {
        let data = try await webService.getPowerType(id: id)
        return try PowerType.decode(from: data)
    }
    
    
    // MARK: - Playable Race API
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWRaceIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableRaces()")
    public func getPlayableRaces(completion: @escaping (_ result: Result<WOWRaceIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableRaces()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRaces() async throws -> WOWRaceIndex {
        let data = try await webService.getPlayableRaceIndex()
        return try WOWRaceIndex.decode(from: data)
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWRace if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayableRace(id:)")
    public func getPlayableRace(id: Int, completion: @escaping (_ result: Result<WOWRace, Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayableRace(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a playable race by ID.
     
     - parameter id: The ID of the playable race.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPlayableRace(id: Int) async throws -> WOWRace {
        let data = try await webService.getPlayableRace(id: id)
        return try WOWRace.decode(from: data)
    }
    
    
    
    // MARK: - Realm API
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [RealmIndex] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRealmIndex()")
    public func getRealmIndex(completion: @escaping (_ result: Result<[RealmIndex], Error>) -> Void) {
        Task {
            do {
                let result = try await getRealmIndex()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of realms.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealmIndex() async throws -> [RealmIndex] {
        let data = try await webService.getRealmIndex()
        return try RealmIndexResult.decode(from: data).realms
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Realm if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRealm(id:slug:)")
    public func getRealm(id: Int? = nil, slug: String? = nil, completion: @escaping (_ result: Result<Realm, Error>) -> Void) {
        Task {
            do {
                let result = try await getRealm(id: id, slug: slug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single realm by slug or ID.
     
     - parameter slug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRealm(id: Int? = nil, slug: String? = nil) async throws -> Realm {
        guard let realmSlug = id.map({ String($0) }) ?? slug else {
            throw HTTPError.unexpectedBody
        }
        
        let data = try await webService.getRealm(realmSlug)
        return try Realm.decode(from: data)
    }
    
    
    
    // MARK: - Region API
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [Link<Region>] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRegionIndex()")
    public func getRegionIndex(completion: @escaping (_ result: Result<[Link<Region>], Error>) -> Void) {
        Task {
            do {
                let result = try await getRegions()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of regions.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegions() async throws -> [Link<Region>] {
        let data = try await webService.getRegionIndex()
        return try RegionIndexResult.decode(from: data).regions
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Region if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRegion(id:)")
    public func getRegion(id: Int, completion: @escaping (_ result: Result<Region, Error>) -> Void) {
        Task {
            do {
                let result = try await getRegion(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a region by ID.
     
     - parameter id: The ID of the region.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRegion(id: Int) async throws -> Region {
        let data = try await webService.getRegion(id: id)
        return try Region.decode(from: data)
    }
    
    
    
    // MARK: - Token API
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the TokenIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTokens()")
    public func getTokens(completion: @escaping (_ result: Result<TokenIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getTokens()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the WoW Token index.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTokens() async throws -> TokenIndex {
        let data = try await webService.getTokenIndex()
        return try TokenIndex.decode(from: data)
    }
    
    
    
    // MARK: - Achievement API
    
    /**
     Returns an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWAchievement if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievement(id:)")
    public func getAchievement(id: Int, completion: @escaping (_ result: Result<WOWAchievement, Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievement(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an achievement by ID.
     
     - parameter id: The ID of the achievement.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievement(id: Int) async throws -> WOWAchievement {
        let data = try await webService.getAchievement(id: id)
        return try WOWAchievement.decode(from: data)
    }
    
    
    
    // MARK: - Auction API
    
    /**
     Returns all active auctions for a connected realm.
     
     Auction house data updates at a set interval. The value was initially set at 1 hour; however, it might change over time without notice.
     
     Depending on the number of active auctions on the specified connected realm, the response from this endpoint may be rather large, sometimes exceeding 10 MB.
     
     - SeeAlso: See the Connected Realm API for information about retrieving a list of connected realm IDs.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Auction if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getAuctions(connectedRealmID:)")
    public func getAuctions(connectedRealmID: Int, completion: @escaping (_ result: Result<Auction, Error>) -> Void) {
        Task {
            do {
                let result = try await getAuctions(connectedRealmID: connectedRealmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns all active auctions for a connected realm.
     
     Auction house data updates at a set interval. The value was initially set at 1 hour; however, it might change over time without notice.
     
     Depending on the number of active auctions on the specified connected realm, the response from this endpoint may be rather large, sometimes exceeding 10 MB.
     
     - SeeAlso: See the Connected Realm API for information about retrieving a list of connected realm IDs.
     
     - parameter connectedRealmID: The ID of the connected realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getAuctions(connectedRealmID: Int) async throws -> Auction {
        let data = try await webService.getAuctions(connectedRealmID: connectedRealmID)
        return try Auction.decode(from: data)
    }
    
    
    
    // MARK: - Character Profile API
    
    /**
     Returns a profile summary for a character.
     
     - parameter characterName: The lowercase name of the character.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWCharacterProfile if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getCharacter(characterName:realmSlug:)")
    public func getCharacter(characterName: String, realmSlug: String, completion: @escaping (_ result: Result<WOWCharacterProfile, Error>) -> Void) {
        Task {
            do {
                let result = try await getCharacter(characterName: characterName, realmSlug: realmSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
    
    
    
    // MARK: - Guild Profile API
    
    /**
     Returns a single guild by its name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWGuildProfile if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuild(slug:realmSlug:)")
    public func getGuild(slug: String, realmSlug: String, completion: @escaping (_ result: Result<WOWGuildProfile, Error>) -> Void) {
        Task {
            do {
                let result = try await getGuild(slug: slug, realmSlug: realmSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
    
    
    
    // MARK: - Item API
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWItem if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItem(id:)")
    public func getItem(id: Int, completion: @escaping (_ result: Result<WOWItem, Error>) -> Void) {
        Task {
            do {
                let result = try await getItem(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item by ID.
     
     - parameter id: The ID of the item.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItem(id: Int) async throws -> WOWItem {
        let data = try await webService.getItem(id: id)
        return try WOWItem.decode(from: data)
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWItemSet if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemSet(id:)")
    public func getItemSet(id: Int, completion: @escaping (_ result: Result<WOWItemSet, Error>) -> Void) {
        Task {
            do {
                let result = try await getItemSet(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an item set by ID.
     
     - parameter id: The ID of the item set.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemSet(id: Int) async throws -> WOWItemSet {
        let data = try await webService.getItemSet(id: id)
        return try WOWItemSet.decode(from: data)
    }
    
    
    
    // MARK: - Mount API
    
    /**
     Returns an index of mounts.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [Mount] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getMounts()")
    public func getMounts(completion: @escaping (_ result: Result<[Mount], Error>) -> Void) {
        Task {
            do {
                let result = try await getMounts()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of mounts.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getMounts() async throws -> [Mount] {
        let data = try await webService.getMountIndex()
        return try MountIndex.decode(from: data).mounts
    }
    
    
    
    // MARK: - Pet API
    
    /**
     Returns an index of battle pets.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [Pet] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPets()")
    public func getPets(completion: @escaping (_ result: Result<[Pet], Error>) -> Void) {
        Task {
            do {
                let result = try await getPets()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of battle pets.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPets() async throws -> [Pet] {
        let data = try await webService.getPetIndex()
        return try PetIndex.decode(from: data).pets
    }
    
    
    /**
     Returns a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the PetAbility if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPetAbility(id:)")
    public func getPetAbility(id: Int, completion: @escaping (_ result: Result<PetAbility, Error>) -> Void) {
        Task {
            do {
                let result = try await getPetAbility(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a pet ability by ID.
     
     - parameter id: The ID of the pet ability.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPetAbility(id: Int) async throws -> PetAbility {
        let data = try await webService.getPetAbility(id: id)
        return try PetAbility.decode(from: data)
    }
    
    
    
    
    // MARK: - PvP API
    
    /**
     Returns the PvP leaderboard of a specific PvP bracket for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPvPLeaderboard(season:bracket:)")
    public func getPvPLeaderboard(season: Int, bracket: WOWLeaderboardBracket, completion: @escaping (_ result: Result<WOWLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getPvPLeaderboard(season: season, bracket: bracket)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the PvP leaderboard of a specific PvP bracket for a PvP season.
     
     - parameter pvpSeasonID: The ID of the PvP season.
     - parameter pvpBracket: The PvP bracket type.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getPvPLeaderboard(season: Int, bracket: WOWLeaderboardBracket) async throws -> WOWLeaderboard {
        let data = try await webService.getPvPLeaderboard(pvpSeasonID: season, pvpBracket: bracket)
        return try WOWLeaderboard.decode(from: data)
    }
    
    
    
    // MARK: - Quest API
    
    /**
     Returns a quest by ID.
     
     - parameter id: The ID of the quest.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWQuest if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getQuest(id:)")
    public func getQuest(id: Int, completion: @escaping (_ result: Result<WOWQuest, Error>) -> Void) {
        Task {
            do {
                let result = try await getQuest(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a quest by ID.
     
     - parameter id: The ID of the quest.
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getQuest(id: Int) async throws -> WOWQuest {
        let data = try await webService.getQuest(id: id)
        return try WOWQuest.decode(from: data)
    }
    
    
    
    // MARK: - Recipe API
    
    /**
     Returns a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the WOWRecipe if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRecipe(id:)")
    public func getRecipe(id: Int, completion: @escaping (_ result: Result<WOWRecipe, Error>) -> Void) {
        Task {
            do {
                let result = try await getRecipe(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a recipe by ID.
     
     - parameter id: The ID of the recipe.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRecipe(id: Int) async throws -> WOWRecipe {
        let data = try await webService.getRecipe(id: id)
        return try WOWRecipe.decode(from: data)
    }
    
    
    
    // MARK: - Spell API
    
    /**
     Returns a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the Spell if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSpell(id:)")
    public func getSpell(id: Int, completion: @escaping (_ result: Result<Spell, Error>) -> Void) {
        Task {
            do {
                let result = try await getSpell(id: id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a spell by ID.
     
     - parameter id: The ID of the spell.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getSpell(id: Int) async throws -> Spell {
        let data = try await webService.getSpell(id: id)
        return try Spell.decode(from: data)
    }
    
    
    
    // MARK: - Data Resources
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [Race] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRaces()")
    public func getRaces(completion: @escaping (_ result: Result<[Race], Error>) -> Void) {
        Task {
            do {
                let result = try await getRaces()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable races.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getRaces() async throws -> [Race] {
        let data = try await webService.getPlayableRaceIndex()
        return try RaceIndex.decode(from: data).races
    }
    
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [WOWCharacterClass] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getClasses()")
    public func getClasses(completion: @escaping (_ result: Result<[WOWCharacterClass], Error>) -> Void) {
        Task {
            do {
                let result = try await getClasses()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of playable classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getClasses() async throws -> [WOWCharacterClass] {
        let data = try await webService.getPlayableClassIndex()
        return try WOWCharacterClassIndex.decode(from: data).classes
    }
    
    
    /**
     Returns an index of achievements.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [WOWAchievementCategory] if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getAchievements()")
    public func getAchievements(completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        Task {
            do {
                let result = try await getAchievements()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of achievements.
     
     - parameter namespace: The namespace to use to locate this document.
    */
    public func getAchievements() async throws -> [WOWAchievementCategory] {
        let data = try await webService.getAchievementIndex()
        return try WOWAchievementIndex.decode(from: data).achievements
    }
    
    
    /**
     Returns a single guild's achievements by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [WOWAchievementCategory] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGuildAchievements(slug:realmSlug:)")
    public func getGuildAchievements(slug: String, realmSlug: String, completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        Task {
            do {
                let result = try await getGuildAchievements(slug: slug, realmSlug: realmSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a single guild's achievements by name and realm.
     
     - parameter slug: The slug of the guild.
     - parameter realmSlug: The slug of the realm.
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getGuildAchievements(slug: String, realmSlug: String) async throws -> [WOWAchievementCategory] {
        let data = try await webService.getGuildAchievements(slug: slug, realmSlug: realmSlug)
        return try WOWAchievementIndex.decode(from: data).achievements
    }
    
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the [ItemClass] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemClasses()")
    public func getItemClasses(completion: @escaping (_ result: Result<[ItemClass], Error>) -> Void) {
        Task {
            do {
                let result = try await getItemClasses()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of item classes.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getItemClasses() async throws -> [ItemClass] {
        let data = try await webService.getItemClassIndex()
        return try ItemClassIndex.decode(from: data).classes
    }
    
    
    /**
     Returns an index of talents.
     
     - parameter namespace: The namespace to use to locate this document.
     - parameter completion: Returns a Result with the ClassTalentDictionary if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getTalents()")
    public func getTalents(completion: @escaping (_ result: Result<ClassTalentDictionary, Error>) -> Void) {
        Task {
            do {
                let result = try await getTalents()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns an index of talents.
     
     - parameter namespace: The namespace to use to locate this document.
     */
    public func getTalents() async throws -> ClassTalentDictionary {
        let data = try await webService.getTalentIndex()
        return try ClassTalentDictionary.decode(from: data)
    }
}
