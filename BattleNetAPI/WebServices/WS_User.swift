//
//  WS_User.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WS_User: WebService {
    public enum API: APICall {
        // Profile APIs
        case userInfo
        
        var path: String {
            switch self {
            case .userInfo:
                return "/userinfo"
            }
        }
        
        var apiType: APIType? {
            switch self {
            case .userInfo:
                return .profile
            }
        }
        
        var basePath: String? { return nil }
    }
    
    
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return URL(string: region.oauthURI) }
    
    var authenticationService: AuthenticationWebService?
    
    
    
    // MARK: - Account API
    
    /**
     Returns the account information of a user
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func getUserInfo(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: API.userInfo) { result in
            completion(result)
        }
    }
}
