//
//  MainView.swift
//  Shared
//
//  Created by Christopher Jennewein on 6/28/20.
//

import AuthenticationServices
import BattleNetAPI
import SwiftUI


struct MainView: View {
    enum Game: String, CaseIterable {
        case diablo3 = "Diablo 3"
        case starCraft2 = "StarCraft 2"
        case worldOfWarcraft = "World of Warcraft"
        case worldOfWarcraftClassic = "World of Warcraft Classic"
        case battleNet = "BattleNet Profile"
    }
    
    struct GameAPI: Hashable {
        let game: MainView.Game
        let api: APIType
        
        var requiresUserAuth: Bool {
            return [.profile, .community].contains(api)
        }
        
        init(_ game: MainView.Game, _ api: APIType) {
            self.game = game
            self.api = api
        }
    }
    
    @Environment(World.self) private var current
    @Environment(BattleNetAPI.self) private var battleNetAPI
    
    @State private var gameAPISelection: GameAPI?
    @State private var alertType: AlertType?
    
    let title = "BattleNetAPI Viewer"
    
    
    // MARK: - Views
    
    var body: some View {
        NavigationSplitView {
            List(selection: Binding(
                get: { return gameAPISelection },
                set: { newValue in
                    guard let gameAPI = newValue else { self.gameAPISelection = nil; return }
                    
                    if gameAPI.requiresUserAuth && battleNetAPI.credentials.userAccessToken == nil {
                        alertType = .authError
                    }
                    else {
                        gameAPISelection = newValue
                    }
                }
            )) {
                apiList
            }
                .listStyle(.sidebar)
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        HStack {
                            RegionMenu()

                            profileButton
                            
                        }
                    }
                }
        } content: {
            if let game = gameAPISelection {
                switch game {
                case GameAPI(.diablo3, .gameData):
                    Diablo3View(apiType: .gameData)
                case GameAPI(.diablo3, .community):
                    Diablo3View(apiType: .community)
                case GameAPI(.diablo3, .profile):
                    Diablo3View(apiType: .profile)
                case GameAPI(.starCraft2, .gameData):
                    Starcraft2View(apiType: .gameData)
                case GameAPI(.starCraft2, .community):
                    Starcraft2View(apiType: .community)
                case GameAPI(.worldOfWarcraft, .gameData):
                    WorldOfWarcraftView(apiType: .gameData)
                case GameAPI(.worldOfWarcraft, .profile):
                    WorldOfWarcraftView(apiType: .profile)
                case GameAPI(.worldOfWarcraftClassic, .gameData):
                    WorldOfWarcraftClassicView(apiType: .gameData)
                case GameAPI(.battleNet, .profile):
                    BattleNetView(apiType: .profile)
                default: EmptyView()
                }
            }
            else {
                Text("Select an API")
            }
        } detail: {
            Text("Select a method")
        }
        .alert(alertTitle, isPresented: showingAlert, presenting: alertType) { alertType in
            alertActions(for: alertType)
        } message: { alertType in
            if let message = alertType.message {
                Text(message)
            }
        }
    }
    
    
    @ViewBuilder
    var apiList: some View {
        Section(header: Text(Game.diablo3.rawValue)) {
            NavigationLink(APIType.gameData.displayName, value: GameAPI(.diablo3, .gameData))
            NavigationLink(APIType.community.displayName, value: GameAPI(.diablo3, .community))
            NavigationLink(APIType.profile.displayName, value: GameAPI(.diablo3, .profile))
        }
        
        Section(header: Text(Game.starCraft2.rawValue)) {
            NavigationLink(APIType.gameData.displayName, value: GameAPI(.starCraft2, .gameData))
            NavigationLink(APIType.community.displayName, value: GameAPI(.starCraft2, .community))
        }
        
        Section(header: Text(Game.worldOfWarcraft.rawValue)) {
            NavigationLink(APIType.gameData.displayName, value: GameAPI(.worldOfWarcraft, .gameData))
            NavigationLink(APIType.profile.displayName, value: GameAPI(.worldOfWarcraft, .profile))
        }
        
        Section(header: Text(Game.worldOfWarcraftClassic.rawValue)) {
            NavigationLink(APIType.gameData.displayName, value: GameAPI(.worldOfWarcraftClassic, .gameData))
        }
        
        Section(header: Text(Game.battleNet.rawValue)) {
            NavigationLink(APIType.profile.displayName, value: GameAPI(.battleNet, .profile))
        }
    }
    
    
    var profileButton: some View {
        Button(action: {
            if battleNetAPI.credentials.userAccessToken == nil {
                alertType = .authConfirm
            }
            else {
                alertType = .signedIn
            }
        }) {
            let imageName = battleNetAPI.credentials.userAccessToken == nil ? "person.circle" : "person.circle.fill"
            Image(systemName: imageName)
        }
        .accessibilityIdentifier("profileButton")
    }
    
    
    
    // MARK: -
    
    func authenticateUser() {
        Task {
            do {
                let _ = try await battleNetAPI.authenticationManager.getUserAccessToken()
                alertType = .notify("Sign in successful")
            }
            catch {
                alertType = .error(error)
            }
        }
    }
    
    func signOutUser() {
        battleNetAPI.credentials.userAccessToken = nil
        current.userAccessToken = nil
        alertType = .notify("Signed out")
    }
}



// MARK: - Alert

extension MainView {
    enum AlertType {
        case error(Error)
        case notify(String)
        case authError
        case authConfirm
        case signedIn
        
        var title: String {
            switch self {
            case .error: return "Error"
            case .notify(let title): return title
            case .authError: return "User Authorization Required"
            case .authConfirm: return "Sign In?"
            case .signedIn: return "Currently signed in"
            }
        }
        
        var message: String? {
            switch self {
            case .error(let error): return error.localizedDescription
            case .notify: return nil
            case .authError: return "These APIs require you sign in to your BattleNet account and grant permission to this app. Please sign in above."
            case .authConfirm: return "Some APIs require you sign in to your BattleNet account and grant permission to this app."
            case .signedIn: return "You are currently signed in to your BattleNet account."
            }
        }
    }
    
    
    private var alertTitle: String {
        alertType?.title ?? ""
    }
    
    private var showingAlert: Binding<Bool> {
        Binding(
            get: { alertType != nil },
            set: { if !$0 { alertType = nil } }
        )
    }
    
    @ViewBuilder
    private func alertActions(for alertType: AlertType) -> some View {
        switch alertType {
        case .authConfirm:
            Button("Sign in") { authenticateUser() }
            Button("Cancel", role: .cancel) { }
        case .signedIn:
            Button("Sign out", role: .destructive) { signOutUser() }
            Button("Cancel", role: .cancel) { }
        default:
            Button("OK", role: .cancel) { }
        }
    }
}



struct RegionMenu: View {
    @Environment(World.self) private var current
    @Environment(BattleNetAPI.self) private var battleNetAPI
    
    var body: some View {
        Menu {
            Menu(APIRegion.us.displayName) {
                ForEach(APIRegion.us.supportedLocales, id: \.self) { locale in
                    Button("\(locale.flag) \(locale.language)") {
                        setRegion(.us, locale: locale)
                    }
                }
            }
            Menu(APIRegion.eu.displayName) {
                ForEach(APIRegion.eu.supportedLocales, id: \.self) { locale in
                    Button("\(locale.flag) \(locale.language)") {
                        setRegion(.eu, locale: locale)
                    }
                }
            }
            
            Button("\(APILocale.ko_KR.flag) \(APILocale.ko_KR.language)") {
                setRegion(.kr, locale: .ko_KR)
            }
            Button("\(APILocale.zh_TW.flag) \(APILocale.zh_TW.language)") {
                setRegion(.tw, locale: .zh_TW)
            }
            Button("\(APILocale.zh_CN.flag) \(APILocale.zh_CN.language)") {
                setRegion(.cn, locale: .zh_CN)
            }
        } label: {
            Text(current.locale.flag)
        }
        .menuStyle(.button)
    }
    
    private func setRegion(_ region: APIRegion, locale: APILocale) {
        current.region = region
        current.locale = locale
        battleNetAPI.region = region
        battleNetAPI.locale = locale
    }
}



// MARK: - Preview

#Preview {
    let current = World()
    let battleNetAPI = BattleNetAPI(credentials: current.credentials, oauth: current.oauth, session: .shared, region: current.region, locale: current.locale)
    
    MainView()
        .environment(current)
        .environment(battleNetAPI)
}



