//
//  WorldOfWarcraftViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit
import BattleNetAPI


class WorldOfWarcraftViewController: UITableViewController, APIViewer {
    struct ReuseIdentifier {
        static let cell = "Cell"
    }
    
    
    enum API: String {
        // Game Data
        case connectedRealm = "Connected Realm API"
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
        case achievement = "Achievement API"
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
    
    
    
    enum GameDataService: String, CaseIterable {
        // Connected Realm
        case getConnectedRealmIndex
        case getConnectedRealm
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
        
        
        var displayName: String {
            switch self {
            case .getMythicRaidLeaderboard:
                return "getMythicLeaderboard"
            default:
                return self.rawValue
            }
        }
    }
    
    enum CommunityService: String, CaseIterable {
        // Achievement
        case achievement = "Achievement"
        // Auction
        case auctionDataStatus = "Auction Data Status"
        // Challenge Mode
        case realmLeaderboard = "Realm Leaderboard"
        case regionLeaderboard = "Region Leaderboard"
        // Character Profile
        case characterProfile = "Character Profile"
        case characterAchievements = "Character Achievements"
        case appearance = "Appearance"
        case feed = "Feed"
        case guild = "Guild"
        case hunterPets = "Hunter Pets"
        case items = "Items"
        case mounts = "Mounts"
        case pets = "Pets"
        case petSlots = "Pet Slots"
        case professions = "Professions"
        case progression = "Progression"
        case pvp = "PVP"
        case quests = "Quests"
        case reputation = "Reputation"
        case statistics = "Statistics"
        case characterStats = "Character Stats"
        case talents = "Talents"
        case titles = "Titles"
        case audit = "Audit"
        // Guild Profile
        case guildProfile = "Guild Profile"
        case members = "Members"
        case guildAchievements = "Guild Achievements"
        case news = "News"
        case challenge = "Challenge"
        // Item
        case item = "Item"
        case itemSet = "Item Set"
        // Mount
        case mountMasterList = "Mount Master List"
        // Pet
        case petMasterList = "Pet Master List"
        // PVP
        case leaderboards = "Leaderboards"
        // Quest
        case quest = "Quest"
        // Realm Status
        case realmStatus = "Realm Status"
        // Recipe
        case recipe = "Recipe"
        // Spell
        case spell = "Spell"
        // Data Resources
        case allCharacterRaces = "Character Races"
        case allCharacterClasses = "Character Classes"
        case allCharacterAchievements = "All Character Achievements"
        case allItemClasses = "Item Classes"
        case allTalents = "Telents"
        case allPetTypes = "Pet Types"
        
        
        var displayName: String {
            switch self {
            case .characterAchievements, .guildAchievements:
                return "Achievements"
            case .mountMasterList, .petMasterList:
                return "Master List"
            case .characterStats:
                return "Stats"
            case .allCharacterAchievements:
                return "Character Achievements"
            default:
                return self.rawValue
            }
        }
    }
    
    
    enum ProfileService: String, CaseIterable {
        case getCharacterMythicKeystoneProfile
        case getCharacterMythicKeystoneProfileSeason
    }
    
    
    struct Section: TableSection {
        typealias SectionType = API
        
        var type: SectionType
        var rows: [Any]
        
        func getTitle(forSection: Int) -> String {
            return type.rawValue
        }
        
        func getTitle(forRowAt indexPath: IndexPath) -> String {
            if let row = rows[safe: indexPath.row] as? GameDataService {
                return row.displayName
            }
            else if let row = rows[safe: indexPath.row] as? CommunityService {
                return row.displayName
            }
            else if let row = rows[safe: indexPath.row] as? ProfileService {
                return row.rawValue
            }
            else {
                return ""
            }
        }
    }
    
    
    let battleNetAPI = BattleNetAPI(credentials: Current.credentials)
    lazy var wowMC = WorldOfWarcraftModelController(battleNetAPI: battleNetAPI)
    
    public var apiType: APIType = .gameData
    
    var sections: [Section] = [Section]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        switch apiType {
        case .gameData:
            let connectedRealmAPIs: [GameDataService] = [.getConnectedRealmIndex, .getConnectedRealm]
            let mythicKeystoneAffixAPIs: [GameDataService] = [.getKeystoneAffixIndex, .getKeystoneAffix]
            let mythicRaidLeaderboardAPIs: [GameDataService] = [.getMythicRaidLeaderboard]
            let mythicKeystoneDungeonAPIs: [GameDataService] = [.getMythicKeystoneDungeonIndex, .getMythicKeystoneDungeon,
                                                            .getMythicKeystoneIndex, .getMythicKeystonePeriodIndex,
                                                            .getMythicKeystonePeriod, .getMythicKeystoneSeasonIndex, .getMythicKeystoneSeason]
            let mythicKeystoneLeaderboardAPIs: [GameDataService] = [.getMythicLeaderboardIndex, .getMythicLeaderboard]
            let playableClassAPIs: [GameDataService] = [.getPlayableClassesIndex, .getPlayableClass, .getPlayableClassPvPTalentSlots]
            let playableSpecializationAPIs: [GameDataService] = [.getPlayableSpecializationIndex, .getPlayableSpecialization]
            let powerTypeAPIs: [GameDataService] = [.getPowerTypesIndex, .getPowerType]
            let playableRaceAPIs: [GameDataService] = [.getRacesIndex, .getRace]
            let realmAPIs: [GameDataService] = [.getRealmIndex, .getRealm]
            let regionAPIs: [GameDataService] = [.getRegionIndex, .getRegion]
            let wowTokenAPIs: [GameDataService] = [.getTokenIndex]
            
            sections = [Section(type: .connectedRealm, rows: connectedRealmAPIs),
                        Section(type: .mythicKeystoneAffix, rows: mythicKeystoneAffixAPIs),
                        Section(type: .mythicRaidLeaderboard, rows: mythicRaidLeaderboardAPIs),
                        Section(type: .mythicKeystoneDungeon, rows: mythicKeystoneDungeonAPIs),
                        Section(type: .mythicKeystoneLeaderboard, rows: mythicKeystoneLeaderboardAPIs),
                        Section(type: .playableClass, rows: playableClassAPIs),
                        Section(type: .playableSpecialization, rows: playableSpecializationAPIs),
                        Section(type: .powerType, rows: powerTypeAPIs),
                        Section(type: .playableRace, rows: playableRaceAPIs),
                        Section(type: .realm, rows: realmAPIs),
                        Section(type: .region, rows: regionAPIs),
                        Section(type: .wowToken, rows: wowTokenAPIs)]
        case .community:
            let achievementAPIs: [CommunityService] = [.achievement]
            let auctionAPIs: [CommunityService] = [.auctionDataStatus]
            let challengeModeAPIs: [CommunityService] = [.realmLeaderboard, .regionLeaderboard]
            let characterProfileAPIs: [CommunityService] = [.characterProfile, .characterAchievements, .appearance, .feed, .guild, .hunterPets,
                                                            .items, .mounts, .pets, .petSlots, .professions, .progression, .pvp, .quests,
                                                            .reputation, .statistics, .characterStats, .talents, .titles, .audit]
            let guildProfileAPIs: [CommunityService] = [.guildProfile, .members, .guildAchievements, .news, .challenge]
            let itemAPIs: [CommunityService] = [.item, .itemSet]
            let mountAPIs: [CommunityService] = [.mountMasterList]
            let petAPIs: [CommunityService] = [.petMasterList]
            let pvpAPIs: [CommunityService] = [.leaderboards]
            let questAPIs: [CommunityService] = [.quest]
            let realmStatusAPIs: [CommunityService] = [.realmStatus]
            let recipeAPIs: [CommunityService] = [.recipe]
            let spellAPIs: [CommunityService] = [.spell]
            let dataResourcesAPIs: [CommunityService] = [.allCharacterRaces, .allCharacterClasses, .allCharacterAchievements,
                                                         .allItemClasses, .allTalents, .allPetTypes]
            
            sections = [Section(type: .achievement, rows: achievementAPIs),
                        Section(type: .auction, rows: auctionAPIs),
                        Section(type: .challengeMode, rows: challengeModeAPIs),
                        Section(type: .characterProfile, rows: characterProfileAPIs),
                        Section(type: .guildProfile, rows: guildProfileAPIs),
                        Section(type: .item, rows: itemAPIs),
                        Section(type: .mount, rows: mountAPIs),
                        Section(type: .pet, rows: petAPIs),
                        Section(type: .pvp, rows: pvpAPIs),
                        Section(type: .quest, rows: questAPIs),
                        Section(type: .realmStatus, rows: realmStatusAPIs),
                        Section(type: .recipe, rows: recipeAPIs),
                        Section(type: .spell, rows: spellAPIs),
                        Section(type: .dataResources, rows: dataResourcesAPIs)]
        case .profile:
            let wowMythicKeystoneCharacterProfileAPIs: [ProfileService] = [.getCharacterMythicKeystoneProfile, .getCharacterMythicKeystoneProfileSeason]
            
            sections = [Section(type: .wowMythicKeystoneCharacterProfile, rows: wowMythicKeystoneCharacterProfileAPIs)]
        }
    }
    
    
    
    // MARK: - Game Data APIs
    
    // MARK: Connected Realm API
    
    func getConnectedRealmIndex() {
        wowMC.getConnectedRealmIndex { result in
            switch result {
            case .success(let connectedRealms):
                Debug.print("Retrieved \(connectedRealms.count) conntected Realm(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = connectedRealms
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getConnectedRealm(id: Int) {
        wowMC.getConnectedRealm(id: id) { result in
            switch result {
            case .success(let connectedRealm):
                Debug.print("Retrieved connectedRealm.id \(connectedRealm.id) with \(connectedRealm.realms.count) Realm(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = connectedRealm
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Mythic Keystone Affix API
    
    func getMythicKeystoneAffixes() {
        wowMC.getMythicKeystoneAffixes { result in
            switch result {
            case .success(let mythicKeystoneAffixes):
                Debug.print("Retrieved \(mythicKeystoneAffixes.affixes.count) mythic keystone affix(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneAffixes
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystoneAffix(id: Int) {
        wowMC.getMythicKeystoneAffix(id: id) { result in
            switch result {
            case .success(let mythicKeystoneAffix):
                Debug.print("Retrieved mythic keystone affix \(mythicKeystoneAffix.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneAffix
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Mythic Raid Leaderboard API
    
    func getMythicRaidLeaderboard(raid: String, faction: FactionType) {
        wowMC.getMythicRaidLeaderboard(raid: raid, faction: faction) { result in
            switch result {
            case .success(let mythicRaidLeaderboard):
                Debug.print("Retrieved mythic raid leaderboard with \(mythicRaidLeaderboard.entries.count) entry(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicRaidLeaderboard
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Mythic Keystone Dungeon API
    
    func getMythicKeystoneDungeons() {
        wowMC.getMythicKeystoneDungeons { result in
            switch result {
            case .success(let mythicKeystoneDungeons):
                Debug.print("Retrieved \(mythicKeystoneDungeons.dungeons.count) mythic keystone dungeon(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneDungeons
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystoneDungeon(id: Int) {
        wowMC.getMythicKeystoneDungeon(id: id) { result in
            switch result {
            case .success(let mythicKeystoneDungeon):
                Debug.print("Retrieved mythic keystone dungeon \(mythicKeystoneDungeon.name) with \(mythicKeystoneDungeon.keystoneUpgrades.count) keystone upgrade(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneDungeon
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystones() {
        wowMC.getMythicKeystones { result in
            switch result {
            case .success(let mythicKeystoneIndex):
                Debug.print("Retrieved mythic keystone index")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystonePeriods() {
        wowMC.getMythicKeystonePeriods { result in
            switch result {
            case .success(let mythicKeystonePeriods):
                Debug.print("Retrieved \(mythicKeystonePeriods.periods.count) mythic keystone period(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystonePeriods
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystonePeriod(id: Int) {
        wowMC.getMythicKeystonePeriod(id: id) { result in
            switch result {
            case .success(let mythicKeystonePeriod):
                Debug.print("Retrieved mythic keystone period \(mythicKeystonePeriod.id)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystonePeriod
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystoneSeasons() {
        wowMC.getMythicKeystoneSeasons { result in
            switch result {
            case .success(let mythicKeystoneSeasons):
                Debug.print("Retrieved \(mythicKeystoneSeasons.seasons.count) mythic keystone season(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneSeasons
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystoneSeason(id: Int) {
        wowMC.getMythicKeystoneSeason(id: id) { result in
            switch result {
            case .success(let mythicKeystoneSeason):
                Debug.print("Retrieved mythic keystone season \(mythicKeystoneSeason.id) with \(mythicKeystoneSeason.periods.count) keystone period(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicKeystoneSeason
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Mythic Keystone Leaderboard API
    
    func getMythicLeaderboards(connectedRealmID: Int) {
        wowMC.getMythicLeaderboards(connectedRealmID: connectedRealmID) { result in
            switch result {
            case .success(let leaderboards):
                Debug.print("Retrieved \(leaderboards.currentLeaderboards.count) Current Leaderboard(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = leaderboards
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int) {
        wowMC.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period) { result in
            switch result {
            case .success(let leaderboard):
                let keystoneAffixes = leaderboard.keystoneAffixes.compactMap { $0.keystoneAffix.name }
                Debug.print("Retrieved Mythic Leaderboard \(leaderboard.name) with Keystone Affixes \(keystoneAffixes.joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = leaderboard
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Playable Class API
    
    func getPlayableClasses() {
        wowMC.getPlayableClasses { result in
            switch result {
            case .success(let classIndex):
                Debug.print("Retrieved \(classIndex.classes.count) WOW Playable Class(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = classIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableClass(id: Int) {
        wowMC.getPlayableClass(id: id) { result in
            switch result {
            case .success(let wowClass):
                let specializations = wowClass.specializations.map { $0.name ?? "Unknown" }
                Debug.print("Retrieved WOW Class \(wowClass.name) with Specializations \(specializations.joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = wowClass
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableClassPvPTalentSlots(classID: Int) {
        wowMC.getPlayableClassPvPTalentSlots(classID: classID) { result in
            switch result {
            case .success(let pvpTalentSlots):
                Debug.print("Retrieved PvP Talent Slots with \(pvpTalentSlots.talentSlots.count) talent slot(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = pvpTalentSlots
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Playable Specialization API
    
    func getPlayableSpecializations() {
        wowMC.getPlayableSpecializations { result in
            switch result {
            case .success(let specializations):
                Debug.print("Retrieved \(specializations.characterSpecializations.count) Character Specialization(s) and \(specializations.petSpecializations.count) Pet Specialization(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = specializations
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableSpecialization(id: Int) {
        wowMC.getPlayableSpecialization(id: id) { result in
            switch result {
            case .success(let specialization):
                Debug.print("Retrieved Specialization \(specialization.name) for Playable Class \(specialization.playableClass.name ?? "Unknown")")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = specialization
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Power Type API
    
    func getPowerTypes() {
        wowMC.getPowerTypes { result in
            switch result {
            case .success(let powerTypeIndex):
                Debug.print("Retrieved \(powerTypeIndex.powerTypes.count) Power Type(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = powerTypeIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPowerType(id: Int) {
        wowMC.getPowerType(id: id) { result in
            switch result {
            case .success(let powerType):
                Debug.print("Retrieved Power Type \(powerType.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = powerType
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Playable Race API
    
    func getPlayableRaces() {
        wowMC.getPlayableRaces { result in
            switch result {
            case .success(let racesIndex):
                Debug.print("Retrieved \(racesIndex.races.count) Playable Character Race(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = racesIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPlayableRace(id: Int) {
        wowMC.getPlayableRace(id: id) { result in
            switch result {
            case .success(let race):
                Debug.print("Retrieved Race \(race.genderName.femaleName)/\(race.genderName.maleName)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = race
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Realm API
    
    func getRealmIndex() {
        wowMC.getRealmIndex { result in
            switch result {
            case .success(let realms):
                Debug.print("Retrieved \(realms.count) Realm(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = realms
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRealm(id: Int? = nil, slug: String? = nil) {
        wowMC.getRealm(id: id, slug: slug) { result in
            switch result {
            case .success(let realm):
                Debug.print("Retrieved Realm \(realm.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = realm
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Region API
    
    func getRegionIndex() {
        wowMC.getRegionIndex { result in
            switch result {
            case .success(let regions):
                Debug.print("Retrieved \(regions.count) Region(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = regions
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRegion(id: Int) {
        wowMC.getRegion(id: id) { result in
            switch result {
            case .success(let region):
                Debug.print("Retrieved Region \(region.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = region
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: WOW Token API
    
    func getTokenIndex() {
        wowMC.getTokenIndex { result in
            switch result {
            case .success(let tokenIndex):
                Debug.print("TokenIndex.lastUpdatedTimestamp: \(tokenIndex.lastUpdatedTimestamp)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = tokenIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: - Community APIs
    
    // MARK: Achievement API
    
    func getAchievement(id: Int) {
        wowMC.getAchievement(id: id) { result in
            switch result {
            case .success(let achievement):
                Debug.print("Retrieved Achievement \(achievement.title)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = achievement
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Auction API
    
    func getAuctions(connectedRealmID: Int) {
        wowMC.getAuctions(connectedRealmID: connectedRealmID) { result in
            switch result {
            case .success(let auction):
                Debug.print("Retrieved \(auction.files.count) Auction(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = auction
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: Challenge Mode API
    
    func getChallengeLeaderboards(realm: String) {
        wowMC.getChallengeLeaderboards(realm: realm) { result in
            switch result {
            case .success(let challenges):
                Debug.print("Retrieved \(challenges.count) Challenge(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = challenges
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getTopChallengeLeaderboards() {
        wowMC.getTopChallengeLeaderboards { result in
            switch result {
            case .success(let challenges):
                Debug.print("Retrieved \(challenges.count) Challenge(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = challenges
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Character Profile API
    
    func getCharacter(_ name: String, realmSlug: String) {
        wowMC.getCharacter(characterName: name, realmSlug: realmSlug) { result in
            switch result {
            case .success(let character):
                Debug.print("Retrieved Character \(character.name) from Realm \(character.realm)")
                
                if let achievements = character.achievements {
                    print("... with \(achievements.achievementsCompleted.count) Completed Achievement(s)")
                }
                
                if let appearance = character.appearance {
                    print("... with face variation \(appearance.faceVariation)")
                }
                
                if let feed = character.feed {
                    print("... with \(feed.count) Feed Item(s)")
                }
                
                if let guild = character.guild {
                    print("... with Guild \(guild.name)")
                }
                
                if let hunterPets = character.hunterPets {
                    print("... with \(hunterPets.count) Hunter Pet(s)")
                }
                
                if let mounts = character.mounts {
                    print("... with \(mounts.collected.count) Collected Mount(s)")
                }
                
                if let pets = character.pets {
                    print("... with \(pets.collected.count) Collected Pet(s)")
                }
                
                if let petSlots = character.petSlots {
                    print("... with \(petSlots.count) Pet Slot(s)")
                }
                
                if let professions = character.professions {
                    print("... with \(professions.primary.count) Primary Profession(s) and \(professions.secondary.count) Secondary Profession(s)")
                }
                
                if let progression = character.progression {
                    print("... with \(progression.raids.count) Progression Raid(s)")
                }
                
                if let pvp = character.pvp {
                    print("... with 2v2 Arena Bracket Rating \(pvp.brackets.arenaBracket2V2.rating)")
                }
                
                if let quests = character.quests {
                    print("... with \(quests.count) Quest(s)")
                }
                
                if let reputation = character.reputation {
                    print("... with \(reputation.count) Reputation(s)")
                }
                
                if let statistics = character.statistics {
                    print("... with \(statistics.subcategories.count) Statistic Subcategory(s)")
                }
                
                if let stats = character.stats {
                    print("... with Character Health Stat \(stats.health)")
                }
                
                if let talents = character.talents {
                    print("... with \(talents.count) Talent(s)")
                }
                
                if let titles = character.titles {
                    print("... with \(titles.count) Title(s)")
                }
                
                if let audit = character.audit {
                    print("... with Appropriate Armor Type \(audit.appropriateArmorType)")
                }
                
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = character
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Guild Profile API
    
    func getGuild(_ name: String, realmSlug: String) {
        wowMC.getGuild(slug: name, realmSlug: realmSlug) { result in
            switch result {
            case .success(let guild):
                Debug.print("Retrieved Guild \(guild.name) from Realm \(guild.realm)")
                
                if let achievements = guild.achievements {
                    print("... with \(achievements.achievementsCompleted.count) Completed Achievement(s)")
                }
                
                if let challenges = guild.challenges {
                    print("... with \(challenges.count) Challenge(s)")
                }
                
                if let members = guild.members {
                    print("... with \(members.count) Member(s)")
                }
                
                if let news = guild.news {
                    print("... with \(news.count) News Item(s)")
                }
                
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = guild
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Item API
    
    func getWOWItem(id: Int) {
        wowMC.getItem(id: id) { result in
            switch result {
            case .success(let item):
                Debug.print("Retrieved WOW Item \(item.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = item
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWItemSet(id: Int) {
        wowMC.getItemSet(id: id) { result in
            switch result {
            case .success(let itemSet):
                Debug.print("Retrieved WOW Item Set \(itemSet.name) with \(itemSet.items.count) Item(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = itemSet
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Mount API
    
    func getMounts() {
        wowMC.getMounts { result in
            switch result {
            case .success(let mounts):
                let groundMounts = mounts.filter { $0.isGround }
                let flyingMounts = mounts.filter { $0.isFlying }
                let aquaticMounts = mounts.filter { $0.isAquatic }
                let jumpingMounts = mounts.filter { $0.isJumping }
                Debug.print("Retrieved \(mounts.count) Mount(s): \(groundMounts.count) Ground, \(flyingMounts.count) Flying, \(aquaticMounts.count) Aquatic, \(jumpingMounts.count) Jumping")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = mounts
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Pet API
    
    func getPets() {
        wowMC.getPets { result in
            switch result {
            case .success(let pets):
                Debug.print("Retrieved \(pets.count) Pet(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = pets
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetAbility(id: Int) {
        wowMC.getPetAbility(id: id) { result in
            switch result {
            case .success(let petAbility):
                Debug.print("Retrieved Pet Ability \(petAbility.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = petAbility
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: PVP API
    
    func getWOWLeaderboard(bracket: WOWLeaderboardBracket) {
//        wowMC.getLeaderboard(bracket: bracket) { result in
//            switch result {
//            case .success(let leaderboard):
//                Debug.print("Retrieved WOW Leaderboard with \(leaderboard.rows.count) entry(s)")
//                DispatchQueue.main.async {
//                    let viewController = ViewerTableViewController()
//                    viewController.dataSourceObj = leaderboard
//                    self.navigationController?.pushViewController(viewController, animated: true)
//                }
//            case .failure(let error):
//                self.handleError(error)
//            }
//        }
    }
    
    
    // MARK: Quest API
    
    func getWOWQuest(id: Int) {
        wowMC.getQuest(id: id) { result in
            switch result {
            case .success(let quest):
                Debug.print("Retrieved WOW Quest \(quest.title)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = quest
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Realm Status API
    
    func getWOWRealmsStatus() {
        wowMC.getRealmsStatus { result in
            switch result {
            case .success(let realms):
                Debug.print("Retrieved Status for \(realms.count) WOW Realm(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = realms
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Recipe API
    
    func getWOWRecipe(id: Int) {
        wowMC.getRecipe(id: id) { result in
            switch result {
            case .success(let recipe):
                Debug.print("Retrieved WOW Recipe \(recipe.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = recipe
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Spell API
    
    func getWOWSpell(id: Int) {
        wowMC.getSpell(id: id) { result in
            switch result {
            case .success(let spell):
                Debug.print("Retrieved WOW Spell \(spell.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = spell
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: Data Resources
    
    func getWOWClasses() {
        wowMC.getClasses { result in
            switch result {
            case .success(let classes):
                Debug.print("Retrieved \(classes.count) WOW Class(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = classes
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWAchievements() {
        wowMC.getAchievements { result in
            switch result {
            case .success(let achievementCategories):
                Debug.print("Retrieved \(achievementCategories.count) WOW Achievement Category(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = achievementCategories
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildAchievements(_ name: String, realmSlug: String) {
        wowMC.getGuildAchievements(slug: name, realmSlug: realmSlug) { result in
            switch result {
            case .success(let achievementCategories):
                Debug.print("Retrieved \(achievementCategories.count) WOW Guild Achievement Category(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = achievementCategories
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getItemClasses() {
        wowMC.getItemClasses { result in
            switch result {
            case .success(let itemClasses):
                Debug.print("Retrieved \(itemClasses.count) Item Class(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = itemClasses
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getTalents() {
        wowMC.getTalents { result in
            switch result {
            case .success(let talentDictionary):
                Debug.print("Retrieved Talents for \(talentDictionary.keys.count) Class(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = talentDictionary.map { $0.value }
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: - Profile APIs
    // MARK: WoW Mythic Keystone Character Profile API
    
    func getMythicKeystoneProfile(characterName: String, realmSlug: String) {
        wowMC.getCharacterMythicKeystoneProfile(characterName: characterName, realmSlug: realmSlug) { result in
            switch result {
            case .success(let profile):
                Debug.print("Retrieved profile \(characterName)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = profile
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String) {
        wowMC.getCharacterMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug) { result in
            switch result {
            case .success(let season):
                Debug.print("Retrieved season \(seasonID) with \(season.bestRuns.count) best run(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = season
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: - Error handling
    
    func handleError(_ error: Error, function: String = #function) {
        Debug.print(error.localizedDescription, function: function)
    }
    
    
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections.getTitle(forSectionAt: section)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.cell)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ReuseIdentifier.cell)
        }
        
        cell.textLabel?.text = sections.getTitle(forRowAt: indexPath)
        
        return cell
    }
    
    
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch apiType {
        case .gameData:
            let service = sections.getRow(at: indexPath) as! GameDataService
            
            switch service {
            case .getConnectedRealmIndex:
                getConnectedRealmIndex()
            case .getConnectedRealm:
                getConnectedRealm(id: 11)
            case .getKeystoneAffixIndex:
                getMythicKeystoneAffixes()
            case .getKeystoneAffix:
                getMythicKeystoneAffix(id: 1)
            case .getMythicRaidLeaderboard:
                getMythicRaidLeaderboard(raid: "uldir", faction: .alliance)
            case .getMythicKeystoneDungeonIndex:
                getMythicKeystoneDungeons()
            case .getMythicKeystoneDungeon:
                getMythicKeystoneDungeon(id: 353)
            case .getMythicKeystoneIndex:
                getMythicKeystones()
            case .getMythicKeystonePeriodIndex:
                getMythicKeystonePeriods()
            case .getMythicKeystonePeriod:
                getMythicKeystonePeriod(id: 641)
            case .getMythicKeystoneSeasonIndex:
                getMythicKeystoneSeasons()
            case .getMythicKeystoneSeason:
                getMythicKeystoneSeason(id: 1)
            case .getMythicLeaderboardIndex:
                getMythicLeaderboards(connectedRealmID: 11)
            case .getMythicLeaderboard:
                getMythicLeaderboard(connectedRealmID: 11, dungeonID: 197, period: 641)
            case .getPlayableClassesIndex:
                getPlayableClasses()
            case .getPlayableClass:
                getPlayableClass(id: 7)
            case .getPlayableClassPvPTalentSlots:
                getPlayableClassPvPTalentSlots(classID: 7)
            case .getPlayableSpecializationIndex:
                getPlayableSpecializations()
            case .getPlayableSpecialization:
                getPlayableSpecialization(id: 262)
            case .getPowerTypesIndex:
                getPowerTypes()
            case .getPowerType:
                getPowerType(id: 0)
            case .getRacesIndex:
                getPlayableRaces()
            case .getRace:
                getPlayableRace(id: 2)
            case .getRealmIndex:
                getRealmIndex()
            case .getRealm:
                getRealm(slug: "tichondrius")
            case .getRegionIndex:
                getRegionIndex()
            case .getRegion:
                getRegion(id: 1)
            case .getTokenIndex:
                getTokenIndex()
            }
        case .community:
            let service = sections.getRow(at: indexPath) as! CommunityService
            
            switch service {
            case .achievement:
                getAchievement(id: 2144)
            case .auctionDataStatus:
                getAuctions(connectedRealmID: 4)
            case .realmLeaderboard:
                getChallengeLeaderboards(realm: "medivh")
            case .regionLeaderboard:
                getTopChallengeLeaderboards()
            case .characterProfile:
                getCharacter("Aedimus", realmSlug: "Aegwynn")
//            case .characterAchievements:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.hunterPets])
//            case .appearance:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.appearance])
//            case .feed:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.feed])
//            case .guild:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.guild])
//            case .hunterPets:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.hunterPets])
//            case .items:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.items])
//            case .mounts:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.mounts])
//            case .pets:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.pets])
//            case .petSlots:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.petSlots])
//            case .professions:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.professions])
//            case .progression:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.progression])
//            case .pvp:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.pvp])
//            case .quests:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.quests])
//            case .reputation:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.reputation])
//            case .statistics:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.statistics])
//            case .characterStats:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.stats])
//            case .talents:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.talents])
//            case .titles:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.titles])
//            case .audit:
//                getCharacter("Ahote", realm: "Aegwynn", fields: [.audit])
//            case .guildProfile:
//                getGuild("Limit", realm: "Illidan", fields: [])
//            case .members:
//                getGuild("Limit", realm: "Illidan", fields: [.members])
//            case .guildAchievements:
//                getGuild("Limit", realm: "Illidan", fields: [.achievements])
//            case .news:
//                getGuild("Limit", realm: "Illidan", fields: [.news])
//            case .challenge:
//                getGuild("Limit", realm: "Illidan", fields: [.challenges])
            case .item:
                getWOWItem(id: 18803)
            case .itemSet:
                getWOWItemSet(id: 1060)
            case .mountMasterList:
                getMounts()
            case .petMasterList:
                getPets()
            case .leaderboards:
                getWOWLeaderboard(bracket: ._2v2)
            case .quest:
                getWOWQuest(id: 13146)
            case .realmStatus:
                getWOWRealmsStatus()
            case .recipe:
                getWOWRecipe(id: 33994)
            case .spell:
                getWOWSpell(id: 1)
            case .allCharacterRaces:
                getPlayableRaces()
            case .allCharacterClasses:
                getWOWClasses()
            case .allCharacterAchievements:
                getWOWAchievements()
            case .allItemClasses:
                getItemClasses()
            case .allTalents:
                getTalents()
            case .allPetTypes:
                getPets()
            default:
                return
            }
        case .profile:
            let service = sections.getRow(at: indexPath) as! ProfileService
            
            switch service {
            case .getCharacterMythicKeystoneProfile:
                getMythicKeystoneProfile(characterName: "kenkan", realmSlug: "aegwynn")
            case .getCharacterMythicKeystoneProfileSeason:
                getMythicKeystoneProfileSeason(seasonID: 1, characterName: "kenkan", realmSlug: "aegwynn")
            }
        }
    }
}
