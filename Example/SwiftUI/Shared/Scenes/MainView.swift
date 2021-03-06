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
        NavigationView {
            #if os(iOS)
            apiList
                .listStyle(SidebarListStyle())
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
                .listStyle(SidebarListStyle())
                .navigationTitle(Text(title))
            #endif
        }
        .alert(item: $alertType) {
            alert(for: $0)
        }
    }
    
    
    var apiList: some View {
        List {
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
            Section(header: Text(Game.diablo3.rawValue)) {
                NavigationLink(destination: Diablo3View(apiType: .gameData)) {
                    Text(APIType.gameData.displayName)
                }
//                .isDetailLink(false)
                
                NavigationLink(destination: Diablo3View(apiType: .community), tag: GameAPI(.diablo3, .community), selection: requiresUserAuthBinding) {
                    Text(APIType.community.displayName)
                }
                
                NavigationLink(destination: Diablo3View(apiType: .profile), tag: GameAPI(.diablo3, .profile), selection: requiresUserAuthBinding) {
                    Text(APIType.profile.displayName)
                }
            }
            
            Section(header: Text(Game.starCraft2.rawValue)) {
                NavigationLink(destination: Starcraft2View(apiType: .gameData)) {
                    Text(APIType.gameData.displayName)
                }
                
                NavigationLink(destination: Starcraft2View(apiType: .community), tag: GameAPI(.starCraft2, .community), selection: requiresUserAuthBinding) {
                    Text(APIType.community.displayName)
                }
            }
            
            Section(header: Text(Game.worldOfWarcraft.rawValue)) {
                NavigationLink(destination: WorldOfWarcraftView(apiType: .gameData)) {
                    Text(APIType.gameData.displayName)
                }
                
                NavigationLink(destination: WorldOfWarcraftView(apiType: .profile), tag: GameAPI(.worldOfWarcraft, .profile), selection: requiresUserAuthBinding) {
                    Text(APIType.profile.displayName)
                }
            }
            
            Section(header: Text(Game.worldOfWarcraftClassic.rawValue)) {
                NavigationLink(destination: WorldOfWarcraftClassicView(apiType: .gameData)) {
                    Text(APIType.gameData.displayName)
                }
            }
            
            Section(header: Text(Game.battleNet.rawValue)) {
                NavigationLink(destination: BattleNetView(apiType: .profile), tag: GameAPI(.battleNet, .profile), selection: requiresUserAuthBinding) {
                    Text(APIType.profile.displayName)
                }
            }
        }
    }
    
    
    
    // MARK: -
    
    func authenticateUser() {
        authManager.getUserAccessToken { result in
            switch result {
            case .success(let userAccessToken):
                print("User Access Token: \(userAccessToken)")
                alertType = .notify("Sign in successful")
            case .failure(let error):
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
        let message = alertType.message == nil ? nil : Text(alertType.message!)
        
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
