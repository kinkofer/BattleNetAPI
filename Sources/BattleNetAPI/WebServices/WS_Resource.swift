//
//  WS_Resource.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/19/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol WS_ResourceService: WebService {
    
}



public struct WS_Resource: WS_ResourceService {
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return nil }
    
    var authenticationService: AuthenticationWebService?
    
    
    public func getResource(from url: String, apiType: APIType, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        callResource(url: url, apiType: apiType, completion: completion)
    }
}
