//
//  WS_User.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class WS_User: WebService {
    private let network = Network.shared
    
    func getBaseURL(region: APIRegion, apiType: APIType?) -> String {
        return "\(region.oauthURI)"
    }
    
    
    
    // MARK: - Account API
    
    /**
     Returns the account information of a user
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    func getUserInfo(region: APIRegion, completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        let apiType: APIType = .profile
        let urlStr = getBaseURL(region: region, apiType: apiType) + "/userinfo"
        
        self.callWebService(urlStr: urlStr, method: .get, apiType: apiType) { result in
            completion(result)
        }
    }
}
