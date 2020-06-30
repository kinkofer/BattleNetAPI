//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Jennewein on 6/28/20.
//

import SwiftUI
import BattleNetAPI


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
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Sign In")
            }
            List {
                ForEach(Game.allCases, id: \.rawValue) { game in
                    Section(header: Text(game.rawValue)) {
                        ForEach(game.apiType, id: \.rawValue) { apiType in
                            Text(apiType.rawValue)
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
