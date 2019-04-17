//
//  Access.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class Access: Codable {
    var token: String
    var type: String
    var expiresIn: Int
    var scope: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case type = "token_type"
        case expiresIn = "expires_in"
        case scope
    }
}


extension Access: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
        Access {
            token: \(token),
            type: \(type),
            expiresIn: \(expiresIn),
            scope: \(scope ?? "")
        }
        """
    }
}
