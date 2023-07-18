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
     
     - parameter completion: Returns a Result with the [Act] if `success` or an HTTPError if `failure`
     */
    public func getActs(completion: @escaping (_ result: Result<[Act], Error>) -> Void) {
        webService.getActs() { result in
            let customDecode: ((_ data: Data) throws -> [Act]) = { data in
                return try ActIndex.decode(from: data).acts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
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
     - parameter completion: Returns a Result with the Act if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getAct(_:)")
    public func getAct(_ id: Int, completion: @escaping (_ result: Result<Act, Error>) -> Void) {
        Task {
            do {
                let result = try await getAct(id)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Artisan if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getArtisan(_:)")
    public func getArtisan(_ slug: String, completion: @escaping (_ result: Result<Artisan, Error>) -> Void) {
        Task {
            do {
                let result = try await getArtisan(slug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the D3Recipe if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getRecipe(_:forArtisan:)")
    public func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String, completion: @escaping (_ result: Result<D3Recipe, Error>) -> Void) {
        Task {
            do {
                let result = try await getRecipe(recipeSlug, forArtisan: artisanSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the Follower if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getFollower(_:)")
    public func getFollower(_ slug: String, completion: @escaping (_ result: Result<Follower, Error>) -> Void) {
        Task {
            do {
                let result = try await getFollower(slug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the D3Class if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getClass(_:)")
    public func getClass(_ slug: String, completion: @escaping (_ result: Result<D3Class, Error>) -> Void) {
        Task {
            do {
                let result = try await getClass(slug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the D3SkillConfiguration if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSkill(_:forClass:)")
    public func getSkill(_ skillSlug: String, forClass classSlug: String, completion: @escaping (_ result: Result<D3SkillConfiguration, Error>) -> Void) {
        Task {
            do {
                let result = try await getSkill(skillSlug, forClass: classSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
    
    /**
     Get an index of item types
     
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the [D3ItemType] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemTypes()")
    public func getItemTypes(completion: @escaping (_ result: Result<[D3ItemType], Error>) -> Void) {
        Task {
            do {
                let result = try await getItemTypes()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    public func getItemTypes() async throws -> [D3ItemType] {
        let data = try await webService.getItemTypes()
        return try [D3ItemType].decode(from: data)
    }
    
    
    /**
     Get a single item type by slug
     
     - parameter typeSlug: The slug of the item type
     - parameter completion: Returns a Result with the [D3Item] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItemsByType(_:)")
    public func getItemsByType(_ typeSlug: String, completion: @escaping (_ result: Result<[D3Item], Error>) -> Void) {
        Task {
            do {
                let result = try await getItemsByType(typeSlug)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    public func getItemsByType(_ typeSlug: String) async throws -> [D3Item] {
        let data = try await webService.getItemsByType(typeSlug: typeSlug)
        return try [D3Item].decode(from: data)
    }
    
    
    
    // MARK: - Item API
    
    /**
     Get a single item by item slug and ID
     
     - parameter itemSlugAndID: The slug and ID of the item
     - parameter completion: Returns a Result with the D3FullItem if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItem(_:)")
    public func getItem(_ itemSlugAndID: String, completion: @escaping (_ result: Result<D3FullItem, Error>) -> Void) {
        Task {
            do {
                let result = try await getItem(itemSlugAndID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Get a single item by item slug and ID
     
     - parameter itemSlugAndID: The slug and ID of the item
     */
    public func getItem(_ itemSlugAndID: String) async throws -> D3FullItem {
        let data = try await webService.getItem(itemSlugAndID: itemSlugAndID)
        return try D3FullItem.decode(from: data)
    }
    
    
    
    // MARK: - Profile API
    
    /**
     Retrieves the profile of the user with the given Battle Tag
     
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the D3Profile if `success` or an HTTPError if `failure`
    */
    @available(*, renamed: "getProfile(battleTag:)")
    public func getProfile(battleTag: String, completion: @escaping (_ result: Result<D3Profile, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfile(battleTag: battleTag)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    public func getProfile(battleTag: String) async throws -> D3Profile {
        let data = try await webService.getProfile(battleTag: battleTag)
        return try D3Profile.decode(from: data)
    }
    
    
    /**
     Get a single hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the FullHero if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getHero(_:for:)")
    public func getHero(_ heroID: Int, for battleTag: String, completion: @escaping (_ result: Result<FullHero, Error>) -> Void) {
        Task {
            do {
                let result = try await getHero(heroID, for: battleTag)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the FullEquippedItems if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getItems(forHero:forBattleTag:)")
    public func getItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<FullEquippedItems, Error>) -> Void) {
        Task {
            do {
                let result = try await getItems(forHero: heroID, forBattleTag: battleTag)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the HeroFollowerItems if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getFollowerItems(forHero:forBattleTag:)")
    public func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<HeroFollowerItems, Error>) -> Void) {
        Task {
            do {
                let result = try await getFollowerItems(forHero: heroID, forBattleTag: battleTag)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the D3SeasonIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getSeasons()")
    public func getSeasons(completion: @escaping (_ result: Result<D3SeasonIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getSeasons()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
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
     - parameter completion: Returns a Result with the D3SeasonLeaderboardIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLeaderboards(forSeason:)")
    public func getLeaderboards(forSeason seasonID: Int, completion: @escaping (_ result: Result<D3SeasonLeaderboardIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getLeaderboards(forSeason: seasonID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the SeasonLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLeaderboard(_:forSeason:)")
    public func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int, completion: @escaping (_ result: Result<SeasonLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getLeaderboard(leaderboard, forSeason: seasonID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the EraIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getEras()")
    public func getEras(completion: @escaping (_ result: Result<EraIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getEras()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the EraLeaderboardIndex if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLeaderboards(forEra:)")
    public func getLeaderboards(forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboardIndex, Error>) -> Void) {
        Task {
            do {
                let result = try await getLeaderboards(forEra: eraID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
     - parameter completion: Returns a Result with the EraLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLeaderboard(_:forEra:)")
    public func getLeaderboard(_ leaderboard: String, forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getLeaderboard(leaderboard, forEra: eraID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
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
