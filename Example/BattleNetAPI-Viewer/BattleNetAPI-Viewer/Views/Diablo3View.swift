//
//  Diablo3View.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct Diablo3View: View {
    @Environment(BattleNetAPI.self) private var battleNetAPI
    @State private var alertType: AlertType?
    
    @State private var apiSelection: API?
    @State private var loadingAPI: API?
    @State private var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "Diablo 3 API"
    
    
    
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
            else if apiType == .profile {
                profileSection
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Section(header: Text(APIType.gameData.displayName)) {
            webServiceRow(api: .seasonIndex) {
                try await battleNetAPI.d3.getSeasons()
            }
            webServiceRow(api: .season) {
                try await battleNetAPI.d3.getLeaderboards(seasonID: 1)
            }
            webServiceRow(api: .seasonLeaderboard) {
                try await battleNetAPI.d3.getLeaderboard("achievement-points", seasonID: 1)
            }
            webServiceRow(api: .eraIndex) {
                try await battleNetAPI.d3.getEras()
            }
            webServiceRow(api: .era) {
                try await battleNetAPI.d3.getLeaderboards(eraID: 1 )
            }
            webServiceRow(api: .eraLeaderboard) {
                try await battleNetAPI.d3.getLeaderboard("rift-barbarian", eraID: 1 )
            }
        }
    }
    
    
    var communitySection: some View {
        Group {
            Section(header: Text("D3 Act API")) {
                webServiceRow(api: .getActIndex) {
                    try await battleNetAPI.d3.getActs()
                }
                webServiceRow(api: .getAct) {
                    try await battleNetAPI.d3.getAct(id: 1)
                }
            }
            
            Section(header: Text("D3 Aristan and Recipe API")) {
                webServiceRow(api: .getArtisan) {
                    try await battleNetAPI.d3.getArtisan(slug: "blacksmith")
                }
                webServiceRow(api: .getRecipe) {
                    try await battleNetAPI.d3.getRecipe(recipeSlug: "apprentice-flamberge", artisanSlug: "blacksmith")
                }
            }
            
            Section(header: Text("D3 Follower API")) {
                webServiceRow(api: .getFollower) {
                    try await battleNetAPI.d3.getFollower(slug: "templar")
                }
            }
            
            Section(header: Text("D3 Character Class and Skill API")) {
                webServiceRow(api: .getCharacterClass) {
                    try await battleNetAPI.d3.getClass(slug: "barbarian")
                }
                webServiceRow(api: .getApiSkill) {
                    try await battleNetAPI.d3.getSkill(skillSlug: "bash", classSlug: "barbarian")
                }
            }
            
            Section(header: Text("D3 Item Type API")) {
                webServiceRow(api: .getItemTypeIndex) {
                    try await battleNetAPI.d3.getItemTypes()
                }
                webServiceRow(api: .getItemType) {
                    try await battleNetAPI.d3.getItemsByType(typeSlug: "sword2h")
                }
            }
            
            Section(header: Text("D3 Item API")) {
                webServiceRow(api: .getItem) {
                    try await battleNetAPI.d3.getItem(itemSlugAndID: "corrupted-ashbringer-Unique_Sword_2H_104_x1")
                }
            }
        }
    }
    
    
    var profileSection: some View {
        Section(header: Text(APIType.profile.displayName)) {
            webServiceRow(api: .getApiAccount) {
                try await battleNetAPI.d3.getProfile(battleTag: "s2k-1107")
            }
            webServiceRow(api: .getApiHero) {
                try await battleNetAPI.d3.getHero(heroID: 118818000, battleTag: "s2k-1107")
            }
            webServiceRow(api: .getApiDetailedHeroItems) {
                try await battleNetAPI.d3.getItemsForHero(heroID: 118818000, battleTag: "s2k-1107")
            }
            webServiceRow(api: .getApiDetailedFollowerItems) {
                try await battleNetAPI.d3.getFollowerItemsForHero(heroID: 118818000, battleTag: "s2k-1107")
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

extension Diablo3View {
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

extension Diablo3View {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        case seasonIndex = "Season Index"
        case season = "Leaderboards for Season"
        case seasonLeaderboard = "Season Leaderboard"
        case eraIndex = "Era Index"
        case era = "Era"
        case eraLeaderboard = "Era Leaderboard"
        
        // Community APIs
        // Act
        case getActIndex
        case getAct
        // Artisan and Recipe
        case getArtisan
        case getRecipe
        // Follower
        case getFollower
        // Character Class and Skill
        case getCharacterClass
        case getApiSkill
        // Item Type
        case getItemTypeIndex
        case getItemType
        // Item
        case getItem
        
        
        // Profile APIs
        case getApiAccount
        case getApiHero
        case getApiDetailedHeroItems
        case getApiDetailedFollowerItems
        
        
        var id: String { return rawValue }
    }
}



// MARK: - Preview

#Preview("Game Data") {
    NavigationStack {
        Diablo3View(apiType: .gameData)
    }
}
#Preview("Community") {
    NavigationStack {
        Diablo3View(apiType: .community)
    }
}

#Preview("Profile") {
    NavigationStack {
        Diablo3View(apiType: .profile)
    }
}

