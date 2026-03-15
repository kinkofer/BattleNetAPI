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
        XCTAssert(true)
    }

    func testGetAchievementCategory() async throws {
        XCTAssert(true)
    }

    func testGetAchievementIndex() async throws {
        XCTAssert(true)
    }

    func testGetAchievement() async throws {
        let id = 6
        let data = try await battleNetAPI.wow.getAchievement(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWAchievement.self)
    }

    func testGetAchievementMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Auction House API

    func testGetAuctions() async throws {
//        let connectedRealmID = 11
//        let data = try await battleNetAPI.wow.getAuctions(connectedRealmID: connectedRealmID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Auction.self)
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
        let data = try await battleNetAPI.wow.getConnectedRealmIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ConnectedRealmIndex.self)
    }

    func testGetConnectedRealm() async throws {
        let id = 11
        let data = try await battleNetAPI.wow.getConnectedRealm(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ConnectedRealm.self)
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
//        let setID = 1060
//        let data = try await battleNetAPI.wow.getItemSet(id: setID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWItemSet.self)
        XCTAssert(true)
    }

    func testGetItemSubclass() async throws {
        XCTAssert(true)
    }

    func testGetItem() async throws {
        let id = 19019
        let data = try await battleNetAPI.wow.getItem(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWItem.self)
    }

    func testGetItemMedia() async throws {
        XCTAssert(true)
    }

    func testSearchItem() async throws {
        XCTAssert(true)
    }


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
//        let data = try await battleNetAPI.wow.getMountIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MountIndex.self)
        XCTAssert(true)
    }

    func testGetMount() async throws {
        XCTAssert(true)
    }

    func testSearchMount() async throws {
        XCTAssert(true)
    }


    // MARK: Mythic Keystone Affix API

    func testGetMythicKeystoneAffixIndex() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneAffixIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: KeystoneAffixIndex.self)
        XCTAssert(true)
    }

    func testGetMythicKeystoneAffix() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getMythicKeystoneAffix(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: KeystoneAffix.self)
    }

    func testGetMythicKeystoneAffixMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Mythic Keystone Dungeon API

    func testGetMythicKeystoneDungeonIndex() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneDungeonIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneDungeonIndex.self)
        XCTAssert(true)
    }

    func testGetMythicKeystoneDungeon() async throws {
        let id = 353
        let data = try await battleNetAPI.wow.getMythicKeystoneDungeon(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneDungeon.self)
    }


    // MARK: Mythic Keystone Leaderboard API

    func testGetMythicKeystoneIndex() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneIndex.self)
        XCTAssert(true)
    }

    func testGetMythicKeystonePeriodIndex() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystonePeriodIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystonePeriodIndex.self)
        XCTAssert(true)
    }

    func testGetMythicKeystonePeriod() async throws {
        let id = 641
        let data = try await battleNetAPI.wow.getMythicKeystonePeriod(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystonePeriod.self)
    }

    func testGetMythicKeystoneSeasonIndex() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneSeasonIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneSeasonIndex.self)
        XCTAssert(true)
    }

    func testGetMythicKeystoneSeason() async throws {
        let id = 8
        let data = try await battleNetAPI.wow.getMythicKeystoneSeason(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneSeason.self)
    }

    func testGetMythicLeaderboardIndex() async throws {
//        let connectedRealmID = 11
//        let data = try await battleNetAPI.wow.getMythicLeaderboardIndex(connectedRealmID: connectedRealmID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicLeaderboardIndex.self)
        XCTAssert(true)
    }

    func testGetMythicLeaderboard() async throws {
        let connectedRealmID = 11
        let dungeonID = 197
        let period = 641
        let data = try await battleNetAPI.wow.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicLeaderboard.self)
    }


    // MARK: Mythic Raid Leaderboard API

    func testGetMythicRaidLeaderboard() async throws {
        let raid = "uldir"
        let faction: FactionType = .alliance
        let data = try await battleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicRaidLeaderboard.self)
    }


    // MARK: Pet API

    func testGetPetIndex() async throws {
//        let data = try await battleNetAPI.wow.getPetIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetIndex.self)
        XCTAssert(true)
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
//        let abilityID = 640
//        let data = try await battleNetAPI.wow.getPetAbility(id: abilityID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetAbility.self)
        XCTAssert(true)
    }

    func testGetPetAbilityMedia() async throws {
        XCTAssert(true)
    }


    // MARK: Playable Class API

    func testGetPlayableClassIndex() async throws {
//        let data = try await battleNetAPI.wow.getPlayableClassIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWClassIndex.self)
        XCTAssert(true)
    }

    func testGetPlayableClass() async throws {
        let id = 7
        let data = try await battleNetAPI.wow.getPlayableClass(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWClass.self)
    }

    func testGetPlayableClassMedia() async throws {
        XCTAssert(true)
    }

    func testGetPlayableClassPvPTalentSlots() async throws {
//        let id = 7
//        let data = try await battleNetAPI.wow.getPlayableClassPvPTalentSlots(classID: id)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PVPTalentSlots.self)
        XCTAssert(true)
    }


    // MARK: Playable Race API

    func testGetPlayableRaceIndex() async throws {
//        let data = try await battleNetAPI.wow.getPlayableRaceIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRaceIndex.self)
        XCTAssert(true)
    }

    func testGetPlayableRace() async throws {
        let id = 2
        let data = try await battleNetAPI.wow.getPlayableRace(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRace.self)
    }


    // MARK: Playable Specialization API

    func testGetPlayableSpecializationIndex() async throws {
//        let data = try await battleNetAPI.wow.getPlayableSpecializationIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SpecializationIndex.self)
        XCTAssert(true)
    }

    func testGetPlayableSpecialization() async throws {
        let id = 262
        let data = try await battleNetAPI.wow.getPlayableSpecialization(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Specialization.self)
    }

    func testGetPlayableSpecializationMedia() async throws { XCTAssert(true) }


    // MARK: Power Type API

    func testGetPowerTypeIndex() async throws {
//        let data = try await battleNetAPI.wow.getPowerTypeIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PowerTypeIndex.self)
        XCTAssert(true)
    }

    func testGetPowerType() async throws {
        let id = 0
        let data = try await battleNetAPI.wow.getPowerType(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PowerType.self)
    }


    // MARK: Profession API

    func testGetProfessionIndex() async throws { XCTAssert(true) }
    func testGetProfession() async throws { XCTAssert(true) }
    func testGetProfessionMedia() async throws { XCTAssert(true) }
    func testGetProfessionSkillTier() async throws { XCTAssert(true) }

    func testGetRecipe() async throws {
        let id = 1631
        let data = try await battleNetAPI.wow.getRecipe(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRecipe.self)
    }

    func testGetRecipeMedia() async throws { XCTAssert(true) }


    // MARK: PvP Season API

    func testGetPvPSeasonIndex() async throws { XCTAssert(true) }
    func testGetPvPSeason() async throws { XCTAssert(true) }
    func testGetPvPLeaderboardIndex() async throws { XCTAssert(true) }
    func testGetPvPLeaderboard() async throws { XCTAssert(true) }
    func testGetPvPRewardIndex() async throws { XCTAssert(true) }


    // MARK: PvP Tier API

    func testGetPvPTierMedia() async throws { XCTAssert(true) }
    func testGetPvPTierIndex() async throws { XCTAssert(true) }
    func testGetPvPTier() async throws { XCTAssert(true) }


    // MARK: Quest API

    func testGetQuestIndex() async throws { XCTAssert(true) }

    func testGetQuest() async throws {
        let id = 2
        let data = try await battleNetAPI.wow.getQuest(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWQuest.self)
    }

    func testGetQuestCategoryIndex() async throws { XCTAssert(true) }
    func testGetQuestCategory() async throws { XCTAssert(true) }
    func testGetQuestAreaIndex() async throws { XCTAssert(true) }
    func testGetQuestArea() async throws { XCTAssert(true) }
    func testGetQuestTypeIndex() async throws { XCTAssert(true) }
    func testGetQuestType() async throws { XCTAssert(true) }


    // MARK: Realm API

    func testGetRealmIndex() async throws {
        let data = try await battleNetAPI.wow.getRealmIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: RealmIndexResult.self)
    }

    func testGetRealm() async throws {
        let realmSlug = "tichondrius"
        let data = try await battleNetAPI.wow.getRealm(realmSlug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Realm.self)
    }

    func testSearchRealm() async throws { XCTAssert(true) }


    // MARK: Region API

    func testGetRegionIndex() async throws {
        let data = try await battleNetAPI.wow.getRegionIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: RegionIndexResult.self)
    }

    func testGetRegion() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getRegion(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Region.self)
    }


    // MARK: Reputations API

    func testGetReputationFactionIndex() async throws { XCTAssert(true) }
    func testGetReputationFaction() async throws { XCTAssert(true) }
    func testGetReputationTierIndex() async throws { XCTAssert(true) }
    func testGetReputationTier() async throws { XCTAssert(true) }


    // MARK: Spell API

    func testGetSpell() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getSpell(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Spell.self)
    }

    func testGetSpellMedia() async throws { XCTAssert(true) }
    func testSearchSpell() async throws { XCTAssert(true) }


    // MARK: Talent API

    func testGetTalentIndex() async throws { XCTAssert(true) }
    func testGetTalent() async throws { XCTAssert(true) }
    func testGetPvPTalentIndex() async throws { XCTAssert(true) }
    func testGetPvPTalent() async throws { XCTAssert(true) }


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
        let data = try await battleNetAPI.wow.getTokenIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: TokenIndex.self)
    }
}
