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
        
        battleNetAPI = BattleNetAPI(credentials: credentials)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    // MARK: - Game Data APIs
    
    func testGetLeague() {
        let seasonID = 37
        let queue: LeagueQueue = .lotV1v1
        let team: LeagueTeam = .arranged
        let league: LeagueType = .grandmaster
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: League.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Community APIs
    
    // MARK: Profile API
    
    func testGetProfileData() {
        let sc2Region: APIRegion = .us
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getProfileData(sc2Region: sc2Region) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2ProfileData.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetProfileMetadata() {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getProfileMetadata(id: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2ProfileMetadata.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetProfile() {
        let profileID = 266515
        let sc2Region: APIRegion = .us
        let realmID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getProfile(id: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2Profile.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLadderSummary() {
        let profileID = 7895938
        let sc2Region: APIRegion = .us
        let realmID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: LadderSummary.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLadder() {
        let ladderID = 277454
        let profileID = 2060165
        let sc2Region: APIRegion = .us
        let realmID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getLadder(id: ladderID, profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Ladder.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    // MARK: Ladder API
    
    func testGetGrandmasterLeaderboard() {
        let sc2Region: APIRegion = .us
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: sc2Region) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: GrandmasterLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLadderSeason() {
        let sc2Region: APIRegion = .us
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getLadderSeason(sc2Region: sc2Region) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2Season.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: Account API
    
    func testGetPlayers() {
        let accountID = 8
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.sc2.getPlayer(accountID: accountID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: [SC2ProfileMetadata].self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
}
