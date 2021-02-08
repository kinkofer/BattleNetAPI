//
//  Diablo3Tests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/2/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class Diablo3Tests: XCTestCase {
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
    
    
    
    // MARK: - Act API
    
    func testGetActs() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getActs { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ActIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetAct() {
        let id = 5
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getAct(id: id) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Act.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    func testGetArtisan() {
        let slug = "blacksmith"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getArtisan(slug: slug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Artisan.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetRecipe() {
        let recipeSlug = "apprentice-flamberge"
        let artisanSlug = "blacksmith"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3Recipe.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Follower API
    
    func testGetFollower() {
        let slug = "templar"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getFollower(slug: slug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Follower.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    func testGetClass() {
        let slug = "barbarian"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getClass(slug: slug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3Class.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetSkill() {
        let skillSlug = "bash"
        let classSlug = "barbarian"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getSkill(skillSlug: skillSlug, classSlug: classSlug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3SkillConfiguration.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Item Type API
    
    func testGetItemTypes() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getItemTypes() { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: [D3ItemType].self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetItemsByType() {
        let typeSlug = "sword2h"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getItemsByType(typeSlug: typeSlug) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: [D3Item].self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Item API
    
    func testGetItem() {
        let itemSlugAndID = "corrupted-ashbringer-Unique_Sword_2H_104_x1"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getItem(itemSlugAndID: itemSlugAndID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3FullItem.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Profile API
    
    func testGetProfile() {
        let battleTag = "kinkofer-11254"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getProfile(battleTag: battleTag) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3Profile.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetHero() {
        let heroID = 88095369
        let battleTag = "hionpotuse-1872"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getHero(heroID: heroID, battleTag: battleTag) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: FullHero.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetItems() {
        let heroID = 99983354
        let battleTag = "kinkofer-11254"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getItemsForHero(heroID: heroID, battleTag: battleTag) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: FullEquippedItems.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<HeroFollowerItems, HTTPError>) -> Void) {
        let heroID = 88095369
        let battleTag = "hionpotuse-1872"
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: HeroFollowerItems.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    
    // MARK: - Game Data API
    
    func testGetSeasons() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getSeasons { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3SeasonIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLeaderboardsForSeason() {
        let seasonID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getLeaderboards(seasonID: seasonID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: D3SeasonLeaderboardIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLeaderboardForSeason() {
        let leaderboard = "achievement-points"
        let seasonID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getLeaderboard(leaderboard, seasonID: seasonID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: SeasonLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetEras() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getEras { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: EraIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLeaderboardsForEra() {
        let eraID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getLeaderboards(eraID: eraID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: EraLeaderboardIndex.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testGetLeaderboardForEra() {
        let leaderboard = "rift-barbarian"
        let eraID = 1
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.d3.getLeaderboard(leaderboard, eraID: eraID) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: EraLeaderboard.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 20) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
}
