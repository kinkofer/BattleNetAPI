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
    let region: APIRegion = Current.region
    let locale: APILocale = Current.locale
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        guard let clientAccessToken = clientAccessToken else {
            XCTFail("clientAccessToken must be set in AuthToken. The token is logged in the console when running ViewController.viewDidLoad().")
            return
        }
        
        guard let userAccessToken = userAccessToken else {
            XCTFail("userAccessToken must be set in AuthToken. The token is logged in the console when running authenticateUser(showAPI:).")
            return
        }
        
        Network.shared.clientAccessToken = clientAccessToken
        Network.shared.userAccessToken = userAccessToken
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    // MARK: - Profile API
    
    func testGetCharacters() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getCharacters(region: region) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWCharacterResult.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    // MARK: WoW Mythic Keystone Character Profile API
    
    func testGetMythicKeystoneProfile() {
        let characterName = "kenkan"
        let realm = "aegwynn"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneProfile(characterName: characterName, realmSlug: realm, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneProfile.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystoneProfileSeason() {
        let seasonID = 1
        let characterName = "kenkan"
        let realm = "aegwynn"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realm, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneProfileSeason.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Connected Realm API
    
    func testGetConnectedRealmIndex() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getConnectedRealmIndex(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ConnectedRealmIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetConnectedRealm() {
        let id = 11
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getConnectedRealm(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ConnectedRealm.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mythic Keystone Affix API
    
    func testGetMythicKeystoneAffixes() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneAffixes(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: KeystoneAffixIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystone() {
        let id = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneAffix(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: KeystoneAffix.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mythic Raid Leaderboard API
    
    func testGetMythicRaidLeaderboard() {
        let raid = "uldir"
        let faction: FactionType = .alliance
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicRaidLeaderboard(raid: raid, faction: faction, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicRaidLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mythic Keystone Dungeon API
    
    func testGetMythicKeystoneDungeons() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneDungeons(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneDungeonIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystoneDungeon() {
        let id = 353
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneDungeon(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneDungeon.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystones() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystones(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicPeriods() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystonePeriods(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystonePeriodIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystonePeriod() {
        let id = 641
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystonePeriod(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystonePeriod.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicSeasons() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneSeasons(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneSeasonIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicKeystoneSeason() {
        let id = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicKeystoneSeason(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicKeystoneSeason.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mythic Keystone Leaderboard API
    
    func testGetMythicLeaderboards() {
        let connectedRealmID = 11
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicLeaderboards(connectedRealmID: connectedRealmID, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicLeaderboardIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMythicLeaderboard() {
        let connectedRealmID = 11
        let dungeonID = 197
        let period = 641
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mythic Challenge Mode API
    
    func testGetMythicChallengeMode() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMythicChallengeMode(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MythicChallengeMode.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Playable Class API
    
    func testGetPlayableClasses() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableClasses(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWClassIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPlayableClass() {
        let id = 7
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableClass(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWClass.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPlayableClassPvPTalenSlots() {
        let id = 7
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableClassPvPTalentSlots(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PVPTalentSlots.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Player Specialization API
    
    func testGetPlayableSpecializations() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableSpecializations(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SpecializationIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPlayableSpecialization() {
        let id = 262
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableSpecialization(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Specialization.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    // MARK: - Power Type API
    
    func testGetPowerTypes() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPowerTypes(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PowerTypeIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPowerType() {
        let id = 0
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPowerType(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PowerType.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    // MARK: - Playable Race API
    
    func testGetPlayableRaces() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableRaces(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWRaceIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPlayableRace() {
        let id = 2
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPlayableRace(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWRace.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Realm API
    
    func testGetRealmIndex() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRealmIndex(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: RealmIndexResult.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetRealm() {
        let realmSlug = "tichondrius"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRealm(realmSlug, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Realm.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Region API
    
    func testGetRegionIndex() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRegionIndex(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: RegionIndexResult.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetRegion() {
        let id = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRegion(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Region.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Token API
    
    func testGetTokenIndex() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getTokenIndex(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: TokenIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Achievement API
    
    func testGetAchievement() {
        let id = 2144
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getAchievement(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWAchievement.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Auction API
    
    func testGetAuctions() {
        let realm = "medivh"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getAuctions(realm: realm, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Auction.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Boss API
    
    func testGetBosses() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getBosses(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: BossIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetBoss() {
        let id = 24723
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getBoss(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Boss.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Challenge Mode API
    
    func testGetChallengeLeaderboards() {
        let realm = "medivh"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getChallengeLeaderboards(realm: realm, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ChallengeIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetTopChallengeLeaderboards() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getTopChallengeLeaderboards(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ChallengeIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Character Profile API
    
    func testGetCharacter() {
        let name = "Aedimus"
        let realm = "Aegwynn"
        let fields: WOWCharacterField = [.achievements, .appearance, .feed, .guild, .items,
                                         .mounts, .pets, .petSlots, .professions, .progression,
                                         .pvp, .quests, .reputation, .statistics, .stats,
                                         .talents, .titles, .audit, .hunterPets]
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getCharacter(name, realm: realm, fields: fields.toArray, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWCharacterProfile.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Guild Profile API
    
    func testGetGuild() {
        let name = "Limit"
        let realm = "Illidan"
        let fields: WOWGuildField? = [.achievements, .challenges, .members, .news]
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getGuild(name, realm: realm, fields: fields?.toArray, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWGuildProfile.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Item API
    
    func testGetItem() {
        let id = 18803
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getItem(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWItem.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetItemSet() {
        let setID = 1060
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getItemSet(setID: setID, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWItemSet.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Mount API
    
    func testGetMounts() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getMounts(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MountIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Pet API
    
    func testGetPets() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPets(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PetIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPetAbility() {
        let abilityID = 640
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPetAbility(abilityID: abilityID, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PetAbility.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPetSpecies() {
        let speciesID = 258
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPetSpecies(speciesID: speciesID, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PetSpecies.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPetStats() {
        let speciesID = 258
        let level = 25
        let breedID = 5
        let qualityID = 4
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PetStats.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - PVP API
    
    func testGetLeaderboard() {
        let bracket: WOWLeaderboardBracket = ._2v2
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getLeaderboard(bracket: bracket.rawValue, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Quest API
    
    func testGetQuest() {
        let id = 13146
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getQuest(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWQuest.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Realm Status API
    
    func testGetRealmsStatus() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRealmsStatus(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWRealmIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Recipe API
    
    func testGetRecipe() {
        let id = 33994
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRecipe(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWRecipe.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Spell API
    
    func testGetSpell() {
        let id = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getSpell(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Spell.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Zone API
    
    func testGetZones() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getZones(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ZoneIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetZone() {
        let id = 4131
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getZone(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Zone.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Data Resources
    
    func testGetBattlegroups() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getBattlegroups(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: BattlegroupIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetRaces() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getRaces(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: RaceIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetClasses() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getClasses(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWCharacterClassIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetAchievements() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getAchievements(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWAchievementIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetGuildRewards() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getGuildRewards(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWGuildRewardIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetGuildPerks() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getGuildPerks(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PerkIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetGuildAchievements() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getGuildAchievements(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: WOWAchievementIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetItemClasses() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getItemClasses(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ItemClassIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetTalents() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getTalents(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ClassTalentDictionary.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetPetTypes() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.wow.getPetTypes(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: PetTypeIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
}
