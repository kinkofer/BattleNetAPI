//
//  BattleNetOAuth.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation
import AuthenticationServices


/// A struct to hold the configuration needed to interface with the BattleNet OAuth service
public struct BattleNetOAuth {
    /// The permissions being requested (which games the user is permitting the app to access)
    let scope: Scope
    /// The app scheme
    let scheme: String
    /// The redirect url for OAuth
    let redirectUrl: String
    /**
     An instance of ASWebAuthenticationPresentationContextProviding that indicates how authentication will be shown (i.e. in a new view/window)
     
     For a simple, cross-platofrm implementation you can use this:
     ```
     class AuthenticationContext: NSObject, ASWebAuthenticationPresentationContextProviding {
         func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
             return ASPresentationAnchor()
         }
     }
     ```
     */
    let providerContext: ASWebAuthenticationPresentationContextProviding
    
    
    public init(scope: Scope, scheme: String, redirectUrl: String, providerContext: ASWebAuthenticationPresentationContextProviding) {
        self.scope = scope
        self.scheme = scheme
        self.redirectUrl = redirectUrl
        self.providerContext = providerContext
    }
}
