//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Jennewein on 6/28/20.
//

import AuthenticationServices
import BattleNetAPI
import SwiftUI


struct ContentView: View {
    enum Game: String, CaseIterable {
        case diablo3 = "Diablo 3"
        case starCraft2 = "StarCraft 2"
        case worldOfWarcraft = "World of Warcraft"
        case battleNet = "BattleNet Profile"
        
        var apiType: [APIType] {
            switch self {
            case .battleNet:
                return [.profile]
            case .diablo3:
                return [.gameData, .community]
            case .starCraft2:
                return [.gameData, .community]
            case .worldOfWarcraft:
                return [.gameData, .profile, .community]
            }
        }
    }
    
    
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @EnvironmentObject var authManager: AuthenticationManager
    
    @State private var showingAuthAlert = false
    @State var currentAPI: APIType?
    @State var currentGame: Game?
    
    
    var body: some View {
        List {
            ForEach(Game.allCases, id: \.rawValue) { game in
                Section(header: Text(game.rawValue)) {
                    ForEach(game.apiType, id: \.rawValue) { apiType in
                        Button(apiType.rawValue) {
                            if [.profile, .community].contains(apiType) {
                                currentAPI = apiType
                                currentGame = game
                                showingAuthAlert = true
                            }
                        }
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
        .alert(isPresented: $showingAuthAlert) {
            Alert(title: Text("User Authorization Required"), message: Text("These APIs require you sign in to your BattleNet account and grant permission to this app."),
                  primaryButton: .cancel(),
                  secondaryButton: .default(Text("Sign in")) {
                    guard let currentAPI = currentAPI, let currentGame = currentGame else { return }
                    authenticateUser(showAPI: (currentAPI, currentGame))
                  })
        }
    }
    
    
    func authenticateUser(showAPI: (APIType, Game)? = nil) {
        self.authManager.getUserAccessToken { result in
            switch result {
            case .success(let userAccessToken):
                if let (apiType, game) = showAPI {
//                    self.showAPI(type: apiType, for: game)
                }
            case .failure(let error):
                break
//                self.handleError(error)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
