//
//  WS_Authentication+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_Authentication {
    /**
     Returns the access object configured for your application
     
     - parameter completion: Returns a Result with the Access object if `success` or an HTTPError if `failure`
     - note: This access token will not return specific user information. If that is needed, you must receive a user access token through OAuth
     */
    public func getClientAccess(completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        webService.getClientAccess(completion: { $0.decode(completion: completion) })
    }
    
    
    /**
     Returns the access object configured for your application
     
     - note: This access token will not return specific user information. If that is needed, you must receive a user access token through OAuth
     */
    public func getClientAccess() async throws -> Access {
        let data = try await webService.getClientAccess()
        return try Access.decode(from: data)
    }
    
    
    /**
     Returns the access object configured for the user that logged in through OAuth
     
     - parameter code: The code returned to the app when the user logs in through OAuth
     - parameter redirectURL: The url provided to the OAuth
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getUserAccess(code: String, redirectURL: String, completion: @escaping (_ result: Result<Access, Error>) -> Void) {
        webService.getUserAccess(code: code, redirectURL: redirectURL, completion: { $0.decode(completion: completion) })
    }
    
    
    /**
     Returns the access object configured for the user that logged in through OAuth
     
     - parameter code: The code returned to the app when the user logs in through OAuth
     - parameter redirectURL: The url provided to the OAuth
     */
    public func getUserAccess(code: String, redirectURL: String) async throws -> Access {
        let data = try await webService.getUserAccess(code: code, redirectURL: redirectURL)
        return try Access.decode(from: data)
    }
    
    
    /**
     Checks if the client token is valid to be used with web service calls
     
     - parameter token: The client token saved in the app
     - parameter completion: Returns a Result with the ClientToken if `success` or an HTTPError if `failure`
     */
    public func validateClientAccessToken(_ token: String, completion: @escaping (_ result: Result<ClientToken, Error>) -> Void) {
        webService.validateClientAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    /**
     Checks if the client token is valid to be used with web service calls
     
     - parameter token: The client token saved in the app
     */
    public func validateClientAccessToken(_ token: String) async throws -> ClientToken {
        let data = try await webService.validateClientAccessToken(token)
        return try ClientToken.decode(from: data)
    }
    
    
    /**
     Checks if the user access token is valid to be used with profile web service calls
     
     - parameter token: The client token saved in the app
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func validateUserAccessToken(_ token: String, completion: @escaping (_ result: Result<UserToken, Error>) -> Void) {
        webService.validateUserAccessToken(token, completion: { $0.decode(completion: completion) })
    }
    
    
    /**
     Checks if the user access token is valid to be used with profile web service calls
     
     - parameter token: The user access token saved in the app
     */
    public func validateUserAccessToken(_ token: String) async throws -> UserToken {
        let data = try await webService.validateUserAccessToken(token)
        return try UserToken.decode(from: data)
    }
}
