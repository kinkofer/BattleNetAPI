//
//  WS_User+Decoded.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Decoded where WebService == WS_User {
    /**
     Returns the account information of a user
     
     - parameter region: What region the request is being made
     - parameter completion: Returns a Result with the User if `success` or an HTTPError if `failure`
     */
    @available(*, renamed: "getUser()")
    public func getUser(completion: @escaping (_ result: Result<User, Error>) -> Void) {
        Task {
            do {
                let result = try await getUser()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    /**
     Returns the account information of a user
     
     - parameter region: What region the request is being made
     */
    public func getUser() async throws -> User {
        let data = try await webService.getUserInfo()
        return try User.decode(from: data)
    }
}
