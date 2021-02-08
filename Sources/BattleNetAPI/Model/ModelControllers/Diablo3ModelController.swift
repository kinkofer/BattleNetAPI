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
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        battleNetAPI.resource.getResource(from: resourceLink.href, apiType: .gameData, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Act API
    
    public func getActs(completion: @escaping (_ result: Result<[Act], Error>) -> Void) {
        battleNetAPI.d3.getActs() { result in
            let customDecode: ((_ data: Data) throws -> [Act]) = { data in
                return try ActIndex.decode(from: data).acts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    public func getAct(_ id: Int, completion: @escaping (_ result: Result<Act, Error>) -> Void) {
        battleNetAPI.d3.getAct(id: id, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    public func getArtisan(_ slug: String, completion: @escaping (_ result: Result<Artisan, Error>) -> Void) {
        battleNetAPI.d3.getArtisan(slug: slug, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String, completion: @escaping (_ result: Result<D3Recipe, Error>) -> Void) {
        battleNetAPI.d3.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Follower API
    
    public func getFollower(_ slug: String, completion: @escaping (_ result: Result<Follower, Error>) -> Void) {
        battleNetAPI.d3.getFollower(slug: slug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    public func getClass(_ slug: String, completion: @escaping (_ result: Result<D3Class, Error>) -> Void) {
        battleNetAPI.d3.getClass(slug: slug, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getSkill(_ skillSlug: String, forClass classSlug: String, completion: @escaping (_ result: Result<D3SkillConfiguration, Error>) -> Void) {
        battleNetAPI.d3.getSkill(skillSlug: skillSlug, classSlug: classSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Item Type API
    
    public func getItemTypes(completion: @escaping (_ result: Result<[D3ItemType], Error>) -> Void) {
        battleNetAPI.d3.getItemTypes(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getItemsByType(_ typeSlug: String, completion: @escaping (_ result: Result<[D3Item], Error>) -> Void) {
        battleNetAPI.d3.getItemsByType(typeSlug: typeSlug, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Item API
    
    public func getItem(_ itemSlugAndID: String, completion: @escaping (_ result: Result<D3FullItem, Error>) -> Void) {
        battleNetAPI.d3.getItem(itemSlugAndID: itemSlugAndID, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Profile API
    
    public func getProfile(battleTag: String, completion: @escaping (_ result: Result<D3Profile, Error>) -> Void) {
        battleNetAPI.d3.getProfile(battleTag: battleTag, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getHero(_ heroID: Int, for battleTag: String, completion: @escaping (_ result: Result<FullHero, Error>) -> Void) {
        battleNetAPI.d3.getHero(heroID: heroID, battleTag: battleTag, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<FullEquippedItems, Error>) -> Void) {
        battleNetAPI.d3.getItemsForHero(heroID: heroID, battleTag: battleTag, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, completion: @escaping (_ result: Result<HeroFollowerItems, Error>) -> Void) {
        battleNetAPI.d3.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag, completion: { $0.decode(completion: completion) })
    }
    
    
    
    // MARK: - Game Data API
    
    public func getSeasons(completion: @escaping (_ result: Result<D3SeasonIndex, Error>) -> Void) {
        battleNetAPI.d3.getSeasons(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getLeaderboards(forSeason seasonID: Int, completion: @escaping (_ result: Result<D3SeasonLeaderboardIndex, Error>) -> Void) {
        battleNetAPI.d3.getLeaderboards(seasonID: seasonID, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int, completion: @escaping (_ result: Result<SeasonLeaderboard, Error>) -> Void) {
        battleNetAPI.d3.getLeaderboard(leaderboard, seasonID: seasonID, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getEras(completion: @escaping (_ result: Result<EraIndex, Error>) -> Void) {
        battleNetAPI.d3.getEras(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getLeaderboards(forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboardIndex, Error>) -> Void) {
        battleNetAPI.d3.getLeaderboards(eraID: eraID, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getLeaderboard(_ leaderboard: String, forEra eraID: Int, completion: @escaping (_ result: Result<EraLeaderboard, Error>) -> Void) {
        battleNetAPI.d3.getLeaderboard(leaderboard, eraID: eraID, completion: { $0.decode(completion: completion) })
    }
}
