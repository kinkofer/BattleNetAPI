//
//  WorldOfWarcraftView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct WorldOfWarcraftClassicView: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "World of Warcraft Classic API"
    
    
    
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
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Group {
            Group {
                Section(header: Text(WorldOfWarcraftClassicView.APISection.connectedRealm.rawValue)) {
                    webServiceRow(api: .connectedRealmIndex) {
                        battleNetAPI.wowClassic.getConnectedRealmIndex(completion: { parseResult($0, for: .connectedRealmIndex) })
                    }
                    webServiceRow(api: .connectedRealm) {
                        battleNetAPI.wowClassic.getConnectedRealm(id: 4388, completion: { parseResult($0, for: .connectedRealm) })
                    }
                    webServiceRow(api: .connectedRealmSearch) {
                        let queries = [
                            "status.type": "UP",
                            "realms.timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wowClassic.searchConnectedRealms(queries: queries, completion: { parseResult($0, for: .connectedRealmSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.creature.rawValue)) {
                    webServiceRow(api: .creatureFamilyIndex) {
                        battleNetAPI.wowClassic.getCreatureFamilyIndex(completion: { parseResult($0, for: .creatureFamilyIndex) })
                    }
                    webServiceRow(api: .creatureFamily) {
                        battleNetAPI.wowClassic.getCreatureFamily(id: 1, completion: { parseResult($0, for: .creatureFamily) })
                    }
                    webServiceRow(api: .creatureTypeIndex) {
                        battleNetAPI.wowClassic.getCreatureTypeIndex(completion: { parseResult($0, for: .creatureTypeIndex) })
                    }
                    webServiceRow(api: .creatureType) {
                        battleNetAPI.wowClassic.getCreatureType(id: 1, completion: { parseResult($0, for: .creatureType) })
                    }
                    webServiceRow(api: .creature) {
                        battleNetAPI.wowClassic.getCreature(id: 42722, completion: { parseResult($0, for: .creature) })
                    }
                    webServiceRow(api: .creatureSearch) {
                        let queries = [
                            "name.en_US": "Beast",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wowClassic.searchCreature(queries: queries, completion: { parseResult($0, for: .creatureSearch) })
                    }
                    webServiceRow(api: .creatureDisplayMedia) {
                        battleNetAPI.wowClassic.getCreatureDisplayMedia(id: 30221, completion: { parseResult($0, for: .creatureDisplayMedia) })
                    }
                    webServiceRow(api: .creatureFamilyMedia) {
                        battleNetAPI.wowClassic.getCreatureFamilyMedia(id: 1, completion: { parseResult($0, for: .creatureFamilyMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.guildCrest.rawValue)) {
                    webServiceRow(api: .guildCrestIndex) {
                        battleNetAPI.wowClassic.getGuildCrestIndex(completion: { parseResult($0, for: .guildCrestIndex) })
                    }
                    webServiceRow(api: .guildCrestBorderMedia) {
                        battleNetAPI.wowClassic.getGuildCrestBorderMedia(id: 0, completion: { parseResult($0, for: .guildCrestBorderMedia) })
                    }
                    webServiceRow(api: .guildCrestEmblemMedia) {
                        battleNetAPI.wowClassic.getGuildCrestEmblemMedia(id: 0, completion: { parseResult($0, for: .guildCrestEmblemMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.item.rawValue)) {
                    webServiceRow(api: .itemClassIndex) {
                        battleNetAPI.wowClassic.getItemClassIndex(completion: { parseResult($0, for: .itemClassIndex) })
                    }
                    webServiceRow(api: .itemClass) {
                        battleNetAPI.wowClassic.getItemClass(id: 0, completion: { parseResult($0, for: .itemClass) })
                    }
                    webServiceRow(api: .itemSetIndex) {
                        battleNetAPI.wowClassic.getItemSetIndex(completion: { parseResult($0, for: .itemSetIndex) })
                    }
                    webServiceRow(api: .itemSet) {
                        battleNetAPI.wowClassic.getItemSet(id: 1, completion: { parseResult($0, for: .itemSet) })
                    }
                    webServiceRow(api: .itemSubclass) {
                        battleNetAPI.wowClassic.getItemSubclass(itemClassID: 0, itemSubclassID: 0, completion: { parseResult($0, for: .itemSubclass) })
                    }
                    webServiceRow(api: .item) {
                        battleNetAPI.wowClassic.getItem(id: 19019, completion: { parseResult($0, for: .item) })
                    }
                    webServiceRow(api: .itemMedia) {
                        battleNetAPI.wowClassic.getItemMedia(id: 19019, completion: { parseResult($0, for: .itemMedia) })
                    }
                    webServiceRow(api: .itemSearch) {
                        let queries = [
                            "name.en_US": "Thunderfury",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wowClassic.searchItem(queries: queries, completion: { parseResult($0, for: .itemSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.mediaSearch.rawValue)) {
                    webServiceRow(api: .mediaSearch) {
                        let queries = [
                            "tags": "item",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wowClassic.searchMedia(queries: queries, completion: { parseResult($0, for: .mediaSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.playableClass.rawValue)) {
                    webServiceRow(api: .playableClassIndex) {
                        battleNetAPI.wowClassic.getPlayableClassIndex(completion: { parseResult($0, for: .playableClassIndex) })
                    }
                    webServiceRow(api: .playableClass) {
                        battleNetAPI.wowClassic.getPlayableClass(id: 7, completion: { parseResult($0, for: .playableClass) })
                    }
                    webServiceRow(api: .playableClassMedia) {
                        battleNetAPI.wowClassic.getPlayableClassMedia(id: 7, completion: { parseResult($0, for: .playableClassMedia) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.playableRace.rawValue)) {
                    webServiceRow(api: .playableRaceIndex) {
                        battleNetAPI.wowClassic.getPlayableRaceIndex(completion: { parseResult($0, for: .playableRaceIndex) })
                    }
                    webServiceRow(api: .playableRace) {
                        battleNetAPI.wowClassic.getPlayableRace(id: 2, completion: { parseResult($0, for: .playableRace) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.powerType.rawValue)) {
                    webServiceRow(api: .powerTypeIndex) {
                        battleNetAPI.wowClassic.getPowerTypeIndex(completion: { parseResult($0, for: .powerTypeIndex) })
                    }
                    webServiceRow(api: .powerType) {
                        battleNetAPI.wowClassic.getPowerType(id: 0, completion: { parseResult($0, for: .powerType) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.realm.rawValue)) {
                    webServiceRow(api: .realmIndex) {
                        battleNetAPI.wowClassic.getRealmIndex(completion: { parseResult($0, for: .realmIndex) })
                    }
                    webServiceRow(api: .realm) {
                        battleNetAPI.wowClassic.getRealm("tichondrius", completion: { parseResult($0, for: .realm) })
                    }
                    webServiceRow(api: .realmSearch) {
                        let queries = [
                            "timezone": "America/New_York",
                            "orderby": "id",
                            "_page": "1"
                        ]
                        battleNetAPI.wowClassic.searchRealm(queries: queries, completion: { parseResult($0, for: .realmSearch) })
                    }
                }
                
                Section(header: Text(WorldOfWarcraftClassicView.APISection.region.rawValue)) {
                    webServiceRow(api: .regionIndex) {
                        battleNetAPI.wowClassic.getRegionIndex(completion: { parseResult($0, for: .regionIndex) })
                    }
                    webServiceRow(api: .region) {
                        battleNetAPI.wowClassic.getRegion(id: 41, completion: { parseResult($0, for: .region) })
                    }
                }
            }
            Group {
                Section(header: Text(WorldOfWarcraftClassicView.APISection.wowToken.rawValue)) {
                    webServiceRow(api: .tokenIndex) {
                        battleNetAPI.wowClassic.getTokenIndex(completion: { parseResult($0, for: .tokenIndex) })
                    }
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

extension WorldOfWarcraftClassicView {
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



struct WorldOfWarcraftClassicView_Previews: PreviewProvider {
    static var previews: some View {
        WorldOfWarcraftClassicView(apiType: .gameData)
    }
}
