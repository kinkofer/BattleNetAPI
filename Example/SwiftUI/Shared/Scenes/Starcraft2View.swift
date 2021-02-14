//
//  Starcraft2View.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct Starcraft2View: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "StarCraft 2 API"
    
    
    
    // MARK: - Views
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .alert(item: $alertType) {
                alert(for: $0)
            }
    }
    
    
    var apiList: some View {
        List {
            if apiType == .gameData {
                gameDataSection
            }
            else if apiType == .community {
                communitySection
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    
    var gameDataSection: some View {
        Section(header: Text(APIType.gameData.displayName)) {
            webServiceRow(api: .getLeagueData) {
                battleNetAPI.sc2.getLeagueData(seasonID: 37, queue: .lotV1v1, team: .arranged, league: .grandmaster, completion: { parseResult($0, for: .getLeagueData) })
            }
        }
    }
    
    
    var communitySection: some View {
        Group {
            Section(header: Text("Profile API")) {
                webServiceRow(api: .static) {
                    battleNetAPI.sc2.getProfileData(sc2Region: .us, completion: { parseResult($0, for: .static) })
                }
                webServiceRow(api: .metadata) {
                    battleNetAPI.sc2.getProfileMetadata(id: 20807579, sc2Region: .us, realmID: 1, completion: { parseResult($0, for: .metadata) })
                }
                webServiceRow(api: .profile) {
                    battleNetAPI.sc2.getProfile(id: 20807579, sc2Region: .us, realmID: 1, completion: { parseResult($0, for: .profile) })
                }
                webServiceRow(api: .ladderSummary) {
                    battleNetAPI.sc2.getLadderSummary(profileID: 20807579, sc2Region: .us, realmID: 1, completion: { parseResult($0, for: .ladderSummary) })
                }
                webServiceRow(api: .ladder) {
                    battleNetAPI.sc2.getLadder(id: 296837, profileID: 20807579, sc2Region: .us, realmID: 1, completion: { parseResult($0, for: .ladder) })
                }
            }
            
            Section(header: Text("Ladder API")) {
                webServiceRow(api: .grandmasterLeaderboard) {
                    battleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: .us, completion: { parseResult($0, for: .grandmasterLeaderboard) })
                }
                webServiceRow(api: .season) {
                    battleNetAPI.sc2.getLadderSeason(sc2Region: .us, completion: { parseResult($0, for: .season) })
                }
            }
            
            Section(header: Text("Account API")) {
                webServiceRow(api: .player) {
                    battleNetAPI.sc2.getPlayer(accountID: 20807579, completion: { parseResult($0, for: .player) })
                }
            }
            
            Section(header: Text("Legacy API")) {
                webServiceRow(api: .profileLegacy) {
                    battleNetAPI.sc2.getProfile(sc2Region: .us, realmID: 1, profileID: 20807579, completion: { parseResult($0, for: .profileLegacy) })
                }
                webServiceRow(api: .ladders) {
                    battleNetAPI.sc2.getLadders(sc2Region: .us, realmID: 1, profileID: 20807579, completion: { parseResult($0, for: .ladders) })
                }
                webServiceRow(api: .matchHistory) {
                    battleNetAPI.sc2.getMatchHistory(sc2Region: .us, realmID: 1, profileID: 20807579, completion: { parseResult($0, for: .matchHistory) })
                }
                webServiceRow(api: .ladderLegacy) {
                    battleNetAPI.sc2.getLadder(sc2Region: .us, ladder: 296837, completion: { parseResult($0, for: .ladderLegacy) })
                }
                webServiceRow(api: .achievements) {
                    battleNetAPI.sc2.getAchievements(sc2Region: .us, completion: { parseResult($0, for: .achievements) })
                }
                webServiceRow(api: .rewards) {
                    battleNetAPI.sc2.getRewards(sc2Region: .us, completion: { parseResult($0, for: .rewards) })
                }
            }
        }
    }
    
    
    func webServiceRow(api: API, webService: @escaping () -> Void) -> some View {
        let selectionBinding: Binding<API?> = Binding(
            get: { return apiSelection },
            set: { newValue in
                guard newValue != nil else { self.apiSelection = nil; return }
                webService()
            }
        )
        return NavigationLink(destination: WebServiceView(title: api.rawValue, data: webServiceData), tag: api, selection: selectionBinding) {
            Text(api.rawValue)
        }
    }
    
    
    
    // MARK: - Web Services
    
    /// Parses a web service result, preparing to navigate to WebServiceView is success, or showing an error if failure.
    func parseResult(_ result: Result<Data, Error>, for selection: API) {
        switch result {
        case .success(let data):
            webServiceData = data
            apiSelection = selection
        case .failure(let error):
            alertType = .error(error)
        }
    }
}



// MARK: - Alert

extension Starcraft2View {
    enum AlertType: Identifiable {
        case error(Error)
        case notify(String)
        
        
        var id: String {
            switch self {
            case .error: return "error"
            case .notify: return "notify"
            }
        }
        
        var title: String {
            switch self {
            case .error: return "Error"
            case .notify(let title): return title
            }
        }
        
        var message: String? {
            switch self {
            case .error(let error): return error.localizedDescription
            case .notify: return nil
            }
        }
    }
    
    private func alert(for alertType: AlertType) -> Alert {
        switch alertType {
        case .error(let error):
            return Alert(error: error)
        case .notify:
            return Alert(title: Text(alertType.title))
        }
    }
}



// MARK: - API

extension Starcraft2View {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        case getLeagueData
        
        // Community APIs
        // Profile
        case `static` = "Static"
        case metadata = "Metadata"
        case profile = "Profile"
        case ladderSummary = "Ladder Summary"
        case ladder = "Ladder"
        
        // Ladder
        case grandmasterLeaderboard = "Grandmaster Leaderboard"
        case season = "Season"
        
        // Account
        case player = "Player"
        
        // Legacy
        case profileLegacy = "Profile (Legacy)"
        case ladders = "Ladders"
        case matchHistory = "Match History"
        case ladderLegacy = "Ladder (Legacy)"
        case achievements = "Achievements"
        case rewards = "Rewards"
        
        
        var id: String { return rawValue }
    }
}



// MARK: - Preview

struct Starcraft2View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                Starcraft2View(apiType: .gameData)
            }
            NavigationView {
                Starcraft2View(apiType: .community)
            }
        }
    }
}
