//
//  WS_StarCraft2_Community.swift
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
            switch apiType {
            case .gameData:
                url += "/data/sc2"
            case .community, .profile:
                url += "/sc2"
            }
        }
        
        return url
    }
    
    
    
    // MARK: - Game Data APIs
    
    func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .gameData
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/league/\(seasonID)/\(queue.id)/\(team.id)/\(league.id)?locale=\(locale.rawValue)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Community APIs
    
    // MARK: Profile API
    
    /**
     Returns all static SC2 profile data (achievements, categories, criteria, and rewards).
     
     - parameter sc2Region: The region for the profile (1=US, 2=EU, 3=KO and TW, 5=CN)
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getProfileData(sc2Region: APIRegion, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/static/profile/\(sc2Region.id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns metadata for an individual's profile.
     
     - parameter id: The ID of the profile to retrieve
     - parameter sc2Region: The region for the profile
     - parameter realmID: The realm of the profile (1 or 2)
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/metadata/profile/\(sc2Region.id)/\(realmID)/\(id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/profile/\(sc2Region.id)/\(realmID)/\(id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a ladder summary for an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/profile/\(sc2Region.id)/\(realmID)/\(profileID)/ladder/summary"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter id: The ID of the ladder for which to retrieve data.
     - parameter profileID: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/profile/\(sc2Region.id)/\(realmID)/\(profileID)/ladder/\(id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    // MARK: Ladder API
    
    /**
     Returns ladder data for the current season's grandmaster leaderboard.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getGrandmasterLeaderboard(sc2Region: APIRegion, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/ladder/grandmaster/\(sc2Region.id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the current season.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter region: What region the request is being made
     - parameter locale: What locale to use in the response
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getLadderSeason(sc2Region: APIRegion, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/ladder/season/\(sc2Region.id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: Account API
    
    /**
     Returns metadata for an individual's account.
     
     - parameter userID: The userID retrieved from the getUserInfo service
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getPlayers(userID id: Int, region: APIRegion, completion: @escaping (_ result: Result<Data>) -> Void) {
        let apiType: APIType = .community
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/player/\(id)"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
}
