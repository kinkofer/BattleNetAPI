//
//  WS_StarCraft2.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WS_StarCraft2: WebService {
    func getBaseURL(region: APIRegion, apiType: APIType?) -> String {
        var url = "\(region.apiURI)"
        
        if let apiType = apiType {
            url += "/\(apiType.rawValue)"
        }
        
        url += "/sc2"
        
        return url
    }
    
    
    
    // MARK: - Profile API
    
    /**
     This provides data about the current logged in OAuth user's Sc2 profile.
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getCharacters(region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let urlStr = getBaseURL(region: region, apiType: nil) + "/profile/user"
        self.callWebService(urlStr: urlStr, method: .get, apiType: .profile) { result in
            completion(result)
        }
    }
}



class WS_StarCraft2Legacy: WebServiceLegacy {
    func getBaseURLLegacy(region: APIRegion, apiType: APIType? = nil) -> String {
        var url = "\(region.apiURI)"
        
        url += "/sc2"
        
        if let apiType = apiType {
            url += "/\(apiType.rawValue)"
        }
        
        return url
    }
    
    
    
    // MARK: - Profile API
    
    /**
     This provides data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter name: The name of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getProfile(id: Int, name: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(id)/\(sc2Region)/\(name)/"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     This provides data about an individual SC2 profile's ladders.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter name: The name of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLadders(id: Int, name: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(id)/\(sc2Region)/\(name)/ladders"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     This provides data about an individual SC2 profile's match history.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter name: The name of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getMatches(id: Int, name: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .profile
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/\(id)/\(sc2Region)/\(name)/matches"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Ladder API
    
    /**
     This provides data about an SC2 ladder.
     
     - parameter id: The ID of the ladder to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLadder(id: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        var urlStr = getBaseURLLegacy(region: region, apiType: nil) + "/ladder/\(id)"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Data Resources
    
    /**
     This provides data about the achievements available in SC2.
     
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getAchievements(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/achievements"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
    
    
    /**
     This provides data about the rewards available in SC2.
     
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getRewards(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .data
        var urlStr = getBaseURLLegacy(region: region, apiType: apiType) + "/rewards"
        urlStr = appendSharedURLParametersLegacy(to: urlStr, locale: locale)
        
        self.callWebServiceLegacy(urlStr: urlStr, method: .get) { result in
            completion(result)
        }
    }
}
