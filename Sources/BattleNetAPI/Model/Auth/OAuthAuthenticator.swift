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
    var providerContext: ASWebAuthenticationPresentationContextProviding { get }
    
    func getUserAccessToken(completion: @escaping (_ result: Result<String, Error>) -> Void)
    func getUserAccessToken() async throws -> String
}
