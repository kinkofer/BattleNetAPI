//
//  AuthenticationModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit

class AuthenticationModelController {
    static let shared = AuthenticationModelController()
    private init() { }
    
    
    func getClientAccessToken(region: APIRegion = .us, clientID: String, clientSecret: String, completion: @escaping (_ result: Result<Access, HTTPError>) -> Void) {
        BattleNetAPI.authentication.getClientAccessToken(region: .us, clientID: clientID, clientSecret: clientSecret) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func getUserAccessToken(region: APIRegion = .us, clientID: String, clientSecret: String, code: String, redirectURL: String, completion: @escaping (_ result: Result<Access, HTTPError>) -> Void) {
        BattleNetAPI.authentication.getUserAccessToken(region: .us, clientID: clientID, clientSecret: clientSecret, code: code, redirectURL: redirectURL) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func validateClientAccessToken(_ token: String, region: APIRegion = .us, completion: @escaping (_ result: Result<ClientToken, HTTPError>) -> Void) {
        BattleNetAPI.authentication.validateClientAccessToken(token, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    func validateUserAccessToken(_ token: String, region: APIRegion = .us, completion: @escaping (_ result: Result<UserToken, HTTPError>) -> Void) {
        BattleNetAPI.authentication.validateUserAccessToken(token, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     - parameter region: The user's current region
     - parameter clientID: The clientID of your application, provided by Blizzard
     - parameter scope: The scope of information you're requesting from the user
     - parameter redirectURL: The redirect url that will be opened after the user has authenticated and will contain the code parameter.
    */
    func sendToOAuth(region: APIRegion = .us, clientID: String, scope: Scope, redirectURL: String) {
        if let url = URL(string: BattleNetAPI.authentication.getOAuthURL(region: region, clientID: clientID, scope: scope, redirectURL: redirectURL)),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    func getOAuthURL(region: APIRegion, clientID: String, scope: Scope, redirectURL: String) -> URL? {
        return URL(string: BattleNetAPI.authentication.getOAuthURL(region: region, clientID: clientID, scope: scope, redirectURL: redirectURL))
    }
}
