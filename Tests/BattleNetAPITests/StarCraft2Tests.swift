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
        _ = try await battleNetAPI.sc2.decoded.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league)
    }



    // MARK: - Community APIs

    // MARK: Profile API

    func testGetProfileData() async throws {
        let sc2Region: APIRegion = .us
        _ = try await battleNetAPI.sc2.decoded.getProfileData(sc2Region: sc2Region)
    }


    func testGetProfileMetadata() async throws {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        _ = try await battleNetAPI.sc2.decoded.getProfileMetadata(id: profileID, sc2Region: sc2Region, realmID: realmID)
    }


    func testGetProfile() async throws {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        _ = try await battleNetAPI.sc2.decoded.getProfile(id: profileID, sc2Region: sc2Region, realmID: realmID)
    }


    func testGetLadderSummary() async throws {
        let profileID = 7895938
        let sc2Region: APIRegion = .us
        let realmID = 1
        _ = try await battleNetAPI.sc2.decoded.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID)
    }


    func testGetLadder() async throws {
        let ladderID = 277454
        let profileID = 2060165
        let sc2Region: APIRegion = .us
        let realmID = 1
        _ = try await battleNetAPI.sc2.decoded.getLadder(id: ladderID, profileID: profileID, sc2Region: sc2Region, realmID: realmID)
    }


    // MARK: Ladder API

    func testGetGrandmasterLeaderboard() async throws {
        let sc2Region: APIRegion = .us
        _ = try await battleNetAPI.sc2.decoded.getGrandmasterLeaderboard(sc2Region: sc2Region)
    }


    func testGetLadderSeason() async throws {
        let sc2Region: APIRegion = .us
        _ = try await battleNetAPI.sc2.decoded.getLadderSeason(sc2Region: sc2Region)
    }



    // MARK: Account API

    func testGetPlayers() async throws {
        let accountID = 8
        _ = try await battleNetAPI.sc2.decoded.getPlayer(accountID: accountID)
    }
}
