//
//  WS_StarCraft2_Community.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


protocol WS_StarCraft2Service: WebService {
    // Game Data APIs
    func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, namespace: APINamespace?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    // Community APIs
    func getProfileData(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getGrandmasterLeaderboard(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLadderSeason(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getPlayer(accountID id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getProfile(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLadders(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getMatchHistory(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getLadder(sc2Region: APIRegion, ladder: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getAchievements(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getRewards(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    // CN Community APIs
    func getCNProfile(id: Int, name: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getCNLadders(profileID: Int, profileName: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getCNMatchHistory(profileID: Int, profileName: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getCNLadder(id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getCNAchievements(completion: @escaping (_ result: Result<Data, Error>) -> Void)
    func getCNRewards(completion: @escaping (_ result: Result<Data, Error>) -> Void)
}



public struct WS_StarCraft2: WS_StarCraft2Service {
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
        // Legacy APIs
        case legacyProfile(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case legacyLadders(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case legacyMatchHistory(sc2Region: APIRegion, realmID: Int, profileID: Int)
        case legacyLadder(sc2Region: APIRegion, ladderID: Int)
        case legacyAchievements(sc2Region: APIRegion)
        case legacyReward(sc2Region: APIRegion)
        // CN APIs
        case cnProfile(profileID: Int, sc2Region: APIRegion, profileName: String)
        case cnLadders(profileID: Int, sc2Region: APIRegion, profileName: String)
        case cnMatchHistory(profileID: Int, sc2Region: APIRegion, profileName: String)
        case cnLadder(id: Int)
        case cnAchievements
        case cnRewards
        
        
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
            case .legacyProfile(sc2Region: let sc2Region, realmID: let realmID, profileID: let profileID):
                return "/legacy/profile/\(sc2Region.id)/\(realmID)/\(profileID)"
            case .legacyLadders(sc2Region: let sc2Region, realmID: let realmID, profileID: let profileID):
                return "/legacy/profile/\(sc2Region.id)/\(realmID)/\(profileID)/ladders"
            case .legacyMatchHistory(sc2Region: let sc2Region, realmID: let realmID, profileID: let profileID):
                return "/legacy/profile/\(sc2Region.id)/\(realmID)/\(profileID)/matches"
            case .legacyLadder(sc2Region: let sc2Region, ladderID: let ladderID):
                return "/legacy/ladder/\(sc2Region.id)/\(ladderID)"
            case .legacyAchievements(sc2Region: let sc2Region):
                return "/legacy/data/achievements/\(sc2Region.id)"
            case .legacyReward(sc2Region: let sc2Region):
                return "/legacy/data/rewards/\(sc2Region.id)"
            case .cnProfile(profileID: let profileID, sc2Region: let sc2Region, profileName: let profileName):
                return "/profile/\(profileID)/\(sc2Region.id)/\(profileName)"
            case .cnLadders(profileID: let profileID, sc2Region: let sc2Region, profileName: let profileName):
                return "/profile/\(profileID)/\(sc2Region.id)/\(profileName)/ladders"
            case .cnMatchHistory(profileID: let profileID, sc2Region: let sc2Region, profileName: let profileName):
                return "/profile/\(profileID)/\(sc2Region.id)/\(profileName)/matches"
            case .cnLadder(id: let id):
                return "/ladder/\(id)"
            case .cnAchievements:
                return "/data/achievements"
            case .cnRewards:
                return "/data/rewards"
            }
        }
        
        
        var apiType: APIType? {
            switch self {
            case .league:
                return .gameData
            case .profileData, .profileMetadata, .profile, .ladderSummary, .ladder,
                 .grandmasterLeaderboard, .ladderSeason, .player,
                 .legacyProfile, .legacyLadders, .legacyMatchHistory, .legacyLadder, .legacyAchievements, .legacyReward,
                 .cnProfile, .cnLadders, .cnMatchHistory, .cnLadder, .cnAchievements, .cnRewards:
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
     - note: This function is unavailable for the region of China, see `getCNProfile(id:name:sc2Region:)`
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
     - note: This function is unavailable for the region of China, see `getCNLadder(id:)`
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
     - note: This function is unavailable for the region of China, see `getCNLadders(profileID:profileName:sc2Region:)`
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
    public func getPlayer(accountID id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.player(id)) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: Legacy API
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter profileID: The ID of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNProfile(id:name:sc2Region:)`
     */
    public func getProfile(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyProfile(sc2Region: sc2Region, realmID: realmID, profileID: profileID)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter profileID: The ID of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNLadders(profileID:profileName:sc2Region:)`
     */
    public func getLadders(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyLadders(sc2Region: sc2Region, realmID: realmID, profileID: profileID)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual SC2 profile's match history.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter profileID: The ID of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNMatchHistory(profileID:profileName:sc2Region:)`
     */
    public func getMatchHistory(sc2Region: APIRegion, realmID: Int, profileID: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyMatchHistory(sc2Region: sc2Region, realmID: realmID, profileID: profileID)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual SC2 ladder.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter id: The ID of the ladder to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getLadder(sc2Region: APIRegion, ladder: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyLadder(sc2Region: sc2Region, ladderID: ladder)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the achievements available in SC2.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNAchievements()`
     */
    public func getAchievements(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyAchievements(sc2Region: sc2Region)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the rewards available in SC2.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNRewards()`
     */
    public func getRewards(sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.legacyReward(sc2Region: sc2Region)) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - CN Community APIs
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter profileName: The name of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCNProfile(id: Int, name: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnProfile(profileID: id, sc2Region: sc2Region, profileName: name)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter profileID: The ID of the profile to retrieve.
     - parameter profileName: The name of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCNLadders(profileID: Int, profileName: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnLadders(profileID: profileID, sc2Region: sc2Region, profileName: profileName)) { result in
            completion(result)
        }
    }
    
    
    /**
    Returns data about an individual SC2 profile's match history.
    
    - parameter sc2Region: The region of the profile to retrieve.
    - parameter realmID: The realm of the profile (1 or 2).
    - parameter profileID: The ID of the profile to retrieve.
    - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCNMatchHistory(profileID: Int, profileName: String, sc2Region: APIRegion, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnMatchHistory(profileID: profileID, sc2Region: sc2Region, profileName: profileName)) { result in
            completion(result)
        }
    }
    
    
    /**
    Returns data about an SC2 ladder.
    
    - parameter id: The ID of the ladder to retrieve.
    - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getCNLadder(id: Int, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnLadder(id: id)) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the achievements available in SC2.
     
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCNAchievements(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnAchievements) { result in
            completion(result)
        }
    }
    
    
    /**
     Returns data about the rewards available in SC2.
     
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getCNRewards(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.cnRewards) { result in
            completion(result)
        }
    }
}
