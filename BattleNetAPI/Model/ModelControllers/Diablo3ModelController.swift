//
//  Diablo3ModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Diablo3ModelController {
    static let shared = Diablo3ModelController()
    private init() { }
    
    
    
    func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T>) -> Void) {
        BattleNetAPI.d3.getResource(from: resourceLink.href) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Act API
    
    func getActs(region: APIRegion = .us, locale: APILocale = .en_US, completion: @escaping (_ result: Result<[Act]>) -> Void) {
        BattleNetAPI.d3Legacy.getActs(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Act]) = { data in
                return try ActIndex.decode(from: data).acts
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    func getAct(_ id: Int, region: APIRegion = .us, locale: APILocale = .en_US, completion: @escaping (_ result: Result<Act>) -> Void) {
        BattleNetAPI.d3Legacy.getAct(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    func getArtisan(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US, completion: @escaping (_ result: Result<Artisan>) -> Void) {
        BattleNetAPI.d3Legacy.getArtisan(slug: slug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<D3Recipe>) -> Void) {
        BattleNetAPI.d3Legacy.getRecipe(recipeSlug: recipeSlug, artisanSlug: artisanSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Follower API
    
    func getFollower(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US, completion: @escaping (_ result: Result<Follower>) -> Void) {
        BattleNetAPI.d3Legacy.getFollower(slug: slug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    func getClass(_ slug: String, region: APIRegion = .us, locale: APILocale = .en_US, completion: @escaping (_ result: Result<D3Class>) -> Void) {
        BattleNetAPI.d3Legacy.getClass(slug: slug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getSkill(_ skillSlug: String, forClass classSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<D3SkillConfiguration>) -> Void) {
        BattleNetAPI.d3Legacy.getSkill(skillSlug: skillSlug, classSlug: classSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item Type API
    
    func getItemTypes(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<[D3ItemType]>) -> Void) {
        BattleNetAPI.d3Legacy.getItemTypes(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getItemsByType(_ typeSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<[D3Item]>) -> Void) {
        BattleNetAPI.d3Legacy.getItemsByType(typeSlug: typeSlug, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Item API
    
    func getItem(_ itemSlugAndID: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<D3FullItem>) -> Void) {
        BattleNetAPI.d3Legacy.getItem(itemSlugAndID: itemSlugAndID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Profile API
    
    func getProfile(battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<D3Profile>) -> Void) {
        BattleNetAPI.d3Legacy.getProfile(battleTag: battleTag, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getHero(_ heroID: Int, for battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<FullHero>) -> Void) {
        BattleNetAPI.d3Legacy.getHero(heroID: heroID, battleTag: battleTag, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getItems(forHero heroID: Int, forBattleTag battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<FullEquippedItems>) -> Void) {
        BattleNetAPI.d3Legacy.getItemsForHero(heroID: heroID, battleTag: battleTag, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<HeroFollowerItems>) -> Void) {
        BattleNetAPI.d3Legacy.getFollowerItemsForHero(heroID: heroID, battleTag: battleTag, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Game Data API
    
    func getSeasons(region: APIRegion, completion: @escaping (_ result: Result<D3SeasonIndex>) -> Void) {
        BattleNetAPI.d3.getSeasons(region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLeaderboards(forSeason seasonID: Int, region: APIRegion, completion: @escaping (_ result: Result<D3SeasonLeaderboardIndex>) -> Void) {
        BattleNetAPI.d3.getLeaderboards(seasonID: seasonID, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int, region: APIRegion, completion: @escaping (_ result: Result<SeasonLeaderboard>) -> Void) {
        BattleNetAPI.d3.getLeaderboard(leaderboard, seasonID: seasonID, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getEras(region: APIRegion, completion: @escaping (_ result: Result<EraIndex>) -> Void) {
        BattleNetAPI.d3.getEras(region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLeaderboards(forEra eraID: Int, region: APIRegion, completion: @escaping (_ result: Result<EraLeaderboardIndex>) -> Void) {
        BattleNetAPI.d3.getLeaderboards(eraID: eraID, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forEra eraID: Int, region: APIRegion, completion: @escaping (_ result: Result<EraLeaderboard>) -> Void) {
        BattleNetAPI.d3.getLeaderboard(leaderboard, eraID: eraID, region: region) { result in
            result.decode(completion: completion)
        }
    }
}
