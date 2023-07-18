//
//  WS_StarCraft2+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_StarCraft2 {
    // MARK: - Game Data API
    
    // MARK: League API
    
    /**
     Returns league data.
     
     - parameter completion: Returns a Result with the League if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLeagueData(seasonID:queue:team:league:)")
    public func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, completion: @escaping (_ result: Result<League, Error>) -> Void) {
        Task {
            do {
                let result = try await getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns league data.
     */
    public func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType) async throws -> League {
        let data = try await webService.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league)
        return try League.decode(from: data)
    }
    
    
    
    // MARK: - Community API
    
    // MARK: Profile API
    
    /**
     Returns all static SC2 profile data (achievements, categories, criteria, and rewards).
     
     - parameter sc2Region: The region for the profile (1=US, 2=EU, 3=KO and TW, 5=CN)
     - parameter completion: Returns a Result with the SC2ProfileData if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfileData(sc2Region:)")
    public func getProfileData(sc2Region: APIRegion, completion: @escaping (_ result: Result<SC2ProfileData, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfileData(sc2Region: sc2Region)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns all static SC2 profile data (achievements, categories, criteria, and rewards).
     
     - parameter sc2Region: The region for the profile (1=US, 2=EU, 3=KO and TW, 5=CN)
     */
    public func getProfileData(sc2Region: APIRegion) async throws -> SC2ProfileData {
        let data = try await webService.getProfileData(sc2Region: sc2Region)
        return try SC2ProfileData.decode(from: data)
    }
    
    
    /**
     Returns metadata for an individual's profile.
     
     - parameter id: The ID of the profile to retrieve
     - parameter sc2Region: The region for the profile
     - parameter realmID: The realm of the profile (1 or 2)
     - parameter completion: Returns a Result with the SC2ProfileMetadata if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getProfileMetadata(id:sc2Region:realmID:)")
    public func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<SC2ProfileMetadata, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfileMetadata(id: id, sc2Region: sc2Region, realmID: realmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns metadata for an individual's profile.
     
     - parameter id: The ID of the profile to retrieve
     - parameter sc2Region: The region for the profile
     - parameter realmID: The realm of the profile (1 or 2)
     */
    public func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int) async throws -> SC2ProfileMetadata {
        let data = try await webService.getProfileMetadata(id: id, sc2Region: sc2Region, realmID: realmID)
        return try SC2ProfileMetadata.decode(from: data)
    }
    
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the SC2Profile if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNProfile(id:name:sc2Region:)`
     */
    @available(*, renamed: "getProfile(id:sc2Region:realmID:)")
    public func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<SC2Profile, Error>) -> Void) {
        Task {
            do {
                let result = try await getProfile(id: id, sc2Region: sc2Region, realmID: realmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns data about an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - note: This function is unavailable for the region of China, see `getCNProfile(id:name:sc2Region:)`
     */
    public func getProfile(id: Int, sc2Region: APIRegion, realmID: Int) async throws -> SC2Profile {
        let data = try await webService.getProfile(id: id, sc2Region: sc2Region, realmID: realmID)
        return try SC2Profile.decode(from: data)
    }
    
    
    /**
     Returns a ladder summary for an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the LadderSummary if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNLadder(id:)`
     */
    @available(*, renamed: "getLadderSummary(profileID:sc2Region:realmID:)")
    public func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<LadderSummary, Error>) -> Void) {
        Task {
            do {
                let result = try await getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns a ladder summary for an individual SC2 profile.
     
     - parameter id: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - note: This function is unavailable for the region of China, see `getCNLadder(id:)`
     */
    public func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int) async throws -> LadderSummary {
        let data = try await webService.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID)
        return try LadderSummary.decode(from: data)
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter id: The ID of the ladder for which to retrieve data.
     - parameter profileID: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - parameter completion: Returns a Result with the Ladder if `success` or an HTTPError if `failure`
     - note: This function is unavailable for the region of China, see `getCNLadders(profileID:profileName:sc2Region:)`
     */
    @available(*, renamed: "getLadder(id:profileID:sc2Region:realmID:)")
    public func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Ladder, Error>) -> Void) {
        Task {
            do {
                let result = try await getLadder(id: id, profileID: profileID, sc2Region: sc2Region, realmID: realmID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns data about an individual profile's ladder.
     
     - parameter id: The ID of the ladder for which to retrieve data.
     - parameter profileID: The ID of the profile to retrieve.
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter realmID: The realm of the profile (1 or 2).
     - note: This function is unavailable for the region of China, see `getCNLadders(profileID:profileName:sc2Region:)`
     */
    public func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int) async throws -> Ladder {
        let data = try await webService.getLadder(id: id, profileID: profileID, sc2Region: sc2Region, realmID: realmID)
        return try Ladder.decode(from: data)
    }
    
    
    // MARK: Ladder API
    
    /**
     Returns ladder data for the current season's grandmaster leaderboard.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the GrandmasterLeaderboard if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getGrandmasterLeaderboard(sc2Region:)")
    public func getGrandmasterLeaderboard(sc2Region: APIRegion, completion: @escaping (_ result: Result<GrandmasterLeaderboard, Error>) -> Void) {
        Task {
            do {
                let result = try await getGrandmasterLeaderboard(sc2Region: sc2Region)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns ladder data for the current season's grandmaster leaderboard.
     
     - parameter sc2Region: The region of the profile to retrieve.
     */
    public func getGrandmasterLeaderboard(sc2Region: APIRegion) async throws -> GrandmasterLeaderboard {
        let data = try await webService.getGrandmasterLeaderboard(sc2Region: sc2Region)
        return try GrandmasterLeaderboard.decode(from: data)
    }
    
    /**
     Returns data about the current season.
     
     - parameter sc2Region: The region of the profile to retrieve.
     - parameter completion: Returns a Result with the SC2Season if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getLadderSeason(sc2Region:)")
    public func getLadderSeason(sc2Region: APIRegion, completion: @escaping (_ result: Result<SC2Season, Error>) -> Void) {
        Task {
            do {
                let result = try await getLadderSeason(sc2Region: sc2Region)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns data about the current season.
     
     - parameter sc2Region: The region of the profile to retrieve.
     */
    public func getLadderSeason(sc2Region: APIRegion) async throws -> SC2Season {
        let data = try await webService.getLadderSeason(sc2Region: sc2Region)
        return try SC2Season.decode(from: data)
    }
    
    
    // MARK: Account API
    
    /**
     Returns metadata for an individual's account.
     
     - parameter userID: The userID retrieved from the getUserInfo service
     - parameter completion: Returns a Result with the [SC2ProfileMetadata] if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getPlayer(accountID:)")
    public func getPlayer(accountID: Int, completion: @escaping (_ result: Result<[SC2ProfileMetadata], Error>) -> Void) {
        Task {
            do {
                let result = try await getPlayer(accountID: accountID)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns metadata for an individual's account.
     
     - parameter userID: The userID retrieved from the getUserInfo service
     */
    public func getPlayer(accountID: Int) async throws -> [SC2ProfileMetadata] {
        let data = try await webService.getPlayer(accountID: accountID)
        return try [SC2ProfileMetadata].decode(from: data)
    }
}

