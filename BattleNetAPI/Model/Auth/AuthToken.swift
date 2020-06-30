//
//  AuthToken.swift
//  BattleNetAPI
//
//  Created by Chris Jennewein on 10/24/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct AuthToken {
    public static let clientID = "CLIENT_ID"
    public static let clientSecret = "CLIENT_SECRET"
    
    // For use with unit testing only
    public static let clientAccessToken: String? = nil // "CLIENT_ACCESS_TOKEN"
    public static let userAccessToken: String? = nil // "USER_ACCESS_TOKEN"
}
