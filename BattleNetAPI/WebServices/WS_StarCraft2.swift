//
//  WS_StarCraft2_Community.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WS_StarCraft2: WebService {
    public enum API: APICall {
        // Game Data APIs
        case league(Int, LeagueQueue, LeagueTeam, LeagueType)
        // Profile APIs
        case profileData(APIRegion)
        case profileMetadata(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case profile(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case ladderSummary(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case ladder(sc2Region: APIRegion, realmID: Int, profileID: Int, ladderID: Int)
        case grandmasterLeaderboard(APIRegion)
        case ladderSeason(APIRegion)
        case player(Int)
        
        
        var path: String {
            switch self {
            case .league(let seasonID, let queue, let team, let league):
                return "/league/\(seasonID)/\(queue.id)/\(team.id)/\(league.id)"
            case .profileData(let sc2Region):
                return "/static/profile/\(sc2Region.id)"
            case .profileMetadata(sc2Region: let sc2Region, realmID: let realmID, profileID: let id):
                return "/metadata/profile/\(sc2Region.id)/\(realmID)/\(id)"
            case .profile(sc2Region: let sc2Region, realmID: let realmID, profileID: let id):
                return "/profile/\(sc2Region.id)/\(realmID)/\(id)"
            case .ladderSummary(sc2Region: let sc2Region, realmID: let realmID, profileID: let profileID):
                return "/profile/\(sc2Region.id)/\(realmID)/\(profileID)/ladder/summary"
            case .ladder(sc2Region: let sc2Region, realmID: let realmID, profileID: let profileID, ladderID: let ladderID):
                return "/profile/\(sc2Region.id)/\(realmID)/\(profileID)/ladder/\(ladderID)"
            case .grandmasterLeaderboard(let sc2Region):
                return "/ladder/grandmaster/\(sc2Region.id)"
            case .ladderSeason(let sc2Region):
                return "/ladder/season/\(sc2Region.id)"
            case .player(let id):
                return "/player/\(id)"
            }
        }
            
        var apiType: APIType? {
            switch self {
            case .league:
                return .gameData
            case .profileData, .profileMetadata, .profile, .ladderSummary, .ladder,
                 .grandmasterLeaderboard, .ladderSeason, .player:
                return .community
            }
        }
        
        
        var basePath: String? {
            switch apiType {
            case .gameData: return "/data/sc2"
            case .community, .profile: return "/sc2"
            default: return nil
            }
        }
    }
    
    
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return URL(string: region.apiURI) }
    
    var authenticationService: AuthenticationWebService?
    
    
    
    // MARK: - Game Data APIs
    
    /**
     Returns league data.
     
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, namespace: APINamespace? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.league(seasonID, queue, team, league), namespace: namespace) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - Community APIs
    
    // MARK: Profile API
    
    /**
     Returns all static SC2 profile data (achievements, categories, criteria, and rewards).
     
     - parameter sc2Region: The region for the profile (1=US, 2=EU, 3=KO and TW, 5=CN)
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfileData(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.profileData(sc2Region)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns metadata for an individual's profile.
     
     - parameter id: The ID of the profile to retrieve
     - parameter sc2Region: The region for the profile
     - parameter realmID: The realm of the profile (1 or 2)
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.profileMetadata(sc2Region: sc2Region, realmID: realmID, profileID: id)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.profile(sc2Region: sc2Region, realmID: realmID, profileID: id)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns a ladder summary for an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.ladderSummary(sc2Region: sc2Region, realmID: realmID, profileID: profileID)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter id: The ID of the ladder for which to retrieve data.
     - parameter profileID: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.ladder(sc2Region: sc2Region, realmID: realmID, profileID: profileID, ladderID: id)) { result in
            completion(result)
        }
    }
    
    
    // MARK: Ladder API
    
    /**
     Returns ladder data for the current season's grandmaster leaderboard.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getGrandmasterLeaderboard(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.grandmasterLeaderboard(sc2Region)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the current season.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLadderSeason(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.ladderSeason(sc2Region)) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: Account API
    
    /**
     Returns metadata for an individual's account.
     
     - parameter userID: The userID retrieved from the getUserInfo service
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getPlayers(userID id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.player(id)) { result in
            completion(result)
        }
    }
}
