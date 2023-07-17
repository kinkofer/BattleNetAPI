//
//  Token.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



public struct ClientToken: Codable {
    public let clientID: String
    public let expiresIn: Int
    public let authorities: [Authority]
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case expiresIn = "exp"
        case authorities
    }
}

extension ClientToken: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
        ClientToken {
            clientID: \(clientID),
            expiresIn: \(expiresIn),
            authorities: \(authorities)
        }
        """
    }
}



public struct Authority: Codable {
    public let role: String
    
    enum CodingKeys: String, CodingKey {
        case role = "authority"
    }
}

extension Authority: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
        {authority: \(role)}
        """
    }
}
