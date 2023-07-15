//
//  AuthenticationRepository.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct AuthenticationRepository {
    let battleNetAPI: BattleNetAPI
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    
    public func getClientAccessToken(clientID: String, clientSecret: String, completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        battleNetAPI.authentication.getClientAccess(completion: { $0.decode(completion: completion) })
    }
    
    public func getClientAccessToken(clientID: String, clientSecret: String) async throws -> Access {
        let data = try await battleNetAPI.authentication.getClientAccess()
        return try Access.decode(from: data)
    }
    
    
    public func getUserAccessToken(clientID: String, clientSecret: String, code: String, redirectURL: String, completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        battleNetAPI.authentication.getUserAccess(code: code, redirectURL: redirectURL, completion: { $0.decode(completion: completion) })
    }
    
    
    public func getUserAccessToken(clientID: String, clientSecret: String, code: String, redirectURL: String) async throws -> Access {
        let data = try await battleNetAPI.authentication.getUserAccess(code: code, redirectURL: redirectURL)
        return try Access.decode(from: data)
    }
    
    
    public func validateClientAccessToken(_ token: String, completion: @escaping (_ result: Result<ClientToken, Error>) -> Void) {
        battleNetAPI.authentication.validateClientAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    public func validateClientAccessToken(_ token: String) async throws -> ClientToken {
        let data = try await battleNetAPI.authentication.validateClientAccessToken(token)
        return try ClientToken.decode(from: data)
    }
    
    
    public func validateUserAccessToken(_ token: String, completion: @escaping (_ result: Result<UserToken, Error>) -> Void) {
        battleNetAPI.authentication.validateUserAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    public func validateUserAccessToken(_ token: String) async throws -> UserToken {
        let data = try await battleNetAPI.authentication.validateUserAccessToken(token)
        return try UserToken.decode(from: data)
    }
    
    
    public func getOAuthURL(scope: Scope, redirectURL: URL, state: String) -> URL? {
        return battleNetAPI.authentication.getOAuthURL(scope: scope, redirectURL: redirectURL, state: state)
    }
}
