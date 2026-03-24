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
     */
    public func getGrandmasterLeaderboard(sc2Region: APIRegion) async throws -> GrandmasterLeaderboard {
        let data = try await webService.getGrandmasterLeaderboard(sc2Region: sc2Region)
        return try GrandmasterLeaderboard.decode(from: data)
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
     */
    public func getPlayer(accountID: Int) async throws -> [SC2ProfileMetadata] {
        let data = try await webService.getPlayer(accountID: accountID)
        return try [SC2ProfileMetadata].decode(from: data)
    }
}

