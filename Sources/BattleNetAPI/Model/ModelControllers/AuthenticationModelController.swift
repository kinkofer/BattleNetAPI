//
//  AuthenticationModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct AuthenticationModelController {
    let battleNetAPI: BattleNetAPI
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    
    public func getClientAccessToken(clientID: String, clientSecret: String, completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        battleNetAPI.authentication.getClientAccess(completion: { $0.decode(completion: completion) })
    }
    
    
    public func getUserAccessToken(clientID: String, clientSecret: String, code: String, redirectURL: String, completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        battleNetAPI.authentication.getUserAccess(code: code, redirectURL: redirectURL, completion: { $0.decode(completion: completion) })
    }
    
    
    public func validateClientAccessToken(_ token: String, completion: @escaping (_ result: Result<ClientToken, Error>) -> Void) {
        battleNetAPI.authentication.validateClientAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    public func validateUserAccessToken(_ token: String, completion: @escaping (_ result: Result<UserToken, Error>) -> Void) {
        battleNetAPI.authentication.validateUserAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getOAuthURL(scope: Scope, redirectURL: URL, state: String) -> URL? {
        return battleNetAPI.authentication.getOAuthURL(scope: scope, redirectURL: redirectURL, state: state)
    }
}
