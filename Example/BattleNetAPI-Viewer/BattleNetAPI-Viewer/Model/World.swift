//
//  World.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/8/21.
//

import BattleNetAPI
import SwiftUI


public class World: ObservableObject {
    @AppStorage("region") public var region = APIRegion.us
    @AppStorage("locale") public var locale = APILocale.en_US
    @AppStorage("clientAccessToken") var clientAccessToken: String?
    @AppStorage("userAccessToken") var userAccessToken: String?
    
    public var oauth: BattleNetOAuth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID], scheme: "BattleNetAPI", redirectUrl: "https://redirect.to", providerContext: AuthenticationContext())
    public lazy var credentials: BattleNetCredentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET",
                                                                             clientAccessToken: clientAccessToken, userAccessToken: userAccessToken)
}


// Save tokens for subsequent launches
extension World: BattleNetAuthDelegate {
    public func battleNetAPI(didChangeClientAccessToken token: String?) {
        print("Client Access Token: \(String(describing: token))")
        clientAccessToken = token
    }
    
    public func battleNetAPI(didChangeUserAccessToken token: String?) {
        print("User Access Token: \(String(describing: token))")
        userAccessToken = token
    }
}
