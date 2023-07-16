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
    @AppStorage("clientAccessToken") var clientAccessToken: String?
    @AppStorage("userAccessToken") var userAccessToken: String?
    
    
    
    
    init() {
        // TODO: Restore tokens from a previous session
//        Current.credentials.clientAccessToken = clientAccessToken
//        Current.credentials.userAccessToken = userAccessToken
    }
    
    var body: some Scene {
        let current = World()
        let battleNetAPI = BattleNetAPI(credentials: current.credentials, session: .shared, region: current.region, locale: current.locale)
        let authManager = AuthenticationManager(battleNetAPI: battleNetAPI, oauth: current.oauth, providerContext: AuthenticationContext())
        
        WindowGroup {
            MainView()
                .environmentObject(current)
                .environmentObject(battleNetAPI)
                .environmentObject(authManager)
        }
    }
}
