//
//  StarCraft2ModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class StarCraft2ModelController {
    static let shared = StarCraft2ModelController()
    private init() { }
    
    
    
    // MARK: - Game Data API
    
    // MARK: League API
    
    func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<League, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Community API
    
    // MARK: Profile API
    
    func getProfileData(sc2Region: APIRegion, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<SC2ProfileData, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getProfileData(sc2Region: sc2Region, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<SC2ProfileMetadata, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getProfileMetadata(id: id, sc2Region: sc2Region, realmID: realmID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getProfile(id: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<SC2Profile, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getProfile(id: id, sc2Region: sc2Region, realmID: realmID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<LadderSummary, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<Ladder, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getLadder(id: id, profileID: profileID, sc2Region: sc2Region, realmID: realmID, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: Ladder API
    
    func getGrandmasterLeaderboard(sc2Region: APIRegion, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<GrandmasterLeaderboard, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: sc2Region, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    func getLadderSeason(sc2Region: APIRegion, region: APIRegion = Current.region, locale: APILocale = Current.locale, completion: @escaping (_ result: Result<SC2Season, HTTPError>) -> Void) {
        BattleNetAPI.sc2.getLadderSeason(sc2Region: sc2Region, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    // MARK: Account API
    
    func getPlayers(userID: Int, region: APIRegion = Current.region, completion: @escaping (_ result: Result<[SC2ProfileMetadata], HTTPError>) -> Void) {
        BattleNetAPI.sc2.getPlayers(userID: userID, region: region) { result in
            result.decode(completion: completion)
        }
    }
}

