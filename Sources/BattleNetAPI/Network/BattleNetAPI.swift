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
    public private(set) var credentials: BattleNetCredentials
    let session: URLSession
    let region: APIRegion
    let locale: APILocale?
    
    
    /// Authenication web services
    public lazy private(set) var authentication = WS_Authentication(region: region, locale: locale, session: session, credentials: credentials)
    /// User web services
    public lazy private(set) var user = WS_User(region: region, locale: locale, session: session, authenticationService: authentication)
    /// World of Warcraft web services
    public lazy private(set) var wow = WS_WorldOfWarcraft(region: region, locale: locale, session: session, authenticationService: authentication)
    /// World of Warcraft Classic web services
    public lazy private(set) var wowClassic = WS_WorldOfWarcraftClassic(region: region, locale: locale, session: session, authenticationService: authentication)
    /// StarCraft 2 web services
    public lazy private(set) var sc2 = WS_StarCraft2(region: region, locale: locale, session: session, authenticationService: authentication)
    /// Diablo 3 web services
    public lazy private(set) var d3 = WS_Diablo3(region: region, locale: locale, session: session, authenticationService: authentication)
    /// Web services for linked resource urls
    public lazy private(set) var resource = WS_Resource(region: region, locale: locale, session: session, authenticationService: authentication)
    
    
    
    public init(credentials: BattleNetCredentials, session: URLSession = URLSession.shared, region: APIRegion = .us, locale: APILocale? = nil) {
        self.credentials = credentials
        self.session = session
        self.region = region
        self.locale = locale
    }
}
