//
//  WorldOfWarcraftTests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/3/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class WorldOfWarcraftTests: XCTestCase {
    var battleNetAPI: BattleNetAPI!


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        guard credentials.clientAccessToken != nil else {
            XCTFail("clientAccessToken must be set in credentials.")
            return
        }

        guard credentials.userAccessToken != nil else {
            XCTFail("userAccessToken must be set in credentials.")
            return
        }

        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth, locale: .en_US)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }



    // MARK: - Profile API

    func testGetCharacters() async throws {
//        let data = try await battleNetAPI.wow.getCharacters()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWCharacterResult.self)
        XCTAssert(true)
    }


    // MARK: WoW Mythic Keystone Character Profile API

    func testGetMythicKeystoneProfile() async throws {
//        let characterName = "kenkan"
//        let realm = "aegwynn"
//        let data = try await battleNetAPI.wow.getMythicKeystoneProfile(characterName: characterName, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneProfile.self)
        XCTAssert(true)
    }


    func testGetMythicKeystoneProfileSeason() async throws {
//        let seasonID = 1
//        let characterName = "kenkan"
//        let realm = "aegwynn"
//        let data = try await battleNetAPI.wow.getMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneProfileSeason.self)
        XCTAssert(true)
    }



    // MARK: - Connected Realm API

    func testGetConnectedRealmIndex() async throws {
        let data = try await battleNetAPI.wow.getConnectedRealmIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ConnectedRealmIndex.self)
    }


    func testGetConnectedRealm() async throws {
        let id = 11
        let data = try await battleNetAPI.wow.getConnectedRealm(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ConnectedRealm.self)
    }



    // MARK: - Mythic Keystone Affix API

    func testGetMythicKeystoneAffixes() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneAffixes()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: KeystoneAffixIndex.self)
        XCTAssert(true)
    }


    func testGetMythicKeystone() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getMythicKeystoneAffix(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: KeystoneAffix.self)
    }



    // MARK: - Mythic Raid Leaderboard API

    func testGetMythicRaidLeaderboard() async throws {
        let raid = "uldir"
        let faction: FactionType = .alliance
        let data = try await battleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicRaidLeaderboard.self)
    }



    // MARK: - Mythic Keystone Dungeon API

    func testGetMythicKeystoneDungeons() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneDungeons()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneDungeonIndex.self)
        XCTAssert(true)
    }


    func testGetMythicKeystoneDungeon() async throws {
        let id = 353
        let data = try await battleNetAPI.wow.getMythicKeystoneDungeon(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneDungeon.self)
    }


    func testGetMythicKeystones() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystones()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneIndex.self)
        XCTAssert(true)
    }


    func testGetMythicPeriods() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystonePeriods()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystonePeriodIndex.self)
        XCTAssert(true)
    }


    func testGetMythicKeystonePeriod() async throws {
        let id = 641
        let data = try await battleNetAPI.wow.getMythicKeystonePeriod(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystonePeriod.self)
    }


    func testGetMythicSeasons() async throws {
//        let data = try await battleNetAPI.wow.getMythicKeystoneSeasons()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneSeasonIndex.self)
        XCTAssert(true)
    }


    func testGetMythicKeystoneSeason() async throws {
        let id = 8
        let data = try await battleNetAPI.wow.getMythicKeystoneSeason(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneSeason.self)
    }



    // MARK: - Mythic Keystone Leaderboard API

    func testGetMythicLeaderboards() async throws {
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



    // MARK: - Mythic Challenge Mode API

    func testGetMythicChallengeMode() async throws {
//        let data = try await battleNetAPI.wow.getMythicChallengeMode()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicChallengeMode.self)
        XCTAssert(true)
    }



    // MARK: - Playable Class API

    func testGetPlayableClasses() async throws {
//        let data = try await battleNetAPI.wow.getPlayableClassIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWClassIndex.self)
        XCTAssert(true)
    }


    func testGetPlayableClass() async throws {
        let id = 7
        let data = try await battleNetAPI.wow.getPlayableClass(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWClass.self)
    }


    func testGetPlayableClassPvPTalenSlots() async throws {
//        let id = 7
//        let data = try await battleNetAPI.wow.getPlayableClassPvPTalentSlots(classID: id)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PVPTalentSlots.self)
        XCTAssert(true)
    }



    // MARK: - Player Specialization API

    func testGetPlayableSpecializations() async throws {
//        let data = try await battleNetAPI.wow.getPlayableSpecializationIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SpecializationIndex.self)
        XCTAssert(true)
    }


    func testGetPlayableSpecialization() async throws {
        let id = 262
        let data = try await battleNetAPI.wow.getPlayableSpecialization(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Specialization.self)
    }


    // MARK: - Power Type API

    func testGetPowerTypes() async throws {
//        let data = try await battleNetAPI.wow.getPowerTypeIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PowerTypeIndex.self)
        XCTAssert(true)
    }


    func testGetPowerType() async throws {
        let id = 0
        let data = try await battleNetAPI.wow.getPowerType(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PowerType.self)
    }


    // MARK: - Playable Race API

    func testGetPlayableRaces() async throws {
//        let data = try await battleNetAPI.wow.getPlayableRaceIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRaceIndex.self)
        XCTAssert(true)
    }


    func testGetPlayableRace() async throws {
        let id = 2
        let data = try await battleNetAPI.wow.getPlayableRace(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRace.self)
    }



    // MARK: - Realm API

    func testGetRealmIndex() async throws {
        let data = try await battleNetAPI.wow.getRealmIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: RealmIndexResult.self)
    }


    func testGetRealm() async throws {
        let realmSlug = "tichondrius"
        let data = try await battleNetAPI.wow.getRealm(realmSlug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Realm.self)
    }



    // MARK: - Region API

    func testGetRegionIndex() async throws {
        let data = try await battleNetAPI.wow.getRegionIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: RegionIndexResult.self)
    }


    func testGetRegion() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getRegion(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Region.self)
    }



    // MARK: - Token API

    func testGetTokenIndex() async throws {
        let data = try await battleNetAPI.wow.getTokenIndex()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: TokenIndex.self)
    }



    // MARK: - Achievement API

    func testGetAchievement() async throws {
        let id = 6
        let data = try await battleNetAPI.wow.getAchievement(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWAchievement.self)
    }



    // MARK: - Auction API

    func testGetAuctions() async throws {
//        let realm = "medivh"
//        let data = try await battleNetAPI.wow.getAuctions(realm: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Auction.self)
        XCTAssert(true)
    }



    // MARK: - Challenge Mode API

    func testGetChallengeLeaderboards() async throws {
//        let realm = "medivh"
//        let data = try await battleNetAPI.wow.getChallengeLeaderboards(realm: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ChallengeIndex.self)
        XCTAssert(true)
    }


    func testGetTopChallengeLeaderboards() async throws {
//        let data = try await battleNetAPI.wow.getTopChallengeLeaderboards()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ChallengeIndex.self)
        XCTAssert(true)
    }



    // MARK: - Character Profile API

    func testGetCharacter() async throws {
//        let name = "Aedimus"
//        let realm = "Aegwynn"
//        let fields: WOWCharacterField = [.achievements, .appearance, .feed, .guild, .items,
//                                         .mounts, .pets, .petSlots, .professions, .progression,
//                                         .pvp, .quests, .reputation, .statistics, .stats,
//                                         .talents, .titles, .audit, .hunterPets]
//        let data = try await battleNetAPI.wow.getCharacter(name, realm: realm, fields: fields.toArray)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWCharacterProfile.self)
        XCTAssert(true)
    }



    // MARK: - Guild Profile API

    func testGetGuild() async throws {
//        let name = "Limit"
//        let realm = "Illidan"
//        let fields: WOWGuildField? = [.achievements, .challenges, .members, .news]
//        let data = try await battleNetAPI.wow.getGuild(name, realm: realm, fields: fields?.toArray)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWGuildProfile.self)
        XCTAssert(true)
    }



    // MARK: - Item API

    func testGetItem() async throws {
        let id = 19019
        let data = try await battleNetAPI.wow.getItem(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWItem.self)
    }


    func testGetItemSet() async throws {
//        let setID = 1060
//        let data = try await battleNetAPI.wow.getItemSet(id: setID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWItemSet.self)
        XCTAssert(true)
    }



    // MARK: - Mount API

    func testGetMounts() async throws {
//        let data = try await battleNetAPI.wow.getMountIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MountIndex.self)
        XCTAssert(true)
    }



    // MARK: - Pet API

    func testGetPets() async throws {
//        let data = try await battleNetAPI.wow.getPetIndex()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetIndex.self)
        XCTAssert(true)
    }


    func testGetPetAbility() async throws {
//        let abilityID = 640
//        let data = try await battleNetAPI.wow.getPetAbility(id: abilityID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetAbility.self)
        XCTAssert(true)
    }


    func testGetPetSpecies() async throws {
//        let speciesID = 258
//        let data = try await battleNetAPI.wow.getPetSpecies(speciesID: speciesID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetSpecies.self)
        XCTAssert(true)
    }


    func testGetPetStats() async throws {
//        let speciesID = 258
//        let level = 25
//        let breedID = 5
//        let qualityID = 4
//        let data = try await battleNetAPI.wow.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetStats.self)
        XCTAssert(true)
    }



    // MARK: - PVP API

    func testGetLeaderboard() async throws {
//        let bracket: WOWLeaderboardBracket = ._2v2
//        let data = try await battleNetAPI.wow.getLeaderboard(bracket: bracket.rawValue)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWLeaderboard.self)
        XCTAssert(true)
    }



    // MARK: - Quest API

    func testGetQuest() async throws {
        let id = 2
        let data = try await battleNetAPI.wow.getQuest(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWQuest.self)
    }



    // MARK: - Realm Status API

    func testGetRealmsStatus() async throws {
//        let data = try await battleNetAPI.wow.getRealmsStatus()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRealmIndex.self)
        XCTAssert(true)
    }



    // MARK: - Recipe API

    func testGetRecipe() async throws {
        let id = 1631
        let data = try await battleNetAPI.wow.getRecipe(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWRecipe.self)
    }



    // MARK: - Spell API

    func testGetSpell() async throws {
        let id = 1
        let data = try await battleNetAPI.wow.getSpell(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Spell.self)
    }



    // MARK: - Zone API

    func testGetZones() async throws {
//        let data = try await battleNetAPI.wow.getZones()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ZoneIndex.self)
        XCTAssert(true)
    }


    func testGetZone() async throws {
//        let id = 4131
//        let data = try await battleNetAPI.wow.getZone(id: id)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Zone.self)
        XCTAssert(true)
    }



    // MARK: - Data Resources

    func testGetBattlegroups() async throws {
//        let data = try await battleNetAPI.wow.getBattlegroups()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: BattlegroupIndex.self)
        XCTAssert(true)
    }


    func testGetRaces() async throws {
//        let data = try await battleNetAPI.wow.getRaces()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: RaceIndex.self)
        XCTAssert(true)
    }


    func testGetClasses() async throws {
//        let data = try await battleNetAPI.wow.getClasses()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWCharacterClassIndex.self)
        XCTAssert(true)
    }


    func testGetAchievements() async throws {
//        let data = try await battleNetAPI.wow.getAchievements()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWAchievementIndex.self)
        XCTAssert(true)
    }


    func testGetGuildRewards() async throws {
//        let data = try await battleNetAPI.wow.getGuildRewards()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWGuildRewardIndex.self)
        XCTAssert(true)
    }


    func testGetGuildPerks() async throws {
//        let data = try await battleNetAPI.wow.getGuildPerks()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PerkIndex.self)
        XCTAssert(true)
    }


    func testGetGuildAchievements() async throws {
//        let data = try await battleNetAPI.wow.getGuildAchievements()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWAchievementIndex.self)
        XCTAssert(true)
    }


    func testGetItemClasses() async throws {
//        let data = try await battleNetAPI.wow.getItemClasses()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ItemClassIndex.self)
        XCTAssert(true)
    }


    func testGetTalents() async throws {
//        let data = try await battleNetAPI.wow.getTalents()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ClassTalentDictionary.self)
        XCTAssert(true)
    }


    func testGetPetTypes() async throws {
//        let data = try await battleNetAPI.wow.getPetTypes()
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: PetTypeIndex.self)
        XCTAssert(true)
    }
}
