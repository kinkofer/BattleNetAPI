//
//  BattleNetAPI.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation
import Observation


/// This class is an interface to all the web services, with separate properties for accessing authentication, user, and specific game web services.
@Observable public class BattleNetAPI {
    public private(set) var credentials: BattleNetCredentials
    @ObservationIgnored let oauth: BattleNetOAuth
    @ObservationIgnored let session: URLSession
    public var region: APIRegion
    public var locale: APILocale?
    @ObservationIgnored public lazy var authenticationManager: AuthenticationManager = AuthenticationManager(battleNetAPI: self, oauth: oauth)

    @ObservationIgnored public var delegate: BattleNetAuthDelegate? = nil

    /// Authenication web services
    @ObservationIgnored public lazy private(set) var authentication = WS_Authentication(region: region, locale: locale, session: session, credentials: credentials, authDelegate: delegate)
    /// User web services
    @ObservationIgnored public lazy private(set) var user = WS_User(region: region, locale: locale, session: session, authenticationService: authentication)
    /// World of Warcraft web services
    @ObservationIgnored public lazy private(set) var wow = WS_WorldOfWarcraft(region: region, locale: locale, session: session, authenticationService: authentication)
    /// World of Warcraft Classic web services
    @ObservationIgnored public lazy private(set) var wowClassic = WS_WorldOfWarcraftClassic(region: region, locale: locale, session: session, authenticationService: authentication)
    /// StarCraft 2 web services
    @ObservationIgnored public lazy private(set) var sc2 = WS_StarCraft2(region: region, locale: locale, session: session, authenticationService: authentication)
    /// Diablo 3 web services
    @ObservationIgnored public lazy private(set) var d3 = WS_Diablo3(region: region, locale: locale, session: session, authenticationService: authentication)
    /// Web services for linked resource urls
    @ObservationIgnored public lazy private(set) var resource = WS_Resource(region: region, locale: locale, session: session, authenticationService: authentication)



    public init(credentials: BattleNetCredentials, oauth: BattleNetOAuth, session: URLSession = .shared, region: APIRegion = .us, locale: APILocale? = nil) {
        self.credentials = credentials
        self.oauth = oauth
        self.session = session
        self.region = region
        self.locale = locale

        validateCredentials()
    }


    private func validateCredentials() {
        if credentials.clientAccessToken != nil {
            Task {
                try? await self.authenticationManager.getClientAccessToken()
            }
        }
        if credentials.userAccessToken != nil {
            Task {
                try? await self.authenticationManager.getUserAccessToken()
            }
        }
    }
}
