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
        
        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    // MARK: - Act API
    
    func testGetActs() async throws {
        let data = try await battleNetAPI.d3.getActs()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ActIndex.self)
    }
    
    
    func testGetAct() async throws {
        let id = 5
        let data = try await battleNetAPI.d3.getAct(id: id)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Act.self)
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    func testGetArtisan() async throws {
        let slug = "blacksmith"
        let data = try await battleNetAPI.d3.getArtisan(slug: slug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Artisan.self)
    }
    
    
    func testGetRecipe() async throws {
        let recipeSlug = "apprentice-flamberge"
        let artisanSlug = "blacksmith"
        let data = try await battleNetAPI.d3.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3Recipe.self)
    }
    
    
    
    // MARK: - Follower API
    
    func testGetFollower() async throws {
        let slug = "templar"
        let data = try await battleNetAPI.d3.getFollower(slug: slug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Follower.self)
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    func testGetClass() async throws {
        let slug = "barbarian"
        let data = try await battleNetAPI.d3.getClass(slug: slug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3Class.self)
    }
    
    
    func testGetSkill() async throws {
        let skillSlug = "bash"
        let classSlug = "barbarian"
        let data = try await battleNetAPI.d3.getSkill(skillSlug: skillSlug, classSlug: classSlug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3SkillConfiguration.self)
    }
    
    
    
    // MARK: - Item Type API
    
    func testGetItemTypes() async throws {
        let data = try await battleNetAPI.d3.getItemTypes()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: [D3ItemType].self)
    }
    
    
    func testGetItemsByType() async throws {
        let typeSlug = "sword2h"
        let data = try await battleNetAPI.d3.getItemsByType(typeSlug: typeSlug)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: [D3Item].self)
    }
    
    
    
    // MARK: - Item API
    
    func testGetItem() async throws {
        let itemSlugAndID = "corrupted-ashbringer-Unique_Sword_2H_104_x1"
        let data = try await battleNetAPI.d3.getItem(itemSlugAndID: itemSlugAndID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3FullItem.self)
    }
    
    
    
    // MARK: - Profile API
    
    func testGetProfile() async throws {
        let battleTag = "okappa-11821"
        let data = try await battleNetAPI.d3.getProfile(battleTag: battleTag)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3Profile.self)
    }
    
    
    func testGetHero() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        let data = try await battleNetAPI.d3.getHero(heroID: heroID, battleTag: battleTag)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: FullHero.self)
    }
    
    
    func testGetItems() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        let data = try await battleNetAPI.d3.getItemsForHero(heroID: heroID, battleTag: battleTag)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: FullEquippedItems.self)
    }
    
    
    func testGetFollowerItems() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        let data = try await battleNetAPI.d3.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: HeroFollowerItems.self)
    }
    
    
    
    // MARK: - Game Data API
    
    func testGetSeasons() async throws {
        let data = try await battleNetAPI.d3.getSeasons()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3SeasonIndex.self)
    }
    
    
    func testGetLeaderboardsForSeason() async throws {
        let seasonID = 1
        let data = try await battleNetAPI.d3.getLeaderboards(seasonID: seasonID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: D3SeasonLeaderboardIndex.self)
    }
    
    
    func testGetLeaderboardForSeason() async throws {
        let leaderboard = "achievement-points"
        let seasonID = 1
        let data = try await battleNetAPI.d3.getLeaderboard(leaderboard, seasonID: seasonID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: SeasonLeaderboard.self)
    }
    
    
    func testGetEras() async throws {
        let data = try await battleNetAPI.d3.getEras()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: EraIndex.self)
    }
    
    
    func testGetLeaderboardsForEra() async throws {
        let eraID = 1
        let data = try await battleNetAPI.d3.getLeaderboards(eraID: eraID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: EraLeaderboardIndex.self)
    }
    
    
    func testGetLeaderboardForEra() async throws {
        let leaderboard = "rift-barbarian"
        let eraID = 1
        let data = try await battleNetAPI.d3.getLeaderboard(leaderboard, eraID: eraID)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: EraLeaderboard.self)
    }
}
