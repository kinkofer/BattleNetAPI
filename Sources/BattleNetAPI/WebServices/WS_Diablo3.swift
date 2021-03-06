//
//  WS_Diablo3.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


protocol WS_Diablo3Service: WebService {
    // Game Data APIs
    func getSeasons(namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLeaderboards(seasonID: Int, namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLeaderboard(_ leaderboard: String, seasonID: Int, namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getEras(namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLeaderboards(eraID: Int, namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLeaderboard(_ leaderboard: String, eraID: Int, namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    // Community APIs
    func getActs(completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getAct(id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getArtisan(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getRecipe(recipeSlug: String, artisanSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getFollower(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getClass(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getSkill(skillSlug: String, classSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getItemTypes(completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getItemsByType(typeSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getItem(itemSlugAndID: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    // Profile APIs
    func getProfile(battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getItemsForHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getFollowerItemsForHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void)
}



public struct WS_Diablo3: WS_Diablo3Service {
    public enum API: APICall {
        // Game Data APIs
        case season
        case leaderboardBySeason(Int)
        case seasonLeaderboard(Int, String)
        case eraIndex
        case leaderboardByEra(Int)
        case eraLeaderboard(Int, String)
        // Community APIs
        case actIndex
        case act(Int)
        case artisan(String)
        case artisanRecipe(artisan: String, recipe: String)
        case follower(String)
        case `class`(String)
        case classSkill(class: String, skill: String)
        case itemType
        case itemTypeBySlug(String)
        case itemSlugAndID(String)
        // Profile APIs
        case profile(String)
        case hero(String, Int)
        case heroItems(String, Int)
        case heroFollowerItems(String, Int)
        
        
        var path: String {
            switch self {
            // Game Data APIs
            case .season:
                return "/season/"
            case .leaderboardBySeason(let id):
                return "/season/\(id)"
            case .seasonLeaderboard(let seasonID, let leaderboard):
                return "/season/\(seasonID)/leaderboard/\(leaderboard)"
            case .eraIndex:
                return "/era/"
            case .leaderboardByEra(let id):
                return "/era/\(id)"
            case .eraLeaderboard(let eraID, let leaderboard):
                return "/era/\(eraID)/leaderboard/\(leaderboard)"
            // Community APIs
            case .actIndex:
                return "/act/"
            case .act(let id):
                return "/act/\(id)/"
            case .artisan(let artisan):
                return "/artisan/\(artisan)/"
            case .artisanRecipe(artisan: let artisan, recipe: let recipe):
                return "/artisan/\(artisan)/recipe/\(recipe)/"
            case .follower(let slug):
                return "/follower/\(slug)/"
            case .class(let slug):
                return "/hero/\(slug)/"
            case .classSkill(class: let classSlug, skill: let skillSlug):
                return "/hero/\(classSlug)/skill/\(skillSlug)/"
            case .itemType:
                return "/item-type/"
            case .itemTypeBySlug(let itemTypeSlug):
                return "/item-type/\(itemTypeSlug)/"
            case .itemSlugAndID(let itemSlugAndID):
                return "/item/\(itemSlugAndID)/"
            // Profile APIs
            case .profile(let battleTag):
                return "/\(battleTag)/"
            case .hero(let battleTag, let heroID):
                return "/\(battleTag)/hero/\(heroID)/"
            case .heroItems(let battleTag, let heroID):
                return "/\(battleTag)/hero/\(heroID)/items/"
            case .heroFollowerItems(let battleTag, let heroID):
                return "/\(battleTag)/hero/\(heroID)/follower-items/"
            }
        }
        
        
        var apiType: APIType? {
            switch self {
            case .season, .leaderboardBySeason, .seasonLeaderboard,
                 .eraIndex, .leaderboardByEra, .eraLeaderboard:
                return .gameData
            case .actIndex, .act, .artisan, .artisanRecipe,
                 .follower, .class, .classSkill,
                 .itemType, .itemTypeBySlug, .itemSlugAndID:
                return .community
            case .profile, .hero, .heroItems, .heroFollowerItems:
                return .profile
            }
        }
        
        
        var namespace: String? {
            switch self {
            default:
                return nil
            }
        }
        
        
        var basePath: String? {
            switch apiType {
            case .gameData:
                return "/data/d3"
            case .community:
                return "/d3/data"
            case .profile:
                return "/d3/profile"
            default: return nil
            }
        }
        
        var queries: [String: String]? { return nil }
    }
    
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return URL(string: region.apiURI) }
    
    var authenticationService: AuthenticationWebService?
    
    
    
    // MARK: - Game Data API
    
    /**
     Returns an index of available seasons
     
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSeasons(namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.season, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a leaderboard list for the specified season
     
     - parameter seasonID: The season for the leaderboard list
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLeaderboards(seasonID: Int, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.leaderboardBySeason(seasonID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the specified leaderboard for the specified season.
     
     - parameter leaderboard: The leaderboard to retrieve
     - parameter seasonID: The season for the leaderboard
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLeaderboard(_ leaderboard: String, seasonID: Int, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.seasonLeaderboard(seasonID, leaderboard), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns an index of available eras
     
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getEras(namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.eraIndex, namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns a leaderboard list for a particular era
     
     - parameter eraID: The era for the leaderboard
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLeaderboards(eraID: Int, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.leaderboardByEra(eraID), namespace: namespace, completion: completion)
    }
    
    
    /**
     Returns the specified leaderboard for the specified era
     
     - parameter leaderboard: The leaderboard to lookup, you can find these strings in the Era API call
     - parameter eraID: The era for the leaderboard
     - parameter namespace: The response data's namespace
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLeaderboard(_ leaderboard: String, eraID: Int, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.eraLeaderboard(eraID, leaderboard), namespace: namespace, completion: completion)
    }
    
    
    
    // MARK: - Community API
    
    // MARK: Act API
    
    /**
     Get an index of acts
     
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getActs(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.actIndex, completion: completion)
    }
    
    
    /**
     Get a single act by id
     
     - parameter id: The id of the act
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getAct(id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.act(id), completion: completion)
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    /**
     Get a single artisan by slug
     
     - parameter slug: The slug of the artisan
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getArtisan(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.artisan(slug), completion: completion)
    }
    
    
    /**
     Get a single recipe by slug for the specified artisan
     
     - parameter recipeSlug: The slug of the recipe
     - parameter artisanSlug: The slug of the artisan
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getRecipe(recipeSlug: String, artisanSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.artisanRecipe(artisan: artisanSlug, recipe: recipeSlug), completion: completion)
    }
    
    
    
    // MARK: - Follower API
    
    /**
     Get a single follower by slug
     
     - parameter slug: The slug of the follower
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getFollower(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.follower(slug), completion: completion)
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    /**
     Get a single character class by slug
     
     - parameter slug: The slug of the character class
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getClass(slug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.class(slug), completion: completion)
    }
    
    
    /**
     Get a single skill by slug, for a specific character class
     
     - parameter skillSlug: The slug of the skill
     - parameter classSlug: The slug of the character class
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getSkill(skillSlug: String, classSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.classSkill(class: classSlug, skill: skillSlug), completion: completion)
    }
    
    
    
    // MARK: - Item Type API
    
    /**
     Get an index of item types
     
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemTypes(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemType, completion: completion)
    }
    
    
    /**
     Get a single item type by slug
     
     - parameter typeSlug: The slug of the item type
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemsByType(typeSlug: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemTypeBySlug(typeSlug), completion: completion)
    }
    
    
    
    // MARK: - Item API
    
    /**
     Get a single item by item slug and ID
     
     - parameter itemSlugAndID: The slug and ID of the item
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItem(itemSlugAndID: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.itemSlugAndID(itemSlugAndID), completion: completion)
    }
    
    
    
    // MARK: - Profile API
    
    /**
     Retrieves the profile of the user with the given Battle Tag
     
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getProfile(battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.profile(battleTag), completion: completion)
    }
    
    
    /**
     Get a single hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.hero(battleTag, heroID), completion: completion)
    }
    
    
    /**
     Get a list of items for the specified hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getItemsForHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.heroItems(battleTag, heroID), completion: completion)
    }
    
    
    /**
     Get a list of items for the specified hero's followers
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getFollowerItemsForHero(heroID: Int, battleTag: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.heroFollowerItems(battleTag, heroID), completion: completion)
    }
}
