//
//  Diablo3View.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct Diablo3View: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "Diablo 3 API"
    
    
    
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
            else if apiType == .profile {
                profileSection
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Section(header: Text(APIType.gameData.displayName)) {
            webServiceRow(api: .seasonIndex) {
                battleNetAPI.d3.getSeasons(completion: { parseResult($0, for: .seasonIndex) })
            }
            webServiceRow(api: .season) {
                battleNetAPI.d3.getLeaderboards(seasonID: 1, completion: { parseResult($0, for: .season) })
            }
            webServiceRow(api: .seasonLeaderboard) {
                battleNetAPI.d3.getLeaderboard("achievement-points", seasonID: 1, completion: { parseResult($0, for: .seasonLeaderboard) })
            }
            webServiceRow(api: .eraIndex) {
                battleNetAPI.d3.getEras(completion: { parseResult($0, for: .eraIndex) })
            }
            webServiceRow(api: .era) {
                battleNetAPI.d3.getLeaderboards(eraID: 1 , completion: { parseResult($0, for: .era) })
            }
            webServiceRow(api: .eraLeaderboard) {
                battleNetAPI.d3.getLeaderboard("rift-barbarian", eraID: 1 , completion: { parseResult($0, for: .eraLeaderboard) })
            }
        }
    }
    
    
    var communitySection: some View {
        Group {
            Section(header: Text("D3 Act API")) {
                webServiceRow(api: .getActIndex) {
                    battleNetAPI.d3.getActs(completion: { parseResult($0, for: .getActIndex) })
                }
                webServiceRow(api: .getAct) {
                    battleNetAPI.d3.getAct(id: 1, completion: { parseResult($0, for: .getAct) })
                }
            }
            
            Section(header: Text("D3 Aristan and Recipe API")) {
                webServiceRow(api: .getArtisan) {
                    battleNetAPI.d3.getArtisan(slug: "blacksmith", completion: { parseResult($0, for: .getArtisan) })
                }
                webServiceRow(api: .getRecipe) {
                    battleNetAPI.d3.getRecipe(recipeSlug: "apprentice-flamberge", artisanSlug: "blacksmith", completion: { parseResult($0, for: .getRecipe) })
                }
            }
            
            Section(header: Text("D3 Follower API")) {
                webServiceRow(api: .getFollower) {
                    battleNetAPI.d3.getFollower(slug: "templar", completion: { parseResult($0, for: .getFollower) })
                }
            }
            
            Section(header: Text("D3 Character Class and Skill API")) {
                webServiceRow(api: .getCharacterClass) {
                    battleNetAPI.d3.getClass(slug: "barbarian", completion: { parseResult($0, for: .getCharacterClass) })
                }
                webServiceRow(api: .getApiSkill) {
                    battleNetAPI.d3.getSkill(skillSlug: "bash", classSlug: "barbarian", completion: { parseResult($0, for: .getApiSkill) })
                }
            }
            
            Section(header: Text("D3 Item Type API")) {
                webServiceRow(api: .getItemTypeIndex) {
                    battleNetAPI.d3.getItemTypes(completion: { parseResult($0, for: .getItemTypeIndex) })
                }
                webServiceRow(api: .getItemType) {
                    battleNetAPI.d3.getItemsByType(typeSlug: "sword2h", completion: { parseResult($0, for: .getItemType) })
                }
            }
            
            Section(header: Text("D3 Item API")) {
                webServiceRow(api: .getItem) {
                    battleNetAPI.d3.getItem(itemSlugAndID: "corrupted-ashbringer-Unique_Sword_2H_104_x1", completion: { parseResult($0, for: .getItem) })
                }
            }
        }
    }
    
    
    var profileSection: some View {
        Section(header: Text(APIType.profile.displayName)) {
            webServiceRow(api: .getApiAccount) {
                battleNetAPI.d3.getProfile(battleTag: "s2k-1107", completion: { parseResult($0, for: .getApiAccount) })
            }
            webServiceRow(api: .getApiHero) {
                battleNetAPI.d3.getHero(heroID: 118818000, battleTag: "s2k-1107", completion: { parseResult($0, for: .getApiHero) })
            }
            webServiceRow(api: .getApiDetailedHeroItems) {
                battleNetAPI.d3.getItemsForHero(heroID: 118818000, battleTag: "s2k-1107", completion: { parseResult($0, for: .getApiDetailedHeroItems) })
            }
            webServiceRow(api: .getApiDetailedFollowerItems) {
                battleNetAPI.d3.getFollowerItemsForHero(heroID: 118818000, battleTag: "s2k-1107", completion: { parseResult($0, for: .getApiDetailedFollowerItems) })
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

extension Diablo3View {
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

struct Diablo3View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                Diablo3View(apiType: .gameData)
            }
            NavigationView {
                Diablo3View(apiType: .community)
            }
            NavigationView {
                Diablo3View(apiType: .profile)
            }
        }
    }
}
