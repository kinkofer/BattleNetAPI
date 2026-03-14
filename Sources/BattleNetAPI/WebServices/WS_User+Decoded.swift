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
     */
    public func getUser() async throws -> User {
        let data = try await webService.getUserInfo()
        return try User.decode(from: data)
    }
}
