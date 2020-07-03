//
//  StarCraft2ModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct StarCraft2ModelController {
    let battleNetAPI: BattleNetAPI
    
    var region: APIRegion
    var locale: APILocale?
    
    public init(region: APIRegion, locale: APILocale?) {
        self.battleNetAPI = BattleNetAPI(region: .us, locale: .en_US)
        self.region = region
        self.locale = locale
    }
    
    
    
    // MARK: - Game Data API
    
    // MARK: League API
    
    public func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, completion: @escaping (_ result: Result<League, HTTPError>) -> Void) {
        battleNetAPI.sc2.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Community API
    
    // MARK: Profile API
    
    public func getProfileData(sc2Region: APIRegion, completion: @escaping (_ result: Result<SC2ProfileData, HTTPError>) -> Void) {
        battleNetAPI.sc2.getProfileData(sc2Region: sc2Region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<SC2ProfileMetadata, HTTPError>) -> Void) {
        battleNetAPI.sc2.getProfileMetadata(id: id, sc2Region: sc2Region, realmID: realmID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<SC2Profile, HTTPError>) -> Void) {
        battleNetAPI.sc2.getProfile(id: id, sc2Region: sc2Region, realmID: realmID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<LadderSummary, HTTPError>) -> Void) {
        battleNetAPI.sc2.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, completion: @escaping (_ result: Result<Ladder, HTTPError>) -> Void) {
        battleNetAPI.sc2.getLadder(id: id, profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: Ladder API
    
    public func getGrandmasterLeaderboard(sc2Region: APIRegion, completion: @escaping (_ result: Result<GrandmasterLeaderboard, HTTPError>) -> Void) {
        battleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: sc2Region) { result in
            result.decode(completion: completion)
        }
    }
    
    public func getLadderSeason(sc2Region: APIRegion, completion: @escaping (_ result: Result<SC2Season, HTTPError>) -> Void) {
        battleNetAPI.sc2.getLadderSeason(sc2Region: sc2Region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: Account API
    
    public func getPlayers(userID: Int, completion: @escaping (_ result: Result<[SC2ProfileMetadata], HTTPError>) -> Void) {
        battleNetAPI.sc2.getPlayers(userID: userID) { result in
            result.decode(completion: completion)
        }
    }
}

