//
//  WorldOfWarcraftModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class WorldOfWarcraftModelController {
    public static let shared = WorldOfWarcraftModelController()
    private init() { }
    
    
    /// Calls a web service identicated by the href in a Link object.
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, HTTPError>) -> Void) {
        BattleNetAPI.wow.getResource(from: resourceLink.href) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Profile API
    
    public func getCharacters(region: APIRegion = Current.region, completion: @escaping (_ result: Result<[WOWCharacter], HTTPError>) -> Void) {
        BattleNetAPI.wow.getCharacters(region: region) { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacter]) = { data in
                return try WOWCharacterResult.decode(from: data).characters
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    // MARK: - WoW Mythic Keystone Character Profile API
    
    public func getMythicKeystoneProfile(characterName: String, realmSlug: String, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneProfile, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneProfile(characterName: characterName, realmSlug: realmSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneProfileSeason, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Connected Realm API
    
    public func getConnectedRealmIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<[Link<ConnectedRealm>], HTTPError>) -> Void) {
        BattleNetAPI.wow.getConnectedRealmIndex(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Link<ConnectedRealm>]) = { data in
                return try ConnectedRealmIndex.decode(from: data).connectedRealms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getConnectedRealm(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<ConnectedRealm, HTTPError>) -> Void) {
        BattleNetAPI.wow.getConnectedRealm(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mythic Keystone Affix API
    
    public func getMythicKeystoneAffixes(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<KeystoneAffixIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneAffixes(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneAffix(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<KeystoneAffix, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneAffix(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Raid Leaderboard API
    
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicRaidLeaderboard, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Keystone Dungeon API
    
    public func getMythicKeystoneDungeons(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneDungeonIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneDungeons(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneDungeon(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneDungeon, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneDungeon(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystones(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystones(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystonePeriods(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystonePeriodIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystonePeriods(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystonePeriod(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystonePeriod, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystonePeriod(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneSeasons(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneSeasonIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneSeasons(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicKeystoneSeason(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicKeystoneSeason, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicKeystoneSeason(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Mythic Keystone Leaderboard API
    
    public func getMythicLeaderboards(connectedRealmID: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicLeaderboardIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicLeaderboards(connectedRealmID: connectedRealmID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicLeaderboard, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mythic Challenge Mode API
    
    public func getMythicChallengeMode(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<MythicChallengeMode, HTTPError>) -> Void) {
        BattleNetAPI.wow.getMythicChallengeMode(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Playable Class API
    
    public func getPlayableClasses(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<WOWClassIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableClasses(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableClass(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<WOWClass, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableClass(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableClassPvPTalentSlots(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<PVPTalentSlots, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableClassPvPTalentSlots(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Playable Specialization API
    
    public func getPlayableSpecializations(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<SpecializationIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableSpecializations(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableSpecialization(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<Specialization, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableSpecialization(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Power Type API
    
    public func getPowerTypes(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<PowerTypeIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPowerTypes(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPowerType(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<PowerType, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPowerType(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: - Playable Race API
    
    public func getPlayableRaces(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<WOWRaceIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableRaces(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPlayableRace(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<WOWRace, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPlayableRace(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Realm API
    
    public func getRealmIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<[RealmIndex], HTTPError>) -> Void) {
        BattleNetAPI.wow.getRealmIndex(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [RealmIndex]) = { data in
                return try RealmIndexResult.decode(from: data).realms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRealm(id: Int? = nil, slug: String? = nil, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<Realm, HTTPError>) -> Void) {
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
        
        BattleNetAPI.wow.getRealm(realmSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Region API
    
    public func getRegionIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<[Link<Region>], HTTPError>) -> Void) {
        BattleNetAPI.wow.getRegionIndex(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Link<Region>]) = { data in
                return try RegionIndexResult.decode(from: data).regions
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRegion(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<Region, HTTPError>) -> Void) {
        BattleNetAPI.wow.getRegion(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Token API
    
    public func getTokenIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale, completion: @escaping (_ result: Result<TokenIndex, HTTPError>) -> Void) {
        BattleNetAPI.wow.getTokenIndex(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Achievement API
    
    public func getAchievement(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWAchievement, HTTPError>) -> Void) {
        BattleNetAPI.wow.getAchievement(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Auction API
    
    public func getAuctions(realm: String, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<Auction, HTTPError>) -> Void) {
        BattleNetAPI.wow.getAuctions(realm: realm, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Boss API
    
    public func getBosses(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Boss], HTTPError>) -> Void) {
        BattleNetAPI.wow.getBosses(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Boss]) = { data in
                return try BossIndex.decode(from: data).bosses
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getBoss(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<Boss, HTTPError>) -> Void) {
        BattleNetAPI.wow.getBoss(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Challenge Mode API
    
    public func getChallengeLeaderboards(realm: String, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Challenge], HTTPError>) -> Void) {
        BattleNetAPI.wow.getChallengeLeaderboards(realm: realm, region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Challenge]) = { data in
                return try ChallengeIndex.decode(from: data).challenges
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getTopChallengeLeaderboards(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Challenge], HTTPError>) -> Void) {
        BattleNetAPI.wow.getTopChallengeLeaderboards(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Challenge]) = { data in
                return try ChallengeIndex.decode(from: data).challenges
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Character Profile API
    
    public func getCharacter(_ name: String, realm: String, fields: WOWCharacterField?, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWCharacterProfile, HTTPError>) -> Void) {
        BattleNetAPI.wow.getCharacter(name, realm: realm, fields: fields?.toArray, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Guild Profile API
    
    public func getGuild(_ name: String, realm: String, fields: WOWGuildField?, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWGuildProfile, HTTPError>) -> Void) {
        BattleNetAPI.wow.getGuild(name, realm: realm, fields: fields?.toArray, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item API
    
    public func getItem(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWItem, HTTPError>) -> Void) {
        BattleNetAPI.wow.getItem(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getItemSet(setID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWItemSet, HTTPError>) -> Void) {
        BattleNetAPI.wow.getItemSet(setID: setID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Mount API
    
    public func getMounts(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Mount], HTTPError>) -> Void) {
        BattleNetAPI.wow.getMounts(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Mount]) = { data in
                return try MountIndex.decode(from: data).mounts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Pet API
    
    public func getPets(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Pet], HTTPError>) -> Void) {
        BattleNetAPI.wow.getPets(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Pet]) = { data in
                return try PetIndex.decode(from: data).pets
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getPetAbility(abilityID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<PetAbility, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPetAbility(abilityID: abilityID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetSpecies(speciesID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<PetSpecies, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPetSpecies(speciesID: speciesID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetStats(speciesID: Int, level: Int = 1, breedID: Int = 3, qualityID: Int = 1, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<PetStats, HTTPError>) -> Void) {
        BattleNetAPI.wow.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - PVP API
    
    public func getLeaderboard(bracket: WOWLeaderboardBracket, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWLeaderboard, HTTPError>) -> Void) {
        BattleNetAPI.wow.getLeaderboard(bracket: bracket.rawValue, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Quest API
    
    public func getQuest(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWQuest, HTTPError>) -> Void) {
        BattleNetAPI.wow.getQuest(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Realm Status API
    
    public func getRealmsStatus(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[WOWRealm], HTTPError>) -> Void) {
        BattleNetAPI.wow.getRealmsStatus(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [WOWRealm]) = { data in
                return try WOWRealmIndex.decode(from: data).realms
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Recipe API
    
    public func getRecipe(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<WOWRecipe, HTTPError>) -> Void) {
        BattleNetAPI.wow.getRecipe(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Spell API
    
    public func getSpell(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<Spell, HTTPError>) -> Void) {
        BattleNetAPI.wow.getSpell(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Zone API
    
    public func getZones(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Zone], HTTPError>) -> Void) {
        BattleNetAPI.wow.getZones(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Zone]) = { data in
                return try ZoneIndex.decode(from: data).zones
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getZone(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<Zone, HTTPError>) -> Void) {
        BattleNetAPI.wow.getZone(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Data Resources
    
    public func getBattlegroups(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Battlegroup], HTTPError>) -> Void) {
        BattleNetAPI.wow.getBattlegroups(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Battlegroup]) = { data in
                return try BattlegroupIndex.decode(from: data).battlegroups
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getRaces(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Race], HTTPError>) -> Void) {
        BattleNetAPI.wow.getRaces(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Race]) = { data in
                return try RaceIndex.decode(from: data).races
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getClasses(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[WOWCharacterClass], HTTPError>) -> Void) {
        BattleNetAPI.wow.getClasses(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [WOWCharacterClass]) = { data in
                return try WOWCharacterClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getAchievements(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[WOWAchievementCategory], HTTPError>) -> Void) {
        BattleNetAPI.wow.getAchievements(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildRewards(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[WOWGuildReward], HTTPError>) -> Void) {
        BattleNetAPI.wow.getGuildRewards(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [WOWGuildReward]) = { data in
                return try WOWGuildRewardIndex.decode(from: data).rewards
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildPerks(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[Perk], HTTPError>) -> Void) {
        BattleNetAPI.wow.getGuildPerks(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Perk]) = { data in
                return try PerkIndex.decode(from: data).perks
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getGuildAchievements(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[WOWAchievementCategory], HTTPError>) -> Void) {
        BattleNetAPI.wow.getGuildAchievements(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [WOWAchievementCategory]) = { data in
                return try WOWAchievementIndex.decode(from: data).achievements
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getItemClasses(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[ItemClass], HTTPError>) -> Void) {
        BattleNetAPI.wow.getItemClasses(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [ItemClass]) = { data in
                return try ItemClassIndex.decode(from: data).classes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getTalents(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<ClassTalentDictionary, HTTPError>) -> Void) {
        BattleNetAPI.wow.getTalents(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getPetTypes(region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<[PetType], HTTPError>) -> Void) {
        BattleNetAPI.wow.getPetTypes(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [PetType]) = { data in
                return try PetTypeIndex.decode(from: data).petTypes
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
}
