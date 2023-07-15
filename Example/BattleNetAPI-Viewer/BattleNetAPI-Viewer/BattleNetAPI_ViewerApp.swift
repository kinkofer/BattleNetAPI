//
//  BattleNetAPI_ViewerApp.swift
//  BattleNetAPI-Viewer
//
//  Created by Christopher Jennewein on 7/15/23.
//

import SwiftUI
import BattleNetAPI


@main
struct BattleNetAPI_ViewerApp: App {
    let Current = World()
    
    init() {
        // TODO: Restore tokens from a previous session
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
