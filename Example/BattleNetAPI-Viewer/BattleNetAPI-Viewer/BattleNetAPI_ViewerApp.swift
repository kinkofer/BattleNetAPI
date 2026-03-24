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
    @State private var current = World()
    @State private var battleNetAPI: BattleNetAPI
    
    
    init() {
        let current = World()
        if CommandLine.arguments.contains("--resetUserAuth") {
            current.userAccessToken = nil
        }
        let api = BattleNetAPI(credentials: current.credentials, oauth: current.oauth, session: .shared, region: current.region, locale: current.locale)
        api.delegate = current
        _current = State(initialValue: current)
        _battleNetAPI = State(initialValue: api)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(current)
                .environment(battleNetAPI)
        }
    }
}
