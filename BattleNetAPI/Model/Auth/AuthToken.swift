//
//  AuthToken.swift
//  BattleNetAPI
//
//  Created by Chris Jennewein on 10/24/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


struct AuthToken {
    static let clientID = "CLIENT_ID"
    static let clientSecret = "CLIENT_SECRET"
    
    // For use with unit testing only
    static let clientAccessToken: String? = nil // "CLIENT_ACCESS_TOKEN"
    static let userAccessToken: String? = nil // "USER_ACCESS_TOKEN"
}
