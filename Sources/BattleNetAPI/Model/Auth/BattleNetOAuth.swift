//
//  BattleNetOAuth.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


/// A struct to hold the configuration needed to interface with the BattleNet OAuth service
public struct BattleNetOAuth {
    /// The permissions being requested (which games the user is permitting the app to access)
    let scope: Scope
    /// The app scheme
    let scheme: String
    /// The redirect url for OAuth
    let redirectUrl: String
    
    
    public init(scope: Scope, scheme: String, redirectUrl: String) {
        self.scope = scope
        self.scheme = scheme
        self.redirectUrl = redirectUrl
    }
}
