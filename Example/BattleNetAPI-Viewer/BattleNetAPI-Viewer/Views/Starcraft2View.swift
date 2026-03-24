//
//  Starcraft2View.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct Starcraft2View: View {
    @Environment(BattleNetAPI.self) private var battleNetAPI
    @State private var alertType: AlertType?
    
    @State private var apiSelection: API?
    @State private var loadingAPI: API?
    @State private var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "StarCraft 2 API"
    
    
    
    // MARK: - Views
    
    var body: some View {
        apiList
            .navigationTitle(Text(title))
            .navigationDestination(item: $apiSelection) { api in
                WebServiceView(title: api.rawValue, data: webServiceData)
            }
            .alert(alertType?.title ?? "", isPresented: showingAlert, presenting: alertType) { _ in
                Button("OK", role: .cancel) { }
            } message: { alertType in
                if let message = alertType.message {
                    Text(message)
                }
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
                try await battleNetAPI.sc2.getLeagueData(seasonID: 37, queue: .lotV1v1, team: .arranged, league: .grandmaster)
            }
        }
    }
    
    
    var communitySection: some View {
        Group {
            Section(header: Text("Profile API")) {
                webServiceRow(api: .static) {
                    try await battleNetAPI.sc2.getProfileData(sc2Region: .us)
                }
                webServiceRow(api: .metadata) {
                    try await battleNetAPI.sc2.getProfileMetadata(id: 20807579, sc2Region: .us, realmID: 1)
                }
                webServiceRow(api: .profile) {
                    try await battleNetAPI.sc2.getProfile(id: 20807579, sc2Region: .us, realmID: 1)
                }
                webServiceRow(api: .ladderSummary) {
                    try await battleNetAPI.sc2.getLadderSummary(profileID: 20807579, sc2Region: .us, realmID: 1)
                }
                webServiceRow(api: .ladder) {
                    try await battleNetAPI.sc2.getLadder(id: 296837, profileID: 20807579, sc2Region: .us, realmID: 1)
                }
            }
            
            Section(header: Text("Ladder API")) {
                webServiceRow(api: .grandmasterLeaderboard) {
                    try await battleNetAPI.sc2.getGrandmasterLeaderboard(sc2Region: .us)
                }
                webServiceRow(api: .season) {
                    try await battleNetAPI.sc2.getLadderSeason(sc2Region: .us)
                }
            }
            
            Section(header: Text("Account API")) {
                webServiceRow(api: .player) {
                    try await battleNetAPI.sc2.getPlayer(accountID: 20807579)
                }
            }
            
            Section(header: Text("Legacy API")) {
                webServiceRow(api: .profileLegacy) {
                    try await battleNetAPI.sc2.getProfile(sc2Region: .us, realmID: 1, profileID: 20807579)
                }
                webServiceRow(api: .ladders) {
                    try await battleNetAPI.sc2.getLadders(sc2Region: .us, realmID: 1, profileID: 20807579)
                }
                webServiceRow(api: .matchHistory) {
                    try await battleNetAPI.sc2.getMatchHistory(sc2Region: .us, realmID: 1, profileID: 20807579)
                }
                webServiceRow(api: .ladderLegacy) {
                    try await battleNetAPI.sc2.getLadder(sc2Region: .us, ladder: 296837)
                }
                webServiceRow(api: .achievements) {
                    try await battleNetAPI.sc2.getAchievements(sc2Region: .us)
                }
                webServiceRow(api: .rewards) {
                    try await battleNetAPI.sc2.getRewards(sc2Region: .us)
                }
            }
        }
    }
    
    
    func webServiceRow(api: API, webService: @escaping () async throws -> Data) -> some View {
        Button {
            loadingAPI = api
            Task {
                do {
                    let data = try await webService()
                    webServiceData = data
                    apiSelection = api
                } catch {
                    alertType = .error(error)
                }
                loadingAPI = nil
            }
        } label: {
            HStack {
                Text(api.rawValue)
                if loadingAPI == api {
                    Spacer()
                    ProgressView()
                }
            }
        }
        .disabled(loadingAPI != nil)
    }
    
    
    
    // MARK: - Web Services
    

}



// MARK: - Alert

extension Starcraft2View {
    enum AlertType {
        case error(Error)
        case notify(String)
        
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
    
    private var showingAlert: Binding<Bool> {
        Binding(
            get: { alertType != nil },
            set: { if !$0 { alertType = nil } }
        )
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

#Preview("Game Data") {
    NavigationStack {
        Starcraft2View(apiType: .gameData)
    }
}
#Preview("Community") {
    NavigationStack {
        Starcraft2View(apiType: .community)
    }
}

