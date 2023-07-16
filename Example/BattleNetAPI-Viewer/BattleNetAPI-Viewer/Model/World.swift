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
    
    public var oauth: BattleNetOAuth = BattleNetOAuth(scope: [.d3, .sc2, .wow, .openID], scheme: "BattleNetAPI", redirectUrl: "https://redirect.to/")
    public var credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET",
                                       clientAccessToken: nil, userAccessToken: nil)
}
