//
//  UserToken.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



class UserToken: Codable {
    var clientID: String = ""
    var expiresIn: Int = 0
    var authorities = [String]()
    var scope = [String]()
    var userName = ""
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case expiresIn = "exp"
        case authorities
        case scope
        case userName = "user_name"
    }
}

extension UserToken: CustomDebugStringConvertible {
    var debugDescription: String {
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
