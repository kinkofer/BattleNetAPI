//
//  WS_Diablo3+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_Diablo3 {
    // MARK: - Act API
    
    /**
     Get an index of acts
     */
    public func getActs() async throws -> [Act] {
        let data = try await webService.getActs()
        return try ActIndex.decode(from: data).acts
    }
    
    
    /**
     Get a single act by id
     
     - parameter id: The id of the act
     */
    public func getAct(_ id: Int) async throws -> Act {
        let data = try await webService.getAct(id: id)
        return try Act.decode(from: data)
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    /**
     Get a single artisan by slug
     
     - parameter slug: The slug of the artisan
     */
    public func getArtisan(_ slug: String) async throws -> Artisan {
        let data = try await webService.getArtisan(slug: slug)
        return try Artisan.decode(from: data)
    }
    
    
    /**
     Get a single recipe by slug for the specified artisan
     
     - parameter recipeSlug: The slug of the recipe
     - parameter artisanSlug: The slug of the artisan
     */
    public func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String) async throws -> D3Recipe {
        let data = try await webService.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug)
        return try D3Recipe.decode(from: data)
    }
    
    
    
    // MARK: - Follower API
    
    /**
     Get a single follower by slug
     
     - parameter slug: The slug of the follower
     */
    public func getFollower(_ slug: String) async throws -> Follower {
        let data = try await webService.getFollower(slug: slug)
        return try Follower.decode(from: data)
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    /**
     Get a single character class by slug
     
     - parameter slug: The slug of the character class
     */
    public func getClass(_ slug: String) async throws -> D3Class {
        let data = try await webService.getClass(slug: slug)
        return try D3Class.decode(from: data)
    }
    
    
    /**
     Get a single skill by slug, for a specific character class
     
     - parameter skillSlug: The slug of the skill
     - parameter classSlug: The slug of the character class
     */
    public func getSkill(_ skillSlug: String, forClass classSlug: String) async throws -> D3SkillConfiguration {
        let data = try await webService.getSkill(skillSlug: skillSlug, classSlug: classSlug)
        return try D3SkillConfiguration.decode(from: data)
    }
    
    
    
    // MARK: - Item Type API
    
    public func getItemTypes() async throws -> [D3ItemType] {
        let data = try await webService.getItemTypes()
        return try [D3ItemType].decode(from: data)
    }
    
    
    public func getItemsByType(_ typeSlug: String) async throws -> [D3Item] {
        let data = try await webService.getItemsByType(typeSlug: typeSlug)
        return try [D3Item].decode(from: data)
    }
    
    
    
    // MARK: - Item API
    
    /**
     Get a single item by item slug and ID
     
     - parameter itemSlugAndID: The slug and ID of the item
     */
    public func getItem(_ itemSlugAndID: String) async throws -> D3FullItem {
        let data = try await webService.getItem(itemSlugAndID: itemSlugAndID)
        return try D3FullItem.decode(from: data)
    }
    
    
    
    // MARK: - Profile API
    
    public func getProfile(battleTag: String) async throws -> D3Profile {
        let data = try await webService.getProfile(battleTag: battleTag)
        return try D3Profile.decode(from: data)
    }
    
    
    /**
     Get a single hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     */
    public func getHero(_ heroID: Int, for battleTag: String) async throws -> FullHero {
        let data = try await webService.getHero(heroID: heroID, battleTag: battleTag)
        return try FullHero.decode(from: data)
    }
    
    
    /**
     Get a list of items for the specified hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     */
    public func getItems(forHero heroID: Int, forBattleTag battleTag: String) async throws -> FullEquippedItems {
        let data = try await webService.getItemsForHero(heroID: heroID, battleTag: battleTag)
        return try FullEquippedItems.decode(from: data)
    }
    
    
    /**
     Get a list of items for the specified hero's followers
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     */
    public func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String) async throws -> HeroFollowerItems {
        let data = try await webService.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag)
        return try HeroFollowerItems.decode(from: data)
    }
    
    
    
    // MARK: - Game Data API
    
    /**
     Returns an index of available seasons
     
     - parameter namespace: The response data's namespace
     */
    public func getSeasons() async throws -> D3SeasonIndex {
        let data = try await webService.getSeasons()
        return try D3SeasonIndex.decode(from: data)
    }
    
    
    /**
     Returns a leaderboard list for the specified season
     
     - parameter seasonID: The season for the leaderboard list
     - parameter namespace: The response data's namespace
     */
    public func getLeaderboards(forSeason seasonID: Int) async throws -> D3SeasonLeaderboardIndex {
        let data = try await webService.getLeaderboards(seasonID: seasonID)
        return try D3SeasonLeaderboardIndex.decode(from: data)
    }
    
    
    /**
     Returns the specified leaderboard for the specified season.
     
     - parameter leaderboard: The leaderboard to retrieve
     - parameter seasonID: The season for the leaderboard
     - parameter namespace: The response data's namespace
     */
    public func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int) async throws -> SeasonLeaderboard {
        let data = try await webService.getLeaderboard(leaderboard, seasonID: seasonID)
        return try SeasonLeaderboard.decode(from: data)
    }
    
    
    /**
     Returns an index of available eras
     
     - parameter namespace: The response data's namespace
     */
    public func getEras() async throws -> EraIndex {
        let data = try await webService.getEras()
        return try EraIndex.decode(from: data)
    }
    
    
    /**
     Returns a leaderboard list for a particular era
     
     - parameter eraID: The era for the leaderboard
     - parameter namespace: The response data's namespace
     */
    public func getLeaderboards(forEra eraID: Int) async throws -> EraLeaderboardIndex {
        let data = try await webService.getLeaderboards(eraID: eraID)
        return try EraLeaderboardIndex.decode(from: data)
    }
    
    
    /**
     Returns the specified leaderboard for the specified era
     
     - parameter leaderboard: The leaderboard to lookup, you can find these strings in the Era API call
     - parameter eraID: The era for the leaderboard
     - parameter namespace: The response data's namespace
     */
    public func getLeaderboard(_ leaderboard: String, forEra eraID: Int) async throws -> EraLeaderboard {
        let data = try await webService.getLeaderboard(leaderboard, eraID: eraID)
        return try EraLeaderboard.decode(from: data)
    }
}
