//
//  WS_Diablo3.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WS_Diablo3: WebService {
    func getBaseURL(region: APIRegion, apiType: APIType?) -> String {
        var url = "\(region.apiURI)"
        
        if let apiType = apiType {
            url += "/\(apiType.rawValue)"
        }
        
        url += "/d3"
        
        return url
    }
    
    
    
    /**
     Calls a data web service using a pre-constructed url typically found within another web service result.
     
     - parameter urlStr: The url that will be used to make the web service call
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getResource(from urlStr: String, completion: @escaping (_ result: Result<Data>) -> Void) {
        self.callWebService(urlStr: urlStr, method: .get, apiType: .data) { result in
            completion(result)
        }
    }
    
    
    // MARK: - API
    
    /**
     Returns base information about available seasons
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getSeasons(region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/season/"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a leaderboard list for a particular season
     
     - parameter seasonID: The season to lookup
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLeaderboards(seasonID: Int, region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/season/\(seasonID)"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a leaderboard
     
     - parameter leaderboard: The leaderboard to lookup, you can find these strings in the Season API call
     - parameter seasonID: The season to lookup
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLeaderboard(_ leaderboard: String, seasonID: Int, region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/season/\(seasonID)/leaderboard/\(leaderboard)"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns base information about available eras
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getEras(region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/era/"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a leaderboard list for a particular era
     
     - parameter eraID: The era to lookup
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLeaderboards(eraID: Int, region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/era/\(eraID)"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a leaderboard
     
     - parameter leaderboard: The leaderboard to lookup, you can find these strings in the Era API call
     - parameter eraID: The era to lookup
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLeaderboard(_ leaderboard: String, eraID: Int, region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/era/\(eraID)/leaderboard/\(leaderboard)"
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
}



class WS_Diablo3Legacy: WebServiceLegacy {
    func getBaseURLLegacy(region: APIRegion, apiType: APIType? = nil) -> String {
        var url = "\(region.apiURI)"
        
        url += "/d3"
        
        if let apiType = apiType {
            url += "/\(apiType.rawValue)"
        }
        
        return url
    }
    
    
    
    // MARK: - Act API
    
    /**
     Get an index of acts
     
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getActs(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/act"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a single act by id
     
     - parameter id: The id of the act
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getAct(id: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/act/\(id)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Arisan and Recipe API
    
    /**
     Get a single artisan by slug
     
     - parameter slug: The slug of the artisan
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getArtisan(slug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/artisan/\(slug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a single recipe by slug for the specified artisan
     
     - parameter recipeSlug: The slug of the recipe
     - parameter artisanSlug: The slug of the artisan
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getRecipe(recipeSlug: String, artisanSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/artisan/\(artisanSlug)/recipe/\(recipeSlug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Follower API
    
    /**
     Get a single follower by slug
     
     - parameter slug: The slug of the follower
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getFollower(slug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/follower/\(slug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Character Class and Skill API
    
    /**
     Get a single character class by slug
     
     - parameter slug: The slug of the character class
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getClass(slug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/hero/\(slug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a single skill by slug, for a specific character class
     
     - parameter skillSlug: The slug of the skill
     - parameter classSlug: The slug of the character class
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getSkill(skillSlug: String, classSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/hero/\(classSlug)/skill/\(skillSlug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Item Type API
    
    /**
     Get an index of item types
     
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getItemTypes(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/item-type"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a single item type by slug
     
     - parameter slug: The slug of the item type
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getItemsByType(typeSlug: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/item-type/\(typeSlug)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Item API
    
    /**
     Get a single item by item slug and ID
     
     - parameter itemSlugAndID: The slug and ID of the item
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getItem(itemSlugAndID: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/item/\(itemSlugAndID)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Profile API
    
    /**
     Retrieves the profile of the user with the given Battle Tag
     
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    func getProfile(battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(battleTag)/"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a single hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getHero(heroID: Int, battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(battleTag)/hero/\(heroID)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a list of items for the specified hero
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getItemsForHero(heroID: Int, battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(battleTag)/hero/\(heroID)/items"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     Get a list of items for the specified hero's followers
     
     - parameter heroID: The id of the hero
     - parameter battleTag: The hyphen-separated value of the username and number
     - parameter region: What region the request is being made
     - parameter locale: The locale that should be reflected in localized data
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getFollowerItemsForHero(heroID: Int, battleTag: String, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(battleTag)/hero/\(heroID)/follower-items"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
}
