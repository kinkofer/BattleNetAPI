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
    
    public var scheme = "APP_SCHEME"
    public var redirectUrl = "REDIRECT_URL"
}
