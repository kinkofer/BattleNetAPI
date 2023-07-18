//
//  WS_Resource.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/19/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol WS_ResourceService: WebService { }


public struct WS_Resource: WS_ResourceService {
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    var baseURL: URL? { return nil }
    
    var authenticationService: AuthenticationWebService?
    
    
    @available(*, renamed: "getResource(from:apiType:)")
    public func getResource(from url: String, apiType: APIType, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        Task {
            do {
                let result = try await getResource(from: url, apiType: apiType)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    public func getResource(from url: String, apiType: APIType) async throws -> Data {
        return try await callResource(url: url, apiType: apiType)
    }
}
