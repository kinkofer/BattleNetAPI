//
//  WorldOfWarcraftTests+GameData.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/3/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


extension WorldOfWarcraftTests {
    // MARK: - Game Data API

    // MARK: Achievement API

    func testGetAchievementCategoryIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getAchievementCategoryIndex()
    }

    func testGetAchievementCategory() async throws {
        let id = 81
        _ = try await battleNetAPI.wow.decoded.getAchievementCategory(id: id)
    }

    func testGetAchievementIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getAchievements()
    }

    func testGetAchievement() async throws {
        let id = 6
        _ = try await battleNetAPI.wow.decoded.getAchievement(id: id)
    }

    func testGetAchievementMedia() async throws {
        let id = 6
        _ = try await battleNetAPI.wow.decoded.getAchievementMedia(id: id)
    }


    // MARK: Auction House API

    func testGetAuctions() async throws {
        let connectedRealmID = 121
        _ = try await battleNetAPI.wow.decoded.getAuctions(connectedRealmID: connectedRealmID)
    }

    func testGetAuctionCommodities() async throws {
        XCTAssert(true)
    }


    // MARK: Azerite Essence API

    func testGetAzeriteEssenceIndex() async throws {
        XCTAssert(true)
    }

    func testGetAzeriteEssence() async throws {
        XCTAssert(true)
    }

    func testSearchAzeriteEssence() async throws {
        XCTAssert(true)
    }

    func testGetAzeriteEssenceMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Connected Realm API

    func testGetConnectedRealmIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getConnectedRealmIndex()
    }

    func testGetConnectedRealm() async throws {
        let id = 11
        _ = try await battleNetAPI.wow.decoded.getConnectedRealm(id: id)
    }

    func testSearchConnectedRealms() async throws {
        XCTAssert(true)
    }


    // MARK: Covenant API

    func testGetCovenantIndex() async throws {
        XCTAssert(true)
    }

    func testGetCovenant() async throws {
        XCTAssert(true)
    }

    func testGetCovenantMedia() async throws {
        XCTAssert(true)
    }

    func testGetSoulbindIndex() async throws {
        XCTAssert(true)
    }

    func testGetSoulbind() async throws {
        XCTAssert(true)
    }

    func testGetConduitIndex() async throws {
        XCTAssert(true)
    }

    func testGetConduit() async throws {
        XCTAssert(true)
    }


    // MARK: Creature API

    func testGetCreatureFamilyIndex() async throws {
        XCTAssert(true)
    }

    func testGetCreatureFamily() async throws {
        XCTAssert(true)
    }

    func testGetCreatureTypeIndex() async throws {
        XCTAssert(true)
    }

    func testGetCreatureType() async throws {
        XCTAssert(true)
    }

    func testGetCreature() async throws {
        XCTAssert(true)
    }

    func testSearchCreature() async throws {
        XCTAssert(true)
    }

    func testGetCreatureDisplayMedia() async throws {
        XCTAssert(true)
    }

    func testGetCreatureFamilyMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Guild Crest API

    func testGetGuildCrestIndex() async throws {
        XCTAssert(true)
    }

    func testGetGuildCrestBorderMedia() async throws {
        XCTAssert(true)
    }

    func testGetGuildCrestEmblemMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Heirloom API

    func testGetHeirloomIndex() async throws { XCTAssert(true) }
    func testGetHeirloom() async throws { XCTAssert(true) }


    // MARK: Item API

    func testGetItemClassIndex() async throws {
        XCTAssert(true)
    }

    func testGetItemClass() async throws {
        XCTAssert(true)
    }

    func testGetItemSetIndex() async throws {
        XCTAssert(true)
    }

    func testGetItemSet() async throws {
        let setID = 1
        _ = try await battleNetAPI.wow.decoded.getItemSet(id: setID)
    }

    func testGetItemSubclass() async throws {
        XCTAssert(true)
    }

    func testGetItem() async throws {
        let id = 19019
        _ = try await battleNetAPI.wow.decoded.getItem(id: id)
    }

    func testGetItemMedia() async throws {
        XCTAssert(true)
    }

    func testSearchItem() async throws {
        XCTAssert(true)
    }


    // MARK: Item Appearance API

    func testGetItemAppearanceIndex() async throws { XCTAssert(true) }
    func testGetItemAppearance() async throws { XCTAssert(true) }
    func testGetItemAppearanceSetIndex() async throws { XCTAssert(true) }
    func testGetItemAppearanceSet() async throws { XCTAssert(true) }
    func testGetItemAppearanceSlotIndex() async throws { XCTAssert(true) }
    func testGetItemAppearanceBySlot() async throws { XCTAssert(true) }
    func testSearchItemAppearance() async throws { XCTAssert(true) }


    // MARK: Journal API

    func testGetJournalExpansionIndex() async throws {
        XCTAssert(true)
    }

    func testGetJournalExpansion() async throws {
        XCTAssert(true)
    }

    func testGetJournalEncounterIndex() async throws {
        XCTAssert(true)
    }

    func testGetJournalEncounter() async throws {
        XCTAssert(true)
    }

    func testSearchJournalEncounter() async throws {
        XCTAssert(true)
    }

    func testGetJournalInstanceIndex() async throws {
        XCTAssert(true)
    }

    func testGetJournalInstance() async throws {
        XCTAssert(true)
    }

    func testGetJournalInstanceMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Media Search API

    func testSearchMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Modified Crafting API

    func testGetModifiedCraftingIndex() async throws {
        XCTAssert(true)
    }

    func testGetModifiedCraftingCategoryIndex() async throws {
        XCTAssert(true)
    }

    func testGetModifiedCraftingCategory() async throws {
        XCTAssert(true)
    }

    func testGetModifiedCraftingReagentSlotTypeIndex() async throws {
        XCTAssert(true)
    }

    func testGetModifiedCraftingReagentSlotType() async throws {
        XCTAssert(true)
    }


    // MARK: Mount API

    func testGetMountIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMountIndex()
    }

    func testGetMount() async throws {
        XCTAssert(true)
    }

    func testSearchMount() async throws {
        XCTAssert(true)
    }


    // MARK: Mythic Keystone Affix API

    func testGetMythicKeystoneAffixIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneAffixes()
    }

    func testGetMythicKeystoneAffix() async throws {
        let id = 1
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneAffix(id: id)
    }

    func testGetMythicKeystoneAffixMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Mythic Keystone Dungeon API

    func testGetMythicKeystoneDungeonIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneDungeons()
    }

    func testGetMythicKeystoneDungeon() async throws {
        let id = 197
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneDungeon(id: id)
    }


    // MARK: Mythic Keystone Index API

    func testGetMythicKeystoneIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMythicKeystones()
    }

    func testGetMythicKeystonePeriodIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMythicKeystonePeriods()
    }

    func testGetMythicKeystonePeriod() async throws {
        let id = 880
        _ = try await battleNetAPI.wow.decoded.getMythicKeystonePeriod(id: id)
    }

    func testGetMythicKeystoneSeasonIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneSeasons()
    }

    func testGetMythicKeystoneSeason() async throws {
        let id = 8
        _ = try await battleNetAPI.wow.decoded.getMythicKeystoneSeason(id: id)
    }

    func testGetMythicLeaderboardIndex() async throws {
        let connectedRealmID = 11
        _ = try await battleNetAPI.wow.decoded.getMythicLeaderboards(connectedRealmID: connectedRealmID)
    }


    // MARK: Mythic Keystone Leaderboard API

    func testGetMythicLeaderboard() async throws {
        let connectedRealmID = 11
        let dungeonID = 197
        let period = 641
        _ = try await battleNetAPI.wow.decoded.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period)
    }


    // MARK: Mythic Raid Leaderboard API

    func testGetMythicRaidLeaderboard() async throws {
        let raid = "uldir"
        let faction: FactionType = .alliance
        _ = try await battleNetAPI.wow.decoded.getMythicRaidLeaderboard(raid: raid, faction: faction)
    }


    // MARK: Pet API

    func testGetPetIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getPetIndex()
    }

    func testGetPet() async throws {
        XCTAssert(true)
    }

    func testGetPetMedia() async throws {
        XCTAssert(true)
    }

    func testGetPetAbilityIndex() async throws {
        XCTAssert(true)
    }

    func testGetPetAbility() async throws {
        let abilityID = 110
        _ = try await battleNetAPI.wow.decoded.getPetAbility(id: abilityID)
    }

    func testGetPetAbilityMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Playable Class API

    func testGetPlayableClassIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getPlayableClasses()
    }

    func testGetPlayableClass() async throws {
        let id = 7
        _ = try await battleNetAPI.wow.decoded.getPlayableClass(id: id)
    }

    func testGetPlayableClassMedia() async throws {
        XCTAssert(true)
    }

    func testGetPlayableClassPvPTalentSlots() async throws {
        let id = 7
        _ = try await battleNetAPI.wow.decoded.getPlayableClassPvPTalentSlots(classID: id)
    }


    // MARK: Playable Race API

    func testGetPlayableRaceIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getPlayableRaces()
    }

    func testGetPlayableRace() async throws {
        let id = 2
        _ = try await battleNetAPI.wow.decoded.getPlayableRace(id: id)
    }


    // MARK: Playable Specialization API

    func testGetPlayableSpecializationIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getPlayableSpecializations()
    }

    func testGetPlayableSpecialization() async throws {
        let id = 262
        _ = try await battleNetAPI.wow.decoded.getPlayableSpecialization(id: id)
    }

    func testGetPlayableSpecializationMedia() async throws { XCTAssert(true) }


    // MARK: Power Type API

    func testGetPowerTypeIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getPowerTypes()
    }

    func testGetPowerType() async throws {
        let id = 0
        _ = try await battleNetAPI.wow.decoded.getPowerType(id: id)
    }


    // MARK: Profession API

    func testGetProfessionIndex() async throws { XCTAssert(true) }
    func testGetProfession() async throws { XCTAssert(true) }
    func testGetProfessionMedia() async throws { XCTAssert(true) }
    func testGetProfessionSkillTier() async throws { XCTAssert(true) }

    func testGetRecipe() async throws {
        let id = 1631
        _ = try await battleNetAPI.wow.decoded.getRecipe(id: id)
    }

    func testGetRecipeMedia() async throws { XCTAssert(true) }


    // MARK: PvP Season API

    func testGetPvPSeasonIndex() async throws { XCTAssert(true) }
    func testGetPvPSeason() async throws { XCTAssert(true) }
    func testGetPvPLeaderboardIndex() async throws { XCTAssert(true) }

    func testGetPvPLeaderboard() async throws {
        let season = 33
        _ = try await battleNetAPI.wow.decoded.getPvPLeaderboard(season: season, bracket: ._3v3)
    }

    func testGetPvPRewardIndex() async throws { XCTAssert(true) }


    // MARK: PvP Tier API

    func testGetPvPTierMedia() async throws { XCTAssert(true) }
    func testGetPvPTierIndex() async throws { XCTAssert(true) }
    func testGetPvPTier() async throws { XCTAssert(true) }


    // MARK: Quest API

    func testGetQuestIndex() async throws { XCTAssert(true) }

    func testGetQuest() async throws {
        let id = 2
        _ = try await battleNetAPI.wow.decoded.getQuest(id: id)
    }

    func testGetQuestCategoryIndex() async throws { XCTAssert(true) }
    func testGetQuestCategory() async throws { XCTAssert(true) }
    func testGetQuestAreaIndex() async throws { XCTAssert(true) }
    func testGetQuestArea() async throws { XCTAssert(true) }
    func testGetQuestTypeIndex() async throws { XCTAssert(true) }
    func testGetQuestType() async throws { XCTAssert(true) }


    // MARK: Realm API

    func testGetRealmIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getRealmIndex()
    }

    func testGetRealm() async throws {
        let realmSlug = "tichondrius"
        _ = try await battleNetAPI.wow.decoded.getRealm(slug: realmSlug)
    }

    func testSearchRealm() async throws { XCTAssert(true) }


    // MARK: Region API

    func testGetRegionIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getRegions()
    }

    func testGetRegion() async throws {
        let id = 1
        _ = try await battleNetAPI.wow.decoded.getRegion(id: id)
    }


    // MARK: Reputations API

    func testGetReputationFactionIndex() async throws { XCTAssert(true) }
    func testGetReputationFaction() async throws { XCTAssert(true) }
    func testGetReputationTierIndex() async throws { XCTAssert(true) }
    func testGetReputationTier() async throws { XCTAssert(true) }


    // MARK: Spell API

    func testGetSpell() async throws {
        let id = 196607
        _ = try await battleNetAPI.wow.decoded.getSpell(id: id)
    }

    func testGetSpellMedia() async throws { XCTAssert(true) }
    func testSearchSpell() async throws { XCTAssert(true) }


    // MARK: Player Housing API

    func testGetDecorIndex() async throws { XCTAssert(true) }
    func testGetDecor() async throws { XCTAssert(true) }
    func testSearchDecor() async throws { XCTAssert(true) }
    func testGetFixtureIndex() async throws { XCTAssert(true) }
    func testGetFixture() async throws { XCTAssert(true) }
    func testSearchFixture() async throws { XCTAssert(true) }
    func testGetFixtureHookIndex() async throws { XCTAssert(true) }
    func testGetFixtureHook() async throws { XCTAssert(true) }
    func testSearchFixtureHook() async throws { XCTAssert(true) }
    func testGetNeighborhoodMapIndex() async throws { XCTAssert(true) }
    func testGetNeighborhoodMap() async throws { XCTAssert(true) }
    func testGetNeighborhood() async throws { XCTAssert(true) }
    func testGetRoomIndex() async throws { XCTAssert(true) }
    func testGetRoom() async throws { XCTAssert(true) }
    func testSearchRoom() async throws { XCTAssert(true) }


    // MARK: Talent API

    func testGetTalentIndex() async throws { XCTAssert(true) }
    func testGetTalent() async throws { XCTAssert(true) }
    func testGetPvPTalentIndex() async throws { XCTAssert(true) }
    func testGetPvPTalent() async throws { XCTAssert(true) }


    // MARK: Talent Tree API

    func testGetTalentTreeIndex() async throws { XCTAssert(true) }
    func testGetTalentTree() async throws { XCTAssert(true) }
    func testGetTalentTreeNodesForSpecialization() async throws { XCTAssert(true) }


    // MARK: Tech Talent API

    func testGetTechTalentTreeIndex() async throws { XCTAssert(true) }
    func testGetTechTalentTree() async throws { XCTAssert(true) }
    func testGetTechTalentIndex() async throws { XCTAssert(true) }
    func testGetTechTalent() async throws { XCTAssert(true) }
    func testGetTechTalentMedia() async throws { XCTAssert(true) }


    // MARK: Title API

    func testGetTitleIndex() async throws { XCTAssert(true) }
    func testGetTitle() async throws { XCTAssert(true) }


    // MARK: Token API

    func testGetTokenIndex() async throws {
        _ = try await battleNetAPI.wow.decoded.getTokens()
    }


    // MARK: Toy API

    func testGetToyIndex() async throws { XCTAssert(true) }
    func testGetToy() async throws { XCTAssert(true) }
}
