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
    let session: URLSession
    let region: APIRegion
    let locale: APILocale
    
    /// Authenication web services
    public lazy private(set) var authentication = WS_Authentication(region: region, locale: locale, session: session)
    /// User web services
    public lazy private(set) var user = WS_User(region: region, locale: locale, session: session)
    /// World of Warcraft web services
    public lazy private(set) var wow = WS_WorldOfWarcraft(region: region, locale: locale, session: session)
    /// StarCraft 2 web services
    public lazy private(set) var sc2 = WS_StarCraft2(region: region, locale: locale, session: session)
    /// Diablo 3 web services
    public lazy private(set) var d3 = WS_Diablo3(region: region, locale: locale, session: session)
    
    
    
    public init(region: APIRegion, locale: APILocale, session: URLSession = URLSession.shared) {
        self.region = region
        self.locale = locale
        self.session = session
    }
}
