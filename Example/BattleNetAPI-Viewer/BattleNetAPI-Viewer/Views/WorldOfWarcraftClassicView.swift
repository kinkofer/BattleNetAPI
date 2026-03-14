//
//  WorldOfWarcraftView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct WorldOfWarcraftClassicView: View {
    @Environment(BattleNetAPI.self) private var battleNetAPI
    @State private var alertType: AlertType?
    
    @State private var apiSelection: API?
    @State private var loadingAPI: API?
    @State private var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "World of Warcraft Classic API"
    
    
    
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
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Group {
            Group {
                Section(header: Text(WorldOfWarcraftClassicView.APISection.connectedRealm.rawValue)) {
                    webServiceRow(api: .connectedRealmIndex) {
                        try await battleNetAPI.wowClassic.getConnectedRealmIndex()
                    }
                    webServiceRow(api: .connectedRealm) {
                        try await battleNetAPI.wowClassic.getConnectedRealm(id: 4388)
                    }
                    webServiceRow(api: .connectedRealmSearch) {
                        let queries = [
                            "status.type": "UP",
                            "realms.timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        return try await battleNetAPI.wowClassic.searchConnectedRealms(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.creature.rawValue)) {
                    webServiceRow(api: .creatureFamilyIndex) {
                        try await battleNetAPI.wowClassic.getCreatureFamilyIndex()
                    }
                    webServiceRow(api: .creatureFamily) {
                        try await battleNetAPI.wowClassic.getCreatureFamily(id: 1)
                    }
                    webServiceRow(api: .creatureTypeIndex) {
                        try await battleNetAPI.wowClassic.getCreatureTypeIndex()
                    }
                    webServiceRow(api: .creatureType) {
                        try await battleNetAPI.wowClassic.getCreatureType(id: 1)
                    }
                    webServiceRow(api: .creature) {
                        try await battleNetAPI.wowClassic.getCreature(id: 42722)
                    }
                    webServiceRow(api: .creatureSearch) {
                        let queries = [
                            "name.en_US": "Beast",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        return try await battleNetAPI.wowClassic.searchCreature(queries: queries)
                    }
                    webServiceRow(api: .creatureDisplayMedia) {
                        try await battleNetAPI.wowClassic.getCreatureDisplayMedia(id: 30221)
                    }
                    webServiceRow(api: .creatureFamilyMedia) {
                        try await battleNetAPI.wowClassic.getCreatureFamilyMedia(id: 1)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.guildCrest.rawValue)) {
                    webServiceRow(api: .guildCrestIndex) {
                        try await battleNetAPI.wowClassic.getGuildCrestIndex()
                    }
                    webServiceRow(api: .guildCrestBorderMedia) {
                        try await battleNetAPI.wowClassic.getGuildCrestBorderMedia(id: 0)
                    }
                    webServiceRow(api: .guildCrestEmblemMedia) {
                        try await battleNetAPI.wowClassic.getGuildCrestEmblemMedia(id: 0)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.item.rawValue)) {
                    webServiceRow(api: .itemClassIndex) {
                        try await battleNetAPI.wowClassic.getItemClassIndex()
                    }
                    webServiceRow(api: .itemClass) {
                        try await battleNetAPI.wowClassic.getItemClass(id: 0)
                    }
                    webServiceRow(api: .itemSetIndex) {
                        try await battleNetAPI.wowClassic.getItemSetIndex()
                    }
                    webServiceRow(api: .itemSet) {
                        try await battleNetAPI.wowClassic.getItemSet(id: 1)
                    }
                    webServiceRow(api: .itemSubclass) {
                        try await battleNetAPI.wowClassic.getItemSubclass(itemClassID: 0, itemSubclassID: 0)
                    }
                    webServiceRow(api: .item) {
                        try await battleNetAPI.wowClassic.getItem(id: 19019)
                    }
                    webServiceRow(api: .itemMedia) {
                        try await battleNetAPI.wowClassic.getItemMedia(id: 19019)
                    }
                    webServiceRow(api: .itemSearch) {
                        let queries = [
                            "name.en_US": "Thunderfury",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        return try await battleNetAPI.wowClassic.searchItem(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.mediaSearch.rawValue)) {
                    webServiceRow(api: .mediaSearch) {
                        let queries = [
                            "tags": "item",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        return try await battleNetAPI.wowClassic.searchMedia(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.playableClass.rawValue)) {
                    webServiceRow(api: .playableClassIndex) {
                        try await battleNetAPI.wowClassic.getPlayableClassIndex()
                    }
                    webServiceRow(api: .playableClass) {
                        try await battleNetAPI.wowClassic.getPlayableClass(id: 7)
                    }
                    webServiceRow(api: .playableClassMedia) {
                        try await battleNetAPI.wowClassic.getPlayableClassMedia(id: 7)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.playableRace.rawValue)) {
                    webServiceRow(api: .playableRaceIndex) {
                        try await battleNetAPI.wowClassic.getPlayableRaceIndex()
                    }
                    webServiceRow(api: .playableRace) {
                        try await battleNetAPI.wowClassic.getPlayableRace(id: 2)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.powerType.rawValue)) {
                    webServiceRow(api: .powerTypeIndex) {
                        try await battleNetAPI.wowClassic.getPowerTypeIndex()
                    }
                    webServiceRow(api: .powerType) {
                        try await battleNetAPI.wowClassic.getPowerType(id: 0)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.realm.rawValue)) {
                    webServiceRow(api: .realmIndex) {
                        try await battleNetAPI.wowClassic.getRealmIndex()
                    }
                    webServiceRow(api: .realm) {
                        try await battleNetAPI.wowClassic.getRealm("tichondrius")
                    }
                    webServiceRow(api: .realmSearch) {
                        let queries = [
                            "timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        return try await battleNetAPI.wowClassic.searchRealm(queries: queries)
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.region.rawValue)) {
                    webServiceRow(api: .regionIndex) {
                        try await battleNetAPI.wowClassic.getRegionIndex()
                    }
                    webServiceRow(api: .region) {
                        try await battleNetAPI.wowClassic.getRegion(id: 41)
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftClassicView.APISection.wowToken.rawValue)) {
                    webServiceRow(api: .tokenIndex) {
                        try await battleNetAPI.wowClassic.getTokenIndex()
                    }
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

extension WorldOfWarcraftClassicView {
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

extension WorldOfWarcraftClassicView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        // Connected Realm API
        case connectedRealmIndex
        case connectedRealm
        case connectedRealmSearch
        // Creature API
        case creatureFamilyIndex
        case creatureFamily
        case creatureTypeIndex
        case creatureType
        case creature
        case creatureSearch
        case creatureDisplayMedia
        case creatureFamilyMedia
        // Guild Crest API
        case guildCrestIndex
        case guildCrestBorderMedia
        case guildCrestEmblemMedia
        // Item API
        case itemClassIndex
        case itemClass
        case itemSetIndex
        case itemSet
        case itemSubclass
        case item
        case itemMedia
        case itemSearch
        // Media Search API
        case mediaSearch
        // Playable Class API
        case playableClassIndex
        case playableClass
        case playableClassMedia
        // Playable Race API
        case playableRaceIndex
        case playableRace
        // Power Type API
        case powerTypeIndex
        case powerType
        // Realm API
        case realmIndex
        case realm
        case realmSearch
        // Region API
        case regionIndex
        case region
        // Token API
        case tokenIndex
        
        
        var id: String { return rawValue }
    }
    
    
    enum APISection: String {
        // Game Data
        case achievement = "Achievement API"
        case auctionHouse = "Auction House API"
        case azeriteEssence = "Azerite Essence API"
        case connectedRealm = "Connected Realm API"
        case covenant = "Covenant API"
        case creature = "Creature API"
        case guildCrest = "Guild Crest API"
        case item = "Item API"
        case journal = "Journal API"
        case mediaSearch = "Media Search API"
        case modifiedCrafting = "Modified Crafting API"
        case mount = "Mount API"
        case mythicKeystoneAffix = "Mythic Keystone Affix API"
        case mythicKeystoneDungeon = "Mythic Keystone Dungeon API"
        case mythicKeystoneLeaderboard = "Mythic Keystone Leaderboard API"
        case mythicRaidLeaderboard = "Mythic Raid Leaderboard API"
        case pet = "Pet API"
        case playableClass = "Playable Class API"
        case playableRace = "Playable Race API"
        case playableSpecialization = "Playable Specialization API"
        case powerType = "Power Type API"
        case profession = "Profession API"
        case pvpSeason = "PvP Season API"
        case pvpTier = "PvP Tier API"
        case quest = "Quest API"
        case realm = "Realm API"
        case region = "Region API"
        case reputation = "Reputations API"
        case spell = "Spell API"
        case talent = "Talent API"
        case techTalent = "Tech Talent API"
        case title = "Title API"
        case wowToken = "WoW Token API"
    }
}



#Preview {
    WorldOfWarcraftClassicView(apiType: .gameData)
}
