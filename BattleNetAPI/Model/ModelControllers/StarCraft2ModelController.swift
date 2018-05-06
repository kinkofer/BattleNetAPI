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
    
    
    
    // MARK: - Profile API
    
    func getCharacters(region: APIRegion, completion: @escaping (_ result: Result<[SC2Character]>) -> Void) {
        BattleNetAPI.sc2.getCharacters(region: region) { result in
            let customDecode: ((_ data: Data) throws -> [SC2Character]) = { data in
                return try SC2CharacterIndex.decode(from: data).characters
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Profile API
    
    func getCharacter(id: Int, profileName: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<SC2Character>) -> Void) {
        BattleNetAPI.sc2Legacy.getProfile(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getLadders(id: Int, profileName: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<LadderOverview>) -> Void) {
        BattleNetAPI.sc2Legacy.getLadders(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getMatches(id: Int, profileName: String, sc2Region: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<[Match]>) -> Void) {
        BattleNetAPI.sc2Legacy.getMatches(id: id, name: profileName, sc2Region: sc2Region, region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [Match]) = { data in
                return try MatchIndex.decode(from: data).matches
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
    
    
    
    // MARK: - Ladder API
    
    func getLadder(id: Int, region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<Ladder>) -> Void) {
        BattleNetAPI.sc2Legacy.getLadder(id: id, region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    
    // MARK: - Data Resources
    
    func getAchievements(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<SC2AchievementIndex>) -> Void) {
        BattleNetAPI.sc2Legacy.getAchievements(region: region, locale: locale) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getRewards(region: APIRegion, locale: APILocale, completion: @escaping (_ result: Result<[SC2Reward]>) -> Void) {
        BattleNetAPI.sc2Legacy.getRewards(region: region, locale: locale) { result in
            let customDecode: ((_ data: Data) throws -> [SC2Reward]) = { data in
                return try SC2RewardIndex.decode(from: data).portraits
            }
            result.decode(customDecode: customDecode, completion: completion)
        }
    }
}

