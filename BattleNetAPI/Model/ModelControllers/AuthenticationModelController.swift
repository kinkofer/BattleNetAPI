//
//  AuthenticationModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit

public struct AuthenticationModelController {
    let battleNetAPI: BattleNetAPI
    
    var region: APIRegion
    var locale: APILocale?
    
    public init(region: APIRegion, locale: APILocale?) {
        self.battleNetAPI = BattleNetAPI(region: .us, locale: .en_US)
        self.region = region
        self.locale = locale
    }
    
    
    public func getClientAccessToken(clientID: String, clientSecret: String, completion: @escaping (_ result: Result<Access, HTTPError>) -> Void) {
        battleNetAPI.authentication.getClientAccessToken(region: region, clientID: clientID, clientSecret: clientSecret) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func getUserAccessToken(clientID: String, clientSecret: String, code: String, redirectURL: String, completion: @escaping (_ result: Result<Access, HTTPError>) -> Void) {
        battleNetAPI.authentication.getUserAccessToken(region: region, clientID: clientID, clientSecret: clientSecret, code: code, redirectURL: redirectURL) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func validateClientAccessToken(_ token: String, completion: @escaping (_ result: Result<ClientToken, HTTPError>) -> Void) {
        battleNetAPI.authentication.validateClientAccessToken(token, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    public func validateUserAccessToken(_ token: String, completion: @escaping (_ result: Result<UserToken, HTTPError>) -> Void) {
        battleNetAPI.authentication.validateUserAccessToken(token, region: region) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     - parameter region: The user's current region
     - parameter clientID: The clientID of your application, provided by Blizzard
     - parameter scope: The scope of information you're requesting from the user
     - parameter redirectURL: The redirect url that will be opened after the user has authenticated and will contain the code parameter.
    */
    public func sendToOAuth(clientID: String, scope: Scope, redirectURL: String) {
        if let url = URL(string: battleNetAPI.authentication.getOAuthURL(region: region, clientID: clientID, scope: scope, redirectURL: redirectURL)),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    public func getOAuthURL(clientID: String, scope: Scope, redirectURL: String) -> URL? {
        return URL(string: battleNetAPI.authentication.getOAuthURL(region: region, clientID: clientID, scope: scope, redirectURL: redirectURL))
    }
}
