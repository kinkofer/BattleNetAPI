//
//  BattleNetAPI.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


/// This class is an interface to all the web services, with separate properties for accessing authentication, user, and specific game web services.
public class BattleNetAPI {
    /// Authenication web services
    public lazy var authentication = WS_Authentication(region: region, locale: locale)
    /// User web services
    public lazy var user = WS_User(region: region, locale: locale)
    
    /// World of Warcraft web services
    public lazy var wow = WS_WorldOfWarcraft(region: region, locale: locale)
    /// StarCraft 2 web services
    public lazy var sc2 = WS_StarCraft2(region: region, locale: locale)
    /// Diablo 3 web services
    public lazy var d3 = WS_Diablo3(region: region, locale: locale)
    
    
    let region: APIRegion
    let locale: APILocale
    
    
    public init(region: APIRegion, locale: APILocale) {
        self.region = region
        self.locale = locale
    }
}
