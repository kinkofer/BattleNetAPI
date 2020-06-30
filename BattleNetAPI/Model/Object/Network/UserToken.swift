//
//  UserToken.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class UserToken: Codable {
    public let clientID: String
    public let expiresIn: Int
    public let authorities: [String]
    public let scope: [String]
    public let userName: String
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case expiresIn = "exp"
        case authorities
        case scope
        case userName = "user_name"
    }
}

extension UserToken: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
        UserToken {
            clientID: \(clientID),
            expiresIn: \(expiresIn),
            authorities: \(authorities),
            scope: \(scope),
            userName: \(userName)
        }
        """
    }
}
