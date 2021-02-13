//
//  WorldOfWarcraftView.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/9/21.
//

import BattleNetAPI
import SwiftUI


struct WorldOfWarcraftView: View {
    @EnvironmentObject var battleNetAPI: BattleNetAPI
    @State var alertType: AlertType?
    
    @State var apiSelection: API?
    @State var webServiceData: Data = Data()
    
    let apiType: APIType
    
    let title = "World of Warcraft API"
    
    
    
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
            else {
                profileSection
            }
        }
        .listStyle(SidebarListStyle())
    }
    
    
    var gameDataSection: some View {
        Group {
            Section(header: Text(WorldOfWarcraftView.APISection.achievement.rawValue)) {
                webServiceRow(api: .achievementCategoryIndex) {
                    battleNetAPI.wow.getAchievementCategoryIndex(completion: { parseResult($0, for: .achievementCategoryIndex) })
                }
                webServiceRow(api: .achievementCategory) {
                    battleNetAPI.wow.getAchievementCategory(id: 81, completion: { parseResult($0, for: .achievementCategory) })
                }
                webServiceRow(api: .achievementIndex) {
                    battleNetAPI.wow.getAchievementIndex(completion: { parseResult($0, for: .achievementIndex) })
                }
                webServiceRow(api: .achievement) {
                    battleNetAPI.wow.getAchievement(id: 6, completion: { parseResult($0, for: .achievement) })
                }
                webServiceRow(api: .achievementMedia) {
                    battleNetAPI.wow.getAchievementMedia(id: 6, completion: { parseResult($0, for: .achievementMedia) })
                }
            }
            
            Section(header: Text(WorldOfWarcraftView.APISection.auctionHouse.rawValue)) {
                webServiceRow(api: .auctions) {
                    battleNetAPI.wow.getAuctions(connectedRealmID: 1146, completion: { parseResult($0, for: .auctions) })
                }
            }
            
            Section(header: Text(WorldOfWarcraftView.APISection.azeriteEssence.rawValue)) {
                webServiceRow(api: .azeriteEssenceIndex) {
                    battleNetAPI.wow.getAzeriteEssenceIndex(completion: { parseResult($0, for: .azeriteEssenceIndex) })
                }
                webServiceRow(api: .azeriteEssence) {
                    battleNetAPI.wow.getAzeriteEssence(id: 2, completion: { parseResult($0, for: .azeriteEssence) })
                }
                webServiceRow(api: .azeriteEssenceSearch) {
                    let queries = [
                        "allowed_specializations.id": "65",
                        "orderby": "name",
                        "_page": "1"
                    ]
                    battleNetAPI.wow.searchAzeriteEssence(queries: queries, completion: { parseResult($0, for: .azeriteEssenceSearch) })
                }
                webServiceRow(api: .azeriteEssenceMedia) {
                    battleNetAPI.wow.getAzeriteEssence(id: 2, completion: { parseResult($0, for: .azeriteEssenceMedia) })
                }
            }
            
            Section(header: Text(WorldOfWarcraftView.APISection.connectedRealm.rawValue)) {
                webServiceRow(api: .connectedRealmIndex) {
                    battleNetAPI.wow.getConnectedRealmIndex(completion: { parseResult($0, for: .connectedRealmIndex) })
                }
                webServiceRow(api: .connectedRealm) {
                    battleNetAPI.wow.getConnectedRealm(id: 11, completion: { parseResult($0, for: .connectedRealm) })
                }
                webServiceRow(api: .connectedRealmSearch) {
                    let queries = [
                        "status.type": "UP",
                        "realms.timezone": "America/New_York",
                        "orderby": "id",
                        "_page": "1"
                    ]
                    battleNetAPI.wow.searchConnectedRealms(queries: queries, completion: { parseResult($0, for: .connectedRealmSearch) })
                }
            }
            
            Section(header: Text(WorldOfWarcraftView.APISection.covenant.rawValue)) {
                webServiceRow(api: .covenantIndex) {
                    battleNetAPI.wow.getCovenantIndex(completion: { parseResult($0, for: .covenantIndex) })
                }
                webServiceRow(api: .covenant) {
                    battleNetAPI.wow.getCovenant(id: 1, completion: { parseResult($0, for: .covenant) })
                }
                webServiceRow(api: .covenantMedia) {
                    battleNetAPI.wow.getCovenantMedia(id: 1, completion: { parseResult($0, for: .covenantMedia) })
                }
                webServiceRow(api: .soulbindIndex) {
                    battleNetAPI.wow.getSoulbindIndex(completion: { parseResult($0, for: .soulbindIndex) })
                }
                webServiceRow(api: .soulbind) {
                    battleNetAPI.wow.getSoulbind(id: 1, completion: { parseResult($0, for: .soulbindIndex) })
                }
                webServiceRow(api: .conduitIndex) {
                    battleNetAPI.wow.getCondiutIndex(completion: { parseResult($0, for: .conduitIndex) })
                }
                webServiceRow(api: .conduit) {
                    battleNetAPI.wow.getConduit(id: 1, completion: { parseResult($0, for: .conduit) })
                }
            }
            
            Section(header: Text(WorldOfWarcraftView.APISection.creature.rawValue)) {
                webServiceRow(api: .creatureFamilyIndex) {
                    battleNetAPI.wow.getCreatureFamilyIndex(completion: { parseResult($0, for: .creatureFamilyIndex) })
                }
                webServiceRow(api: .creatureFamily) {
                    battleNetAPI.wow.getCreatureFamily(id: 1, completion: { parseResult($0, for: .creatureFamily) })
                }
                webServiceRow(api: .creatureTypeIndex) {
                    battleNetAPI.wow.getCreatureTypeIndex(completion: { parseResult($0, for: .creatureTypeIndex) })
                }
                webServiceRow(api: .creatureType) {
                    battleNetAPI.wow.getCreatureType(id: 1, completion: { parseResult($0, for: .creatureType) })
                }
                webServiceRow(api: .creature) {
                    battleNetAPI.wow.getCreature(id: 42722, completion: { parseResult($0, for: .creature) })
                }
                webServiceRow(api: .creatureSearch) {
                    let queries = [
                        "name.en_US": "Dragon",
                        "orderby": "id",
                        "_page": "1"
                    ]
                    battleNetAPI.wow.searchCreature(queries: queries, completion: { parseResult($0, for: .creatureSearch) })
                }
                webServiceRow(api: .creatureDisplayMedia) {
                    battleNetAPI.wow.getCreatureDisplayMedia(id: 30221, completion: { parseResult($0, for: .creatureDisplayMedia) })
                }
                webServiceRow(api: .creatureFamilyMedia) {
                    battleNetAPI.wow.getCreatureFamilyMedia(id: 1, completion: { parseResult($0, for: .creatureFamilyMedia) })
                }
            }
        }
    }
    
    
    var communitySection: some View {
        Group {
            
        }
    }
    
    
    var profileSection: some View {
        Group {
            
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

extension WorldOfWarcraftView {
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

extension WorldOfWarcraftView {
    enum API: String, CaseIterable, Hashable, Identifiable {
        // Game Data APIs
        // Achievement API
        case achievementCategoryIndex
        case achievementCategory
        case achievementIndex
        case achievement
        case achievementMedia
        // Auction House API
        case auctions
        // Azerite Essence API
        case azeriteEssenceIndex
        case azeriteEssence
        case azeriteEssenceSearch
        case azeriteEssenceMedia
        // Connected Realm API
        case connectedRealmIndex
        case connectedRealm
        case connectedRealmSearch
        // Covenant API
        case covenantIndex
        case covenant
        case covenantMedia
        case soulbindIndex
        case soulbind
        case conduitIndex
        case conduit
        // Creature API
        case creatureFamilyIndex
        case creatureFamily
        case creatureTypeIndex
        case creatureType
        case creature
        case creatureSearch
        case creatureDisplayMedia
        case creatureFamilyMedia
        // Mythic Keystone Affix
        case getKeystoneAffixIndex
        case getKeystoneAffix
        // Mythic Raid Leaderboard
        case getMythicRaidLeaderboard
        // Mythic Keystone Dungeon
        case getMythicKeystoneDungeonIndex
        case getMythicKeystoneDungeon
        case getMythicKeystoneIndex
        case getMythicKeystonePeriodIndex
        case getMythicKeystonePeriod
        case getMythicKeystoneSeasonIndex
        case getMythicKeystoneSeason
        // Mythic Keystone Leaderboard
        case getMythicLeaderboardIndex
        case getMythicLeaderboard
        // Playable Class
        case getPlayableClassesIndex
        case getPlayableClass
        case getPlayableClassPvPTalentSlots
        // Playable Specialization
        case getPlayableSpecializationIndex
        case getPlayableSpecialization
        // Power Type
        case getPowerTypesIndex
        case getPowerType
        // Playable Race
        case getRacesIndex
        case getRace
        // Realm
        case getRealmIndex
        case getRealm
        // Region
        case getRegionIndex
        case getRegion
        // WoW Token
        case getTokenIndex
        
        
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
        case mythicKeystoneAffix = "Mythic Keystone Affix API"
        case mythicRaidLeaderboard = "Mythic Raid Leaderboard API"
        case mythicKeystoneDungeon = "Mythic Keystone Dungeon API"
        case mythicKeystoneLeaderboard = "Mythic Keystone Leaderboard API"
        case mythicChallengeMode = "Mythic Challenge Mode API"
        case playableClass = "Playable Class API"
        case playableSpecialization = "Playable Specialization API"
        case powerType = "Power Type API"
        case playableRace = "Playable Race API"
        case realm = "Realm API"
        case region = "Region API"
        case wowToken = "WoW Token API"
        
        // Community
        case characterAchievement = "Character Achievement API"
        case auction = "Auction API"
        case challengeMode = "Challenge Mode API"
        case characterProfile = "Character Profile API"
        case guildProfile = "Guild Profile API"
        case item = "Item API"
        case mount = "Mount API"
        case pet = "Pet API"
        case pvp = "PVP API"
        case quest = "Quest API"
        case realmStatus = "Realm Status API"
        case recipe = "Recipe API"
        case spell = "Spell API"
        case user = "User API"
        case zone = "Zone API"
        case dataResources = "Data Resources API"
        
        // Profile
        case wowMythicKeystoneCharacterProfile = "WoW Mythic Keystone Character Profile"
    }
}



struct WorldOfWarcraftView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorldOfWarcraftView(apiType: .gameData)
            WorldOfWarcraftView(apiType: .community)
            WorldOfWarcraftView(apiType: .profile)
        }
    }
}
