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
    let current = World()
    let battleNetAPI: BattleNetAPI
    
    
    init() {
        battleNetAPI = BattleNetAPI(credentials: current.credentials, oauth: current.oauth, session: .shared, region: current.region, locale: current.locale)
        battleNetAPI.delegate = current
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(current)
                .environmentObject(battleNetAPI)
        }
    }
}
