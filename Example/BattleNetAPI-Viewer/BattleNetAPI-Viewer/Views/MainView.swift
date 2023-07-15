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
    
    
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @EnvironmentObject var authManager: AuthenticationManager
    
    @State var gameAPISelection: GameAPI?
    @State var alertType: AlertType?
    
    let title = "BattleNet API"
    
    
    // MARK: - Views
    
    var body: some View {
        NavigationSplitView {
            #if os(iOS)
            apiList
                .listStyle(.sidebar)
                .navigationTitle(Text(title))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            if battleNetAPI.credentials.userAccessToken == nil {
                                alertType = .authConfirm
                            }
                            else {
                                alertType = .notify("Currently signed in")
                            }
                        }) {
                            Image(systemName: "person.circle")
                        }
                    }
                }
            #elseif os(macOS)
            apiList
                .listStyle(.sidebar)
                .navigationTitle(Text(title))
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: {
                            if battleNetAPI.credentials.userAccessToken == nil {
                                alertType = .authConfirm
                            }
                            else {
                                alertType = .notify("Currently signed in")
                            }
                        }) {
                            Image(systemName: "person.circle")
                        }
                    }
                }
            #endif
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
        .alert(item: $alertType) {
            alert(for: $0)
        }
    }
    
    
    var apiList: some View {
        let requiresUserAuthBinding = Binding(
            get: { return self.gameAPISelection },
            set: { newValue in
                guard let gameAPI = newValue else { self.gameAPISelection = nil; return }
                
                if gameAPI.requiresUserAuth && battleNetAPI.credentials.userAccessToken == nil {
                    alertType = .authError
                }
                else {
                    self.gameAPISelection = newValue
                }
            }
        )
        return List(selection: requiresUserAuthBinding) {
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
    }
    
    
    
    // MARK: -
    
    func authenticateUser() {
        Task {
            do {
                let userAccessToken = try await authManager.getUserAccessToken()
                print("User Access Token: \(userAccessToken)")
                alertType = .notify("Sign in successful")
            }
            catch {
                alertType = .error(error)
            }
        }
    }
}



// MARK: - Alert

extension MainView {
    enum AlertType: Identifiable {
        case error(Error)
        case notify(String)
        case authError
        case authConfirm
        
        
        var id: String {
            switch self {
            case .error: return "error"
            case .notify: return "notify"
            case .authError: return "authError"
            case .authConfirm: return "authconfirm"
            }
        }
        
        var title: String {
            switch self {
            case .error: return "Error"
            case .notify(let title): return title
            case .authError: return "User Authorization Required"
            case .authConfirm: return "Sign In?"
            }
        }
        
        var message: String? {
            switch self {
            case .error(let error): return error.localizedDescription
            case .notify: return nil
            case .authError: return "These APIs require you sign in to your BattleNet account and grant permission to this app. Please sign in above."
            case .authConfirm: return "Some APIs require you sign in to your BattleNet account and grant permission to this app."
            }
        }
    }
    
    
    private func alert(for alertType: AlertType) -> Alert {
        let message = alertType.message.map { Text($0) }
        
        switch alertType {
        case .error(let error):
            return Alert(error: error)
        case .notify:
            return Alert(title: Text(alertType.title))
        case .authError:
            return Alert(title: Text(alertType.title), message: message)
        case .authConfirm:
            return Alert(title: Text(alertType.title), message: message,
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("Sign in")) {
                    authenticateUser()
                  })
        }
    }
}



// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
