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
        _ = try await battleNetAPI.d3.decoded.getActs()
    }
    
    
    func testGetAct() async throws {
        let id = 5
        _ = try await battleNetAPI.d3.decoded.getAct(id)
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    func testGetArtisan() async throws {
        let slug = "blacksmith"
        _ = try await battleNetAPI.d3.decoded.getArtisan(slug)
    }
    
    
    func testGetRecipe() async throws {
        let recipeSlug = "apprentice-flamberge"
        let artisanSlug = "blacksmith"
        _ = try await battleNetAPI.d3.decoded.getRecipe(recipeSlug, forArtisan: artisanSlug)
    }
    
    
    
    // MARK: - Follower API
    
    func testGetFollower() async throws {
        let slug = "templar"
        _ = try await battleNetAPI.d3.decoded.getFollower(slug)
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    func testGetClass() async throws {
        let slug = "barbarian"
        _ = try await battleNetAPI.d3.decoded.getClass(slug)
    }
    
    
    func testGetSkill() async throws {
        let skillSlug = "bash"
        let classSlug = "barbarian"
        _ = try await battleNetAPI.d3.decoded.getSkill(skillSlug, forClass: classSlug)
    }
    
    
    
    // MARK: - Item Type API
    
    func testGetItemTypes() async throws {
        _ = try await battleNetAPI.d3.decoded.getItemTypes()
    }
    
    
    func testGetItemsByType() async throws {
        let typeSlug = "sword2h"
        _ = try await battleNetAPI.d3.decoded.getItemsByType(typeSlug)
    }
    
    
    
    // MARK: - Item API
    
    func testGetItem() async throws {
        let itemSlugAndID = "corrupted-ashbringer-Unique_Sword_2H_104_x1"
        _ = try await battleNetAPI.d3.decoded.getItem(itemSlugAndID)
    }
    
    
    
    // MARK: - Profile API
    
    func testGetProfile() async throws {
        let battleTag = "okappa-11821"
        _ = try await battleNetAPI.d3.decoded.getProfile(battleTag: battleTag)
    }
    
    
    func testGetHero() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        _ = try await battleNetAPI.d3.decoded.getHero(heroID, for: battleTag)
    }
    
    
    func testGetItems() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        _ = try await battleNetAPI.d3.decoded.getItems(forHero: heroID, forBattleTag: battleTag)
    }
    
    
    func testGetFollowerItems() async throws {
        let heroID = 157143411
        let battleTag = "okappa-11821"
        _ = try await battleNetAPI.d3.decoded.getFollowerItems(forHero: heroID, forBattleTag: battleTag)
    }
    
    
    
    // MARK: - Game Data API
    
    func testGetSeasons() async throws {
        _ = try await battleNetAPI.d3.decoded.getSeasons()
    }
    
    
    func testGetLeaderboardsForSeason() async throws {
        let seasonID = 1
        _ = try await battleNetAPI.d3.decoded.getLeaderboards(forSeason: seasonID)
    }
    
    
    func testGetLeaderboardForSeason() async throws {
        let leaderboard = "achievement-points"
        let seasonID = 1
        _ = try await battleNetAPI.d3.decoded.getLeaderboard(leaderboard, forSeason: seasonID)
    }
    
    
    func testGetEras() async throws {
        _ = try await battleNetAPI.d3.decoded.getEras()
    }
    
    
    func testGetLeaderboardsForEra() async throws {
        let eraID = 1
        _ = try await battleNetAPI.d3.decoded.getLeaderboards(forEra: eraID)
    }
    
    
    func testGetLeaderboardForEra() async throws {
        let leaderboard = "rift-barbarian"
        let eraID = 1
        _ = try await battleNetAPI.d3.decoded.getLeaderboard(leaderboard, forEra: eraID)
    }
}
