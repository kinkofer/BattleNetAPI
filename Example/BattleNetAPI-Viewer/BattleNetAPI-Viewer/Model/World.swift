//
//  World.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/8/21.
//

import BattleNetAPI
import Foundation
import Observation


@Observable public class World {
    public var region: APIRegion {
        didSet { UserDefaults.standard.set(region.rawValue, forKey: "region") }
    }
    public var locale: APILocale {
        didSet { UserDefaults.standard.set(locale.rawValue, forKey: "locale") }
    }
    var clientAccessToken: String? {
        didSet { UserDefaults.standard.set(clientAccessToken, forKey: "clientAccessToken") }
    }
    var userAccessToken: String? {
        didSet { UserDefaults.standard.set(userAccessToken, forKey: "userAccessToken") }
    }
    
    @ObservationIgnored public var oauth: BattleNetOAuth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID], scheme: "BattleNetAPI", redirectUrl: "https://redirect.to", providerContext: AuthenticationContext())
    @ObservationIgnored public lazy var credentials: BattleNetCredentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET",
                                                                             clientAccessToken: clientAccessToken, userAccessToken: userAccessToken)
    
    public init() {
        self.region = UserDefaults.standard.string(forKey: "region").flatMap(APIRegion.init(rawValue:)) ?? .us
        self.locale = UserDefaults.standard.string(forKey: "locale").flatMap(APILocale.init(rawValue:)) ?? .en_US
        self.clientAccessToken = UserDefaults.standard.string(forKey: "clientAccessToken")
        self.userAccessToken = UserDefaults.standard.string(forKey: "userAccessToken")
    }
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
