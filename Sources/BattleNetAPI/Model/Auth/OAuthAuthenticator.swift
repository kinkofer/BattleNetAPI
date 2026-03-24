//
//  OAuthAuthenticator.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation
import AuthenticationServices


/// A protocol for interfacing with the BattleNet OAuth service
protocol OAuthAuthenticator: AnyObject {
    var battleNetAPI: BattleNetAPI { get }
    var oauth: BattleNetOAuth { get }
    
    func getUserAccessToken() async throws -> String
}
