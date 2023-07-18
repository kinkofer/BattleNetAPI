//
//  WS_Resource+Decoded.swift
//
//
//  Created by Christopher Jennewein on 7/17/23.
//

import Foundation


extension Decoded where WebService == WS_Resource {
    @available(*, renamed: "getResource(from:)")
    public func getResource<T: Decodable>(from resourceLink: Link<T>, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        Task {
            do {
                let result: T = try await getResource(from: resourceLink)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    public func getResource<T: Decodable>(from resourceLink: Link<T>) async throws -> T {
        let data = try await webService.getResource(from: resourceLink.href, apiType: .gameData)
        return try T.decode(from: data)
    }
}
