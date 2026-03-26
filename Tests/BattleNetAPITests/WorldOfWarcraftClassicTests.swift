//
//  WorldOfWarcraftClassicTests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 3/25/26.
//  Copyright © 2026 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class WorldOfWarcraftClassicTests: XCTestCase {
    var battleNetAPI: BattleNetAPI!


    override func setUp() {
        super.setUp()

        guard credentials.clientAccessToken != nil else {
            XCTFail("clientAccessToken must be set in credentials.")
            return
        }

        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth, locale: .en_US)
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: - Game Data API

    // MARK: Auction House API

    func testGetAuctionHouseIndex() async throws { XCTAssert(true) }
    func testGetAuctionHouse() async throws { XCTAssert(true) }


    // MARK: Connected Realm API

    func testGetConnectedRealmIndex() async throws { XCTAssert(true) }
    func testGetConnectedRealm() async throws { XCTAssert(true) }
    func testSearchConnectedRealms() async throws { XCTAssert(true) }


    // MARK: Creature API

    func testGetCreatureFamilyIndex() async throws { XCTAssert(true) }
    func testGetCreatureFamily() async throws { XCTAssert(true) }
    func testGetCreatureTypeIndex() async throws { XCTAssert(true) }
    func testGetCreatureType() async throws { XCTAssert(true) }
    func testGetCreature() async throws { XCTAssert(true) }
    func testSearchCreature() async throws { XCTAssert(true) }
    func testGetCreatureDisplayMedia() async throws { XCTAssert(true) }
    func testGetCreatureFamilyMedia() async throws { XCTAssert(true) }


    // MARK: Guild Crest API

    func testGetGuildCrestIndex() async throws { XCTAssert(true) }
    func testGetGuildCrestBorderMedia() async throws { XCTAssert(true) }
    func testGetGuildCrestEmblemMedia() async throws { XCTAssert(true) }


    // MARK: Item API

    func testGetItemClassIndex() async throws { XCTAssert(true) }
    func testGetItemClass() async throws { XCTAssert(true) }
    func testGetItemSubclass() async throws { XCTAssert(true) }
    func testGetItem() async throws { XCTAssert(true) }
    func testGetItemMedia() async throws { XCTAssert(true) }
    func testSearchItem() async throws { XCTAssert(true) }


    // MARK: Media Search API

    func testSearchMedia() async throws { XCTAssert(true) }


    // MARK: Playable Class API

    func testGetPlayableClassIndex() async throws { XCTAssert(true) }
    func testGetPlayableClass() async throws { XCTAssert(true) }
    func testGetPlayableClassMedia() async throws { XCTAssert(true) }


    // MARK: Playable Race API

    func testGetPlayableRaceIndex() async throws { XCTAssert(true) }
    func testGetPlayableRace() async throws { XCTAssert(true) }


    // MARK: Power Type API

    func testGetPowerTypeIndex() async throws { XCTAssert(true) }
    func testGetPowerType() async throws { XCTAssert(true) }


    // MARK: PvP Season API

    func testGetPvPSeasonIndex() async throws { XCTAssert(true) }
    func testGetPvPSeason() async throws { XCTAssert(true) }

    func testGetPvPRegionIndex() async throws { XCTAssert(true) }
    func testGetPvPRegionSeasonIndex() async throws { XCTAssert(true) }
    func testGetPvPRegionSeason() async throws { XCTAssert(true) }
    func testGetPvPRegionSeasonLeaderboardIndex() async throws { XCTAssert(true) }
    func testGetPvPRegionSeasonLeaderboard() async throws { XCTAssert(true) }
    func testGetPvPRegionSeasonRewardIndex() async throws { XCTAssert(true) }


    // MARK: Realm API

    func testGetRealmIndex() async throws { XCTAssert(true) }
    func testGetRealm() async throws { XCTAssert(true) }
    func testSearchRealm() async throws { XCTAssert(true) }


    // MARK: Region API

    func testGetRegionIndex() async throws { XCTAssert(true) }
    func testGetRegion() async throws { XCTAssert(true) }


    // MARK: Token API

    func testGetTokenIndex() async throws { XCTAssert(true) }
}
