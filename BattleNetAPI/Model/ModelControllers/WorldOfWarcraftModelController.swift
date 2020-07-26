//
//  WorldOfWarcraftModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WorldOfWarcraftModelController {
    let battleNetAPI: BattleNetAPI
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    /// Calls a web service identicated by the href in a Link object.
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        battleNetAPI.resource.getResource(from: resourceLink.href, apiType: .gameData) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Profile API
    
    public func getCharacters(completion: @escaping (_ result: Result<[WOWCharacter], Error>) -> Void) {
        battleNetAPI.wow.getCharacters { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacter]) = { data in
                return try WOWCharacterResult.decode(from: data).characters
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    // MARK: - WoW Mythic Keystone Character Profile API
    
    public func getMythicKeystoneProfile(characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfile, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneProfile(characterName: characterName, realmSlug: realmSlug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, completion: @escaping (_ result: Result<MythicKeystoneProfileSeason, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug) { result in
            result.decode(completion: completion)
        }
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
        battleNetAPI.wow.getConnectedRealm(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mythic Keystone Affix API
    
    public func getMythicKeystoneAffixes(completion: @escaping (_ result: Result<KeystoneAffixIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneAffixes { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneAffix(id: Int, completion: @escaping (_ result: Result<KeystoneAffix, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneAffix(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Raid Leaderboard API
    
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, completion: @escaping (_ result: Result<MythicRaidLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Keystone Dungeon API
    
    public func getMythicKeystoneDungeons(completion: @escaping (_ result: Result<MythicKeystoneDungeonIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneDungeons { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneDungeon(id: Int, completion: @escaping (_ result: Result<MythicKeystoneDungeon, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneDungeon(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystones(completion: @escaping (_ result: Result<MythicKeystoneIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystones { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystonePeriods(completion: @escaping (_ result: Result<MythicKeystonePeriodIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystonePeriods { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystonePeriod(id: Int, completion: @escaping (_ result: Result<MythicKeystonePeriod, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystonePeriod(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneSeasons(completion: @escaping (_ result: Result<MythicKeystoneSeasonIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneSeasons { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneSeason(id: Int, completion: @escaping (_ result: Result<MythicKeystoneSeason, Error>) -> Void) {
        battleNetAPI.wow.getMythicKeystoneSeason(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Keystone Leaderboard API
    
    public func getMythicLeaderboards(connectedRealmID: Int, completion: @escaping (_ result: Result<MythicLeaderboardIndex, Error>) -> Void) {
        battleNetAPI.wow.getMythicLeaderboards(connectedRealmID: connectedRealmID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, completion: @escaping (_ result: Result<MythicLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mythic Challenge Mode API
    
    public func getMythicChallengeMode(completion: @escaping (_ result: Result<MythicChallengeMode, Error>) -> Void) {
        battleNetAPI.wow.getMythicChallengeMode { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Playable Class API
    
    public func getPlayableClasses(completion: @escaping (_ result: Result<WOWClassIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClasses { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableClass(id: Int, completion: @escaping (_ result: Result<WOWClass, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClass(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableClassPvPTalentSlots(id: Int, completion: @escaping (_ result: Result<PVPTalentSlots, Error>) -> Void) {
        battleNetAPI.wow.getPlayableClassPvPTalentSlots(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Playable Specialization API
    
    public func getPlayableSpecializations(completion: @escaping (_ result: Result<SpecializationIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableSpecializations { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableSpecialization(id: Int, completion: @escaping (_ result: Result<Specialization, Error>) -> Void) {
        battleNetAPI.wow.getPlayableSpecialization(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Power Type API
    
    public func getPowerTypes(completion: @escaping (_ result: Result<PowerTypeIndex, Error>) -> Void) {
        battleNetAPI.wow.getPowerTypes { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPowerType(id: Int, completion: @escaping (_ result: Result<PowerType, Error>) -> Void) {
        battleNetAPI.wow.getPowerType(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Playable Race API
    
    public func getPlayableRaces(completion: @escaping (_ result: Result<WOWRaceIndex, Error>) -> Void) {
        battleNetAPI.wow.getPlayableRaces { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableRace(id: Int, completion: @escaping (_ result: Result<WOWRace, Error>) -> Void) {
        battleNetAPI.wow.getPlayableRace(id: id) { result in
            result.decode(completion: completion)
        }
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
        
        battleNetAPI.wow.getRealm(realmSlug) { result in
            result.decode(completion: completion)
        }
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
        battleNetAPI.wow.getRegion(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Token API
    
    public func getTokenIndex(completion: @escaping (_ result: Result<TokenIndex, Error>) -> Void) {
        battleNetAPI.wow.getTokenIndex { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Achievement API
    
    public func getAchievement(id: Int, completion: @escaping (_ result: Result<WOWAchievement, Error>) -> Void) {
        battleNetAPI.wow.getAchievement(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Auction API
    
    public func getAuctions(realm: String, completion: @escaping (_ result: Result<Auction, Error>) -> Void) {
        battleNetAPI.wow.getAuctions(realm: realm) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Challenge Mode API
    
    public func getChallengeLeaderboards(realm: String, completion: @escaping (_ result: Result<[Challenge], Error>) -> Void) {
        battleNetAPI.wow.getChallengeLeaderboards(realm: realm) { result in
            let customDecode: ((_ data: Data) throws -> [Challenge]) = { data in
                return try ChallengeIndex.decode(from: data).challenges
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getTopChallengeLeaderboards(completion: @escaping (_ result: Result<[Challenge], Error>) -> Void) {
        battleNetAPI.wow.getTopChallengeLeaderboards { result in
            let customDecode: ((_ data: Data) throws -> [Challenge]) = { data in
                return try ChallengeIndex.decode(from: data).challenges
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Character Profile API
    
    public func getCharacter(_ name: String, realm: String, fields: WOWCharacterField?, completion: @escaping (_ result: Result<WOWCharacterProfile, Error>) -> Void) {
        battleNetAPI.wow.getCharacter(name, realm: realm, fields: fields?.toArray) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Guild Profile API
    
    public func getGuild(_ name: String, realm: String, fields: WOWGuildField?, completion: @escaping (_ result: Result<WOWGuildProfile, Error>) -> Void) {
        battleNetAPI.wow.getGuild(name, realm: realm, fields: fields?.toArray) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item API
    
    public func getItem(id: Int, completion: @escaping (_ result: Result<WOWItem, Error>) -> Void) {
        battleNetAPI.wow.getItem(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getItemSet(setID: Int, completion: @escaping (_ result: Result<WOWItemSet, Error>) -> Void) {
        battleNetAPI.wow.getItemSet(setID: setID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mount API
    
    public func getMounts(completion: @escaping (_ result: Result<[Mount], Error>) -> Void) {
        battleNetAPI.wow.getMounts { result in
            let customDecode: ((_ data: Data) throws -> [Mount]) = { data in
                return try MountIndex.decode(from: data).mounts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Pet API
    
    public func getPets(completion: @escaping (_ result: Result<[Pet], Error>) -> Void) {
        battleNetAPI.wow.getPets { result in
            let customDecode: ((_ data: Data) throws -> [Pet]) = { data in
                return try PetIndex.decode(from: data).pets
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getPetAbility(abilityID: Int, completion: @escaping (_ result: Result<PetAbility, Error>) -> Void) {
        battleNetAPI.wow.getPetAbility(abilityID: abilityID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetSpecies(speciesID: Int, completion: @escaping (_ result: Result<PetSpecies, Error>) -> Void) {
        battleNetAPI.wow.getPetSpecies(speciesID: speciesID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetStats(speciesID: Int, level: Int = 1, breedID: Int = 3, qualityID: Int = 1, completion: @escaping (_ result: Result<PetStats, Error>) -> Void) {
        battleNetAPI.wow.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - PVP API
    
    public func getLeaderboard(bracket: WOWLeaderboardBracket, completion: @escaping (_ result: Result<WOWLeaderboard, Error>) -> Void) {
        battleNetAPI.wow.getLeaderboard(bracket: bracket.rawValue) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Quest API
    
    public func getQuest(id: Int, completion: @escaping (_ result: Result<WOWQuest, Error>) -> Void) {
        battleNetAPI.wow.getQuest(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Realm Status API
    
    public func getRealmsStatus(completion: @escaping (_ result: Result<[WOWRealm], Error>) -> Void) {
        battleNetAPI.wow.getRealmsStatus { result in
            let customDecode: ((_ data: Data) throws -> [WOWRealm]) = { data in
                return try WOWRealmIndex.decode(from: data).realms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Recipe API
    
    public func getRecipe(id: Int, completion: @escaping (_ result: Result<WOWRecipe, Error>) -> Void) {
        battleNetAPI.wow.getRecipe(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Spell API
    
    public func getSpell(id: Int, completion: @escaping (_ result: Result<Spell, Error>) -> Void) {
        battleNetAPI.wow.getSpell(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Zone API
    
    public func getZones(completion: @escaping (_ result: Result<[Zone], Error>) -> Void) {
        battleNetAPI.wow.getZones { result in
            let customDecode: ((_ data: Data) throws -> [Zone]) = { data in
                return try ZoneIndex.decode(from: data).zones
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getZone(id: Int, completion: @escaping (_ result: Result<Zone, Error>) -> Void) {
        battleNetAPI.wow.getZone(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Data Resources
    
    public func getBattlegroups(completion: @escaping (_ result: Result<[Battlegroup], Error>) -> Void) {
        battleNetAPI.wow.getBattlegroups { result in
            let customDecode: ((_ data: Data) throws -> [Battlegroup]) = { data in
                return try BattlegroupIndex.decode(from: data).battlegroups
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRaces(completion: @escaping (_ result: Result<[Race], Error>) -> Void) {
        battleNetAPI.wow.getRaces { result in
            let customDecode: ((_ data: Data) throws -> [Race]) = { data in
                return try RaceIndex.decode(from: data).races
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getClasses(completion: @escaping (_ result: Result<[WOWCharacterClass], Error>) -> Void) {
        battleNetAPI.wow.getClasses { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacterClass]) = { data in
                return try WOWCharacterClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getAchievements(completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        battleNetAPI.wow.getAchievements { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildRewards(completion: @escaping (_ result: Result<[WOWGuildReward], Error>) -> Void) {
        battleNetAPI.wow.getGuildRewards { result in
            let customDecode: ((_ data: Data) throws -> [WOWGuildReward]) = { data in
                return try WOWGuildRewardIndex.decode(from: data).rewards
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildPerks(completion: @escaping (_ result: Result<[Perk], Error>) -> Void) {
        battleNetAPI.wow.getGuildPerks { result in
            let customDecode: ((_ data: Data) throws -> [Perk]) = { data in
                return try PerkIndex.decode(from: data).perks
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildAchievements(completion: @escaping (_ result: Result<[WOWAchievementCategory], Error>) -> Void) {
        battleNetAPI.wow.getGuildAchievements { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getItemClasses(completion: @escaping (_ result: Result<[ItemClass], Error>) -> Void) {
        battleNetAPI.wow.getItemClasses { result in
            let customDecode: ((_ data: Data) throws -> [ItemClass]) = { data in
                return try ItemClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getTalents(completion: @escaping (_ result: Result<ClassTalentDictionary, Error>) -> Void) {
        battleNetAPI.wow.getTalents { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetTypes(completion: @escaping (_ result: Result<[PetType], Error>) -> Void) {
        battleNetAPI.wow.getPetTypes { result in
            let customDecode: ((_ data: Data) throws -> [PetType]) = { data in
                return try PetTypeIndex.decode(from: data).petTypes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
}
