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
    let region: APIRegion = .us
    let locale: APILocale = .en_US
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        BattleNetAPI.authenticationLegacy.setApikeyLegacy(clientID)
        
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
        
        BattleNetAPI.sc2.getCharacters(region: region) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2CharacterIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Profile API
    
    func testGetCharacter() {
        let id = 2541852
        let profileName = "MaSa"
        let sc2Region = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getProfile(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2Character.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLadders() {
        let id = 2541852
        let profileName = "MaSa"
        let sc2Region = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getLadders(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: LadderOverview.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetMatches() {
        let id = 2541852
        let profileName = "MaSa"
        let sc2Region = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getMatches(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: MatchIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Ladder API
    
    func testGetLadder() {
        let id = 263156
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getLadder(id: id, region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Ladder.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Data Resources
    
    func testGetAchievements() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getAchievements(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2AchievementIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetRewards() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.sc2Legacy.getRewards(region: region, locale: locale) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SC2RewardIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
}
