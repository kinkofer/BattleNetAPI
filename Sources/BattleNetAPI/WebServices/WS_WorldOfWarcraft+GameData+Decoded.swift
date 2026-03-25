//
//  WS_WorldOfWarcraft+GameData+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_WorldOfWarcraft {
    // MARK: - Game Data API
    
    // MARK: Achievement API
    
    public func getAchievements() async throws -> WOWAchievementIndex {
        let data = try await webService.getAchievementIndex()
        return try WOWAchievementIndex.decode(from: data)
    }

    public func getAchievement(id: Int) async throws -> WOWAchievement {
        let data = try await webService.getAchievement(id: id)
        return try WOWAchievement.decode(from: data)
    }

    public func getAchievementCategoryIndex() async throws -> WOWAchievementCategoryIndex {
        let data = try await webService.getAchievementCategoryIndex()
        return try WOWAchievementCategoryIndex.decode(from: data)
    }
    
    public func getAchievementCategory(id: Int) async throws -> WOWAchievementCategory {
        let data = try await webService.getAchievementCategory(id: id)
        return try WOWAchievementCategory.decode(from: data)
    }

    public func getAchievementMedia(id: Int) async throws -> Media {
        let data = try await webService.getAchievementMedia(id: id)
        return try Media.decode(from: data)
    }


    // MARK: Auction House API
    
    public func getAuctions(connectedRealmID: Int) async throws -> AuctionIndex {
        let data = try await webService.getAuctions(connectedRealmID: connectedRealmID)
        return try AuctionIndex.decode(from: data)
    }
    
    
    // MARK: Connected Realm API
    
    public func getConnectedRealmIndex() async throws -> ConnectedRealmIndex {
        let data = try await webService.getConnectedRealmIndex()
        return try ConnectedRealmIndex.decode(from: data)
    }
    
    public func getConnectedRealm(id: Int) async throws -> ConnectedRealm {
        let data = try await webService.getConnectedRealm(id: id)
        return try ConnectedRealm.decode(from: data)
    }
    
    
    
    // MARK: Item API
    
    public func getItem(id: Int) async throws -> WOWItem {
        let data = try await webService.getItem(id: id)
        return try WOWItem.decode(from: data)
    }
    
    
    public func getItemClasses() async throws -> [ItemClass] {
        let data = try await webService.getItemClassIndex()
        return try ItemClassIndex.decode(from: data).classes
    }
    
    
    public func getItemSet(id: Int) async throws -> WOWItemSet {
        let data = try await webService.getItemSet(id: id)
        return try WOWItemSet.decode(from: data)
    }
    
    
    // MARK: Mount API
    
    public func getMountIndex() async throws -> MountIndex {
        let data = try await webService.getMountIndex()
        return try MountIndex.decode(from: data)
    }
    
    
    // MARK: Mythic Keystone Affix API
    
    public func getMythicKeystoneAffixes() async throws -> KeystoneAffixIndex {
        let data = try await webService.getMythicKeystoneAffixIndex()
        return try KeystoneAffixIndex.decode(from: data)
    }
    
    public func getMythicKeystoneAffix(id: Int) async throws -> KeystoneAffix {
        let data = try await webService.getMythicKeystoneAffix(id: id)
        return try KeystoneAffix.decode(from: data)
    }
    
    
    // MARK: Mythic Keystone Dungeon API
    
    public func getMythicKeystones() async throws -> MythicKeystoneIndex {
        let data = try await webService.getMythicKeystoneIndex()
        return try MythicKeystoneIndex.decode(from: data)
    }
    
    public func getMythicKeystoneDungeons() async throws -> MythicKeystoneDungeonIndex {
        let data = try await webService.getMythicKeystoneDungeonIndex()
        return try MythicKeystoneDungeonIndex.decode(from: data)
    }
    
    public func getMythicKeystoneDungeon(id: Int) async throws -> MythicKeystoneDungeon {
        let data = try await webService.getMythicKeystoneDungeon(id: id)
        return try MythicKeystoneDungeon.decode(from: data)
    }
    
    public func getMythicKeystonePeriods() async throws -> MythicKeystonePeriodIndex {
        let data = try await webService.getMythicKeystonePeriodIndex()
        return try MythicKeystonePeriodIndex.decode(from: data)
    }
    
    public func getMythicKeystonePeriod(id: Int) async throws -> MythicKeystonePeriod {
        let data = try await webService.getMythicKeystonePeriod(id: id)
        return try MythicKeystonePeriod.decode(from: data)
    }
    
    public func getMythicKeystoneSeasons() async throws -> MythicKeystoneSeasonIndex {
        let data = try await webService.getMythicKeystoneSeasonIndex()
        return try MythicKeystoneSeasonIndex.decode(from: data)
    }
    
    public func getMythicKeystoneSeason(id: Int) async throws -> MythicKeystoneSeason {
        let data = try await webService.getMythicKeystoneSeason(id: id)
        return try MythicKeystoneSeason.decode(from: data)
    }
    
    
    // MARK: Mythic Keystone Leaderboard API
    
    public func getMythicLeaderboards(connectedRealmID: Int) async throws -> MythicLeaderboardIndex {
        let data = try await webService.getMythicLeaderboardIndex(connectedRealmID: connectedRealmID)
        return try MythicLeaderboardIndex.decode(from: data)
    }
    
    public func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int) async throws -> MythicLeaderboard {
        let data = try await webService.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period)
        return try MythicLeaderboard.decode(from: data)
    }
    
    
    // MARK: Mythic Raid Leaderboard API
    
    public func getMythicRaidLeaderboard(raid: String, faction: FactionType) async throws -> MythicRaidLeaderboard {
        let data = try await webService.getMythicRaidLeaderboard(raid: raid, faction: faction)
        return try MythicRaidLeaderboard.decode(from: data)
    }
    
    
    // MARK: Pet API
    
    public func getPetIndex() async throws -> PetIndex {
        let data = try await webService.getPetIndex()
        return try PetIndex.decode(from: data)
    }
    
    public func getPetAbility(id: Int) async throws -> PetAbility {
        let data = try await webService.getPetAbility(id: id)
        return try PetAbility.decode(from: data)
    }
    
    
    // MARK: Playable Class API
    
    public func getPlayableClasses() async throws -> WOWClassIndex {
        let data = try await webService.getPlayableClassIndex()
        return try WOWClassIndex.decode(from: data)
    }
    
    public func getPlayableClass(id: Int) async throws -> WOWClass {
        let data = try await webService.getPlayableClass(id: id)
        return try WOWClass.decode(from: data)
    }
    
    public func getPlayableClassPvPTalentSlots(classID: Int) async throws -> PVPTalentSlots {
        let data = try await webService.getPlayableClassPvPTalentSlots(classID: classID)
        return try PVPTalentSlots.decode(from: data)
    }
    
    
    // MARK: Playable Race API
    
    public func getPlayableRaces() async throws -> WOWRaceIndex {
        let data = try await webService.getPlayableRaceIndex()
        return try WOWRaceIndex.decode(from: data)
    }
    
    public func getPlayableRace(id: Int) async throws -> WOWRace {
        let data = try await webService.getPlayableRace(id: id)
        return try WOWRace.decode(from: data)
    }
    
    
    // MARK: Playable Specialization API
    
    public func getPlayableSpecializations() async throws -> SpecializationIndex {
        let data = try await webService.getPlayableSpecializationIndex()
        return try SpecializationIndex.decode(from: data)
    }
    
    public func getPlayableSpecialization(id: Int) async throws -> Specialization {
        let data = try await webService.getPlayableSpecialization(id: id)
        return try Specialization.decode(from: data)
    }
    
    
    // MARK: Power Type API
    
    public func getPowerTypes() async throws -> PowerTypeIndex {
        let data = try await webService.getPowerTypeIndex()
        return try PowerTypeIndex.decode(from: data)
    }
    
    public func getPowerType(id: Int) async throws -> PowerType {
        let data = try await webService.getPowerType(id: id)
        return try PowerType.decode(from: data)
    }
    
    
    // MARK: Profession API
    
    public func getRecipe(id: Int) async throws -> WOWRecipe {
        let data = try await webService.getRecipe(id: id)
        return try WOWRecipe.decode(from: data)
    }
    
    
    // MARK: PvP Season API
    
    public func getPvPLeaderboard(season: Int, bracket: WOWLeaderboardBracket) async throws -> WOWLeaderboard {
        let data = try await webService.getPvPLeaderboard(pvpSeasonID: season, pvpBracket: bracket)
        return try WOWLeaderboard.decode(from: data)
    }
    
    
    // MARK: Quest API
    
    public func getQuest(id: Int) async throws -> WOWQuest {
        let data = try await webService.getQuest(id: id)
        return try WOWQuest.decode(from: data)
    }
    
    
    // MARK: Realm API
    
    public func getRealmIndex() async throws -> [RealmIndex] {
        let data = try await webService.getRealmIndex()
        return try RealmIndexResult.decode(from: data).realms
    }
    
    public func getRealm(id: Int? = nil, slug: String? = nil) async throws -> Realm {
        guard let realmSlug = id.map({ String($0) }) ?? slug else {
            throw HTTPError.unexpectedBody
        }
        
        let data = try await webService.getRealm(realmSlug)
        return try Realm.decode(from: data)
    }
    
    
    // MARK: Region API
    
    public func getRegions() async throws -> [Link<Region>] {
        let data = try await webService.getRegionIndex()
        return try RegionIndexResult.decode(from: data).regions
    }
    
    public func getRegion(id: Int) async throws -> Region {
        let data = try await webService.getRegion(id: id)
        return try Region.decode(from: data)
    }
    
    
    // MARK: Spell API
    
    public func getSpell(id: Int) async throws -> Spell {
        let data = try await webService.getSpell(id: id)
        return try Spell.decode(from: data)
    }
    
    
    // MARK: Talent API
    
    public func getTalents() async throws -> ClassTalentDictionary {
        let data = try await webService.getTalentIndex()
        return try ClassTalentDictionary.decode(from: data)
    }
    
    
    // MARK: Token API
    
    public func getTokens() async throws -> TokenIndex {
        let data = try await webService.getTokenIndex()
        return try TokenIndex.decode(from: data)
    }
}
