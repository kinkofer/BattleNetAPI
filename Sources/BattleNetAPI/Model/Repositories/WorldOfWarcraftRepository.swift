//
//  WorldOfWarcraftRepository.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WorldOfWarcraftRepository {
    let battleNetAPI: BattleNetAPI
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    /// Calls a web service identicated by the href in a Link object.
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        battleNetAPI.resource.getResource(from: resourceLink.href, apiType: .gameData, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Profile API
    
    public func getCharacterCollections(characterName: String, realmSlug: String, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<[WOWCharacter], Error>) -> Void) {
        battleNetAPI.wow.getCharacterCollectionsIndex(characterName: characterName, realmSlug: realmSlug, namespace: namespace) { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacter]) = { data in
                return try WOWCharacterResult.decode(from: data).characters
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    // MARK: - WoW Mythic Keystone Character Profile API
    
    public func getCharacterMythicKeystoneProfile(characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfile, Error>) -> Void) {
        battleNetAPI.wow.getCharacterMythicKeystoneProfileIndex(characterName: characterName, realmSlug: realmSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getCharacterMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfileSeason, Error>) -> Void) {
        battleNetAPI.wow.getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Connected Realm API
    
    public func getConnectedRealmIndex(completion: @escaping (_ result: Result<[Link<ConnectedRealm>], Error>) -> Void) {
        battleNetAPI.wow.getConnectedRealmIndex { result in
            let customDecode: ((_ data: Data) throws -> [Link<ConnectedRealm>]) = { data in
                return try ConnectedRealmIndex.decode(from: data).connectedRealms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getConnectedRealm(id: Int, completion: @escaping (_ result: Result<ConnectedRealm, Error>) -> Void) {
        battleNetAPI.wow.getConnectedRealm(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Mythic Keystone Affix API
    
    public func getMythicKeystoneAffixes(completion: @escaping (_ result: Result<KeystoneAffixIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneAffixIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystoneAffix(id: Int, completion: @escaping (_ result: Result<KeystoneAffix, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneAffix(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    // MARK: - Mythic Raid Leaderboard API
    
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, completion: @escaping (_ result: Result<MythicRaidLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction, completion: { $0.decode(completion: completion) })
    }
    
    
    // MARK: - Mythic Keystone Dungeon API
    
    public func getMythicKeystoneDungeons(completion: @escaping (_ result: Result<MythicKeystoneDungeonIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneDungeonIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystoneDungeon(id: Int, completion: @escaping (_ result: Result<MythicKeystoneDungeon, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneDungeon(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystones(completion: @escaping (_ result: Result<MythicKeystoneIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystonePeriods(completion: @escaping (_ result: Result<MythicKeystonePeriodIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystonePeriodIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystonePeriod(id: Int, completion: @escaping (_ result: Result<MythicKeystonePeriod, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystonePeriod(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystoneSeasons(completion: @escaping (_ result: Result<MythicKeystoneSeasonIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneSeasonIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicKeystoneSeason(id: Int, completion: @escaping (_ result: Result<MythicKeystoneSeason, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneSeason(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    // MARK: - Mythic Keystone Leaderboard API
    
    public func getMythicLeaderboards(connectedRealmID: Int, completion: @escaping (_ result: Result<MythicLeaderboardIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicLeaderboardIndex(connectedRealmID: connectedRealmID, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, completion: @escaping (_ result: Result<MythicLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Playable Class API
    
    public func getPlayableClasses(completion: @escaping (_ result: Result<WOWClassIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClassIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getPlayableClass(id: Int, completion: @escaping (_ result: Result<WOWClass, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClass(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getPlayableClassPvPTalentSlots(classID: Int, completion: @escaping (_ result: Result<PVPTalentSlots, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClassPvPTalentSlots(classID: classID, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Playable Specialization API
    
    public func getPlayableSpecializations(completion: @escaping (_ result: Result<SpecializationIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableSpecializationIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getPlayableSpecialization(id: Int, completion: @escaping (_ result: Result<Specialization, Error>) -> Void) {
        battleNetAPI.wow.getPlayableSpecialization(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Power Type API
    
    public func getPowerTypes(completion: @escaping (_ result: Result<PowerTypeIndex, Error>) -> Void) {
        battleNetAPI.wow.getPowerTypeIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getPowerType(id: Int, completion: @escaping (_ result: Result<PowerType, Error>) -> Void) {
        battleNetAPI.wow.getPowerType(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    // MARK: - Playable Race API
    
    public func getPlayableRaces(completion: @escaping (_ result: Result<WOWRaceIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableRaceIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getPlayableRace(id: Int, completion: @escaping (_ result: Result<WOWRace, Error>) -> Void) {
        battleNetAPI.wow.getPlayableRace(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Realm API
    
    public func getRealmIndex(completion: @escaping (_ result: Result<[RealmIndex], Error>) -> Void) {
        battleNetAPI.wow.getRealmIndex { result in
            let customDecode: ((_ data: Data) throws -> [RealmIndex]) = { data in
                return try RealmIndexResult.decode(from: data).realms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRealm(id: Int? = nil, slug: String? = nil, completion: @escaping (_ result: Result<Realm, Error>) -> Void) {
        guard (id != nil || slug != nil) else {
            completion(.failure(HTTPError.unexpectedBody))
            return
        }
        
        let realmSlug: String!
        
        if let id = id {
            realmSlug = String(id)
        }
        else {
            realmSlug = slug!
        }
        
        battleNetAPI.wow.getRealm(realmSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Region API
    
    public func getRegionIndex(completion: @escaping (_ result: Result<[Link<Region>], Error>) -> Void) {
        battleNetAPI.wow.getRegionIndex { result in
            let customDecode: ((_ data: Data) throws -> [Link<Region>]) = { data in
                return try RegionIndexResult.decode(from: data).regions
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRegion(id: Int, completion: @escaping (_ result: Result<Region, Error>) -> Void) {
        battleNetAPI.wow.getRegion(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Token API
    
    public func getTokenIndex(completion: @escaping (_ result: Result<TokenIndex, Error>) -> Void) {
        battleNetAPI.wow.getTokenIndex(completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Achievement API
    
    public func getAchievement(id: Int, completion: @escaping (_ result: Result<WOWAchievement, Error>) -> Void) {
        battleNetAPI.wow.getAchievement(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Auction API
    
    public func getAuctions(connectedRealmID: Int, completion: @escaping (_ result: Result<Auction, Error>) -> Void) {
        battleNetAPI.wow.getAuctions(connectedRealmID: connectedRealmID, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Character Profile API
    
    public func getCharacter(characterName: String, realmSlug: String, completion: @escaping (_ result: Result<WOWCharacterProfile, Error>) -> Void) {
        battleNetAPI.wow.getCharacterProfileSummary(characterName: characterName, realmSlug: realmSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Guild Profile API
    
    public func getGuild(slug: String, realmSlug: String, completion: @escaping (_ result: Result<WOWGuildProfile, Error>) -> Void) {
        battleNetAPI.wow.getGuild(slug: slug, realmSlug: realmSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Item API
    
    public func getItem(id: Int, completion: @escaping (_ result: Result<WOWItem, Error>) -> Void) {
        battleNetAPI.wow.getItem(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getItemSet(id: Int, completion: @escaping (_ result: Result<WOWItemSet, Error>) -> Void) {
        battleNetAPI.wow.getItemSet(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Mount API
    
    public func getMounts(completion: @escaping (_ result: Result<[Mount], Error>) -> Void) {
        battleNetAPI.wow.getMountIndex { result in
            let customDecode: ((_ data: Data) throws -> [Mount]) = { data in
                return try MountIndex.decode(from: data).mounts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Pet API
    
    public func getPets(completion: @escaping (_ result: Result<[Pet], Error>) -> Void) {
        battleNetAPI.wow.getPetIndex { result in
            let customDecode: ((_ data: Data) throws -> [Pet]) = { data in
                return try PetIndex.decode(from: data).pets
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getPetAbility(id: Int, completion: @escaping (_ result: Result<PetAbility, Error>) -> Void) {
        battleNetAPI.wow.getPetAbility(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    
    // MARK: - PvP API
    
    public func getPvPLeaderboard(season: Int, bracket: WOWLeaderboardBracket, completion: @escaping (_ result: Result<WOWLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getPvPLeaderboard(pvpSeasonID: season, pvpBracket: bracket, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Quest API
    
    public func getQuest(id: Int, completion: @escaping (_ result: Result<WOWQuest, Error>) -> Void) {
        battleNetAPI.wow.getQuest(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Realm Status API
    
    public func getRealmsStatus(completion: @escaping (_ result: Result<[WOWRealm], Error>) -> Void) {
//        battleNetAPI.wow.getstatus { result in
//            let customDecode: ((_ data: Data) throws -> [WOWRealm]) = { data in
//                return try WOWRealmIndex.decode(from: data).realms
//            }
//            result.decode(customDecode: customDecode, completion: completion)
//        }
    }
    
    
    
    // MARK: - Recipe API
    
    public func getRecipe(id: Int, completion: @escaping (_ result: Result<WOWRecipe, Error>) -> Void) {
        battleNetAPI.wow.getRecipe(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Spell API
    
    public func getSpell(id: Int, completion: @escaping (_ result: Result<Spell, Error>) -> Void) {
        battleNetAPI.wow.getSpell(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Data Resources
    
    public func getRaces(completion: @escaping (_ result: Result<[Race], Error>) -> Void) {
        battleNetAPI.wow.getPlayableRaceIndex { result in
            let customDecode: ((_ data: Data) throws -> [Race]) = { data in
                return try RaceIndex.decode(from: data).races
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getClasses(completion: @escaping (_ result: Result<[WOWCharacterClass], Error>) -> Void) {
        battleNetAPI.wow.getPlayableClassIndex { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacterClass]) = { data in
                return try WOWCharacterClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getAchievements(completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        battleNetAPI.wow.getAchievementIndex { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildAchievements(slug: String, realmSlug: String, completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        battleNetAPI.wow.getGuildAchievements(slug: slug, realmSlug: realmSlug) { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getItemClasses(completion: @escaping (_ result: Result<[ItemClass], Error>) -> Void) {
        battleNetAPI.wow.getItemClassIndex { result in
            let customDecode: ((_ data: Data) throws -> [ItemClass]) = { data in
                return try ItemClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getTalents(completion: @escaping (_ result: Result<ClassTalentDictionary, Error>) -> Void) {
        battleNetAPI.wow.getTalentIndex(completion: { $0.decode(completion: completion) })
    }
}
