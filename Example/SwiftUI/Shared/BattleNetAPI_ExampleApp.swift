//
//  BattleNetAPI_ExampleApp.swift
//  Shared
//
//  Created by Christopher Jennewein on 6/28/20.
//

import BattleNetAPI
import SwiftUI

@main
struct BattleNetAPI_ExampleApp: App {
    let Current = World()
    
    init() {
        // Restore tokens from a previous session
        Current.credentials.clientAccessToken = nil
        Current.credentials.userAccessToken = nil
    }
    
    var body: some Scene {
        let battleNetAPI = BattleNetAPI(credentials: Current.credentials, session: .shared, region: Current.region, locale: Current.locale)
        let authManager = AuthenticationManager(battleNetAPI: battleNetAPI, oauth: Current.oauth, providerContext: AuthenticationContext())
        
        WindowGroup {
            MainView()
                .environmentObject(Current)
                .environmentObject(battleNetAPI)
                .environmentObject(authManager)
        }
    }
}
