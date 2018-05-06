//
//  Token.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation



class ClientToken: Codable {
    var clientID: String = ""
    var expiresIn: Int = 0
    var authorities = [Authority]()
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case expiresIn = "exp"
        case authorities
    }
}

extension ClientToken: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        ClientToken {
            clientID: \(clientID),
            expiresIn: \(expiresIn),
            authorities: \(authorities)
        }
        """
    }
}



class Authority: Codable {
    var role = ""
    
    enum CodingKeys: String, CodingKey {
        case role = "authority"
    }
}

extension Authority: CustomDebugStringConvertible {
    var debugDescription: String {
        return """
        {authority: \(role)}
        """
    }
}
