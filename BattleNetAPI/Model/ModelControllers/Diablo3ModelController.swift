//
//  Diablo3ModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Diablo3ModelController {
    let battleNetAPI: BattleNetAPI
    
    var region: APIRegion
    var locale: APILocale?
    
    public init(region: APIRegion, locale: APILocale?) {
        self.battleNetAPI = BattleNetAPI(region: .us, locale: .en_US)
        self.region = region
        self.locale = locale
    }
    
    
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, HTTPError>) -> Void) {
        battleNetAPI.d3.getResource(from: resourceLink.href) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Act API
    
    public func getActs(completion: @escaping (_ result: Result<[Act], HTTPError>) -> Void) {
        battleNetAPI.d3.getActs() { result in
            let customDecode: ((_ data: Data) throws -> [Act]) = { data in
                return try ActIndex.decode(from: data).acts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getAct(_ id: Int, completion: @escaping (_ result: Result<Act, HTTPError>) -> Void) {
        battleNetAPI.d3.getAct(id: id) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    public func getArtisan(_ slug: String, completion: @escaping (_ result: Result<Artisan, HTTPError>) -> Void) {
        battleNetAPI.d3.getArtisan(slug: slug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String, completion: @escaping (_ result: Result<D3Recipe, HTTPError>) -> Void) {
        battleNetAPI.d3.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Follower API
    
    public func getFollower(_ slug: String, completion: @escaping (_ result: Result<Follower, HTTPError>) -> Void) {
        battleNetAPI.d3.getFollower(slug: slug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    public func getClass(_ slug: String, completion: @escaping (_ result: Result<D3Class, HTTPError>) -> Void) {
        battleNetAPI.d3.getClass(slug: slug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getSkill(_ skillSlug: String, forClass classSlug: String, completion: @escaping (_ result: Result<D3SkillConfiguration, HTTPError>) -> Void) {
        battleNetAPI.d3.getSkill(skillSlug: skillSlug, classSlug: classSlug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item Type API
    
    public func getItemTypes(completion: @escaping (_ result: Result<[D3ItemType], HTTPError>) -> Void) {
        battleNetAPI.d3.getItemTypes() { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getItemsByType(_ typeSlug: String, completion: @escaping (_ result: Result<[D3Item], HTTPError>) -> Void) {
        battleNetAPI.d3.getItemsByType(typeSlug: typeSlug) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item API
    
    public func getItem(_ itemSlugAndID: String, completion: @escaping (_ result: Result<D3FullItem, HTTPError>) -> Void) {
        battleNetAPI.d3.getItem(itemSlugAndID: itemSlugAndID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Profile API
    
    public func getProfile(battleTag: String, completion: @escaping (_ result: Result<D3Profile, HTTPError>) -> Void) {
        battleNetAPI.d3.getProfile(battleTag: battleTag) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getHero(_ heroID: Int, for battleTag: String, completion: @escaping (_ result: Result<FullHero, HTTPError>) -> Void) {
        battleNetAPI.d3.getHero(heroID: heroID, battleTag: battleTag) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<FullEquippedItems, HTTPError>) -> Void) {
        battleNetAPI.d3.getItemsForHero(heroID: heroID, battleTag: battleTag) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<HeroFollowerItems, HTTPError>) -> Void) {
        battleNetAPI.d3.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Game Data API
    
    public func getSeasons(completion: @escaping (_ result: Result<D3SeasonIndex, HTTPError>) -> Void) {
        battleNetAPI.d3.getSeasons() { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLeaderboards(forSeason seasonID: Int, completion: @escaping (_ result: Result<D3SeasonLeaderboardIndex, HTTPError>) -> Void) {
        battleNetAPI.d3.getLeaderboards(seasonID: seasonID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int, completion: @escaping (_ result: Result<SeasonLeaderboard, HTTPError>) -> Void) {
        battleNetAPI.d3.getLeaderboard(leaderboard, seasonID: seasonID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getEras(completion: @escaping (_ result: Result<EraIndex, HTTPError>) -> Void) {
        battleNetAPI.d3.getEras() { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLeaderboards(forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboardIndex, HTTPError>) -> Void) {
        battleNetAPI.d3.getLeaderboards(eraID: eraID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLeaderboard(_ leaderboard: String, forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboard, HTTPError>) -> Void) {
        battleNetAPI.d3.getLeaderboard(leaderboard, eraID: eraID) { result in
            result.decode(completion: completion)
        }
    }
}
