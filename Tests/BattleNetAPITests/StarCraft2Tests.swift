//
//  StarCraft2Tests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/3/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class StarCraft2Tests: XCTestCase {
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

        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }



    // MARK: - Game Data APIs

    func testGetLeague() async throws {
        let seasonID = 37
        let queue: LeagueQueue = .lotV1v1
        let team: LeagueTeam = .arranged
        let league: LeagueType = .grandmaster
        let data = try await battleNetAPI.sc2.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: League.self)
    }



    // MARK: - Community APIs

    // MARK: Profile API

    func testGetProfileData() async throws {
        let sc2Region: APIRegion = .us
        let data = try await battleNetAPI.sc2.getProfileData(sc2Region: sc2Region)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SC2ProfileData.self)
    }


    func testGetProfileMetadata() async throws {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        let data = try await battleNetAPI.sc2.getProfileMetadata(id: profileID, sc2Region: sc2Region, realmID: realmID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SC2ProfileMetadata.self)
    }


    func testGetProfile() async throws {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        let data = try await battleNetAPI.sc2.getProfile(id: profileID, sc2Region: sc2Region, realmID: realmID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SC2Profile.self)
    }


    func testGetLadderSummary() async throws {
        let profileID = 7895938
        let sc2Region: APIRegion = .us
        let realmID = 1
        let data = try await battleNetAPI.sc2.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: LadderSummary.self)
    }


    func testGetLadder() async throws {
        let ladderID = 277454
        let profileID = 2060165
        let sc2Region: APIRegion = .us
        let realmID = 1
        let data = try await battleNetAPI.sc2.getLadder(id: ladderID, profileID: profileID, sc2Region: sc2Region, realmID: realmID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Ladder.self)
    }


    // MARK: Ladder API

    func testGetGrandmasterLeaderboard() async throws {
        let sc2Region: APIRegion = .us
        let data = try await battleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: sc2Region)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: GrandmasterLeaderboard.self)
    }


    func testGetLadderSeason() async throws {
        let sc2Region: APIRegion = .us
        let data = try await battleNetAPI.sc2.getLadderSeason(sc2Region: sc2Region)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SC2Season.self)
    }



    // MARK: Account API

    func testGetPlayers() async throws {
        let accountID = 8
        let data = try await battleNetAPI.sc2.getPlayer(accountID: accountID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: [SC2ProfileMetadata].self)
    }

}
