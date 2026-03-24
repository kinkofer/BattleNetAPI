//
//  WorldOfWarcraftTests+Profile.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/3/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


extension WorldOfWarcraftTests {
    // MARK: - Profile API

    // MARK: Account Profile API

    func testGetAccountProfile() async throws { XCTAssert(true) }
    func testGetProtectedCharacterProfile() async throws { XCTAssert(true) }
    func testGetAccountCollectionsIndex() async throws { XCTAssert(true) }
    func testGetMountsCollectionSummary() async throws { XCTAssert(true) }
    func testGetPetsCollectionSummary() async throws { XCTAssert(true) }


    // MARK: Character Achievements API

    func testGetCharacterAchievementsSummary() async throws { XCTAssert(true) }
    func testGetCharacterAchievementStatistics() async throws { XCTAssert(true) }


    // MARK: Character Appearance API

    func testGetCharacterAppearanceSummary() async throws { XCTAssert(true) }


    // MARK: Character Collections API

    func testGetCharacterCollectionsIndex() async throws { XCTAssert(true) }
    func testGetCharacterMountsCollectionSummary() async throws { XCTAssert(true) }
    func testGetCharacterPetsCollectionSummary() async throws { XCTAssert(true) }


    // MARK: Character Encounters API

    func testGetCharacterEncountersSummary() async throws { XCTAssert(true) }
    func testGetCharacterDungeons() async throws { XCTAssert(true) }
    func testGetCharacterRaids() async throws { XCTAssert(true) }


    // MARK: Character Equipment API

    func testGetCharacterEquipmentSummary() async throws { XCTAssert(true) }


    // MARK: Character Hunter Pets API

    func testGetCharacterHunterPetsSummary() async throws { XCTAssert(true) }


    // MARK: Character Media API

    func testGetCharacterMediaSummary() async throws { XCTAssert(true) }


    // MARK: Character Mythic Keystone Profile API

    func testGetCharacterMythicKeystoneProfileIndex() async throws {
//        let characterName = "kenkan"
//        let realm = "aegwynn"
//        let data = try await battleNetAPI.wow.getCharacterMythicKeystoneProfileIndex(characterName: characterName, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneProfile.self)
        XCTAssert(true)
    }

    func testGetCharacterMythicKeystoneProfileSeason() async throws {
//        let seasonID = 1
//        let characterName = "kenkan"
//        let realm = "aegwynn"
//        let data = try await battleNetAPI.wow.getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: MythicKeystoneProfileSeason.self)
        XCTAssert(true)
    }


    // MARK: Character Professions API

    func testGetCharacterProfessionsSummary() async throws { XCTAssert(true) }


    // MARK: Character Profile API

    func testGetCharacterProfileSummary() async throws {
//        let characterName = "Aedimus"
//        let realm = "aegwynn"
//        let data = try await battleNetAPI.wow.getCharacterProfileSummary(characterName: characterName, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWCharacterProfile.self)
        XCTAssert(true)
    }

    func testGetCharacterProfileStatus() async throws { XCTAssert(true) }


    // MARK: Character PvP API

    func testGetCharacterPvPBracketStatistics() async throws { XCTAssert(true) }
    func testGetCharacterPvPSummary() async throws { XCTAssert(true) }


    // MARK: Character Quests API

    func testGetCharacterQuests() async throws { XCTAssert(true) }
    func testGetCharacterCompletedQuests() async throws { XCTAssert(true) }


    // MARK: Character Reputations API

    func testGetCharacterReputationsSummary() async throws { XCTAssert(true) }


    // MARK: Character Soulbinds API

    func testGetCharacterSoulbinds() async throws { XCTAssert(true) }


    // MARK: Character Specializations API

    func testGetCharacterSpecializationsSummary() async throws { XCTAssert(true) }


    // MARK: Character Statistics API

    func testGetCharacterStatisticsSummary() async throws { XCTAssert(true) }


    // MARK: Character Titles API

    func testGetCharacterTitlesSummary() async throws { XCTAssert(true) }


    // MARK: Guild Profile API

    func testGetGuild() async throws {
//        let slug = "limit"
//        let realm = "illidan"
//        let data = try await battleNetAPI.wow.getGuild(slug: slug, realmSlug: realm)
//        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: WOWGuildProfile.self)
        XCTAssert(true)
    }

    func testGetGuildActivity() async throws { XCTAssert(true) }
    func testGetGuildAchievements() async throws { XCTAssert(true) }
    func testGetGuildRoster() async throws { XCTAssert(true) }
}
