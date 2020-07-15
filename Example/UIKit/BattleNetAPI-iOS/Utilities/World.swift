//
//  World.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import Foundation
import BattleNetAPI


public var Current = World()


public struct World {
    public var region = APIRegion.us
    public var locale = APILocale.en_US
    
    public var oauth: BattleNetOAuth = BattleNetOAuth(scope: [.sc2, .wow], scheme: "BattleNetAPI", redirectUrl: "https://rediret.to/BattleNetAPI")
    public var credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET",
                                       clientAccessToken: nil, userAccessToken: nil)
}
