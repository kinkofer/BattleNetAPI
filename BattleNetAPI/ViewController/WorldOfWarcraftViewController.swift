//
//  WorldOfWarcraftViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit

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
        case boss = "Boss API"
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
        // Mythic Challenge Leaderboard
        case getMythicChallengeMode
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
        // Boss
        case bossMasterList = "Boss Master List"
        case boss = "Boss"
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
        case abilities = "Abilities"
        case species = "Species"
        case petStats = "Pet Stats"
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
        // User
        case characters = "Characters"
        // Zone
        case zoneMasterList = "Zone Master List"
        case zone = "Zone"
        // Data Resources
        case allBattlegroups = "Battlegroups"
        case allCharacterRaces = "Character Races"
        case allCharacterClasses = "Character Classes"
        case allCharacterAchievements = "All Character Achievements"
        case allGuildRewards = "Guild Rewards"
        case allGuildPerks = "Guild Perks"
        case allGuildAchievements = "All Guild Achievements"
        case allItemClasses = "Item Classes"
        case allTalents = "Telents"
        case allPetTypes = "Pet Types"
        
        
        var displayName: String {
            switch self {
            case .characterAchievements, .guildAchievements:
                return "Achievements"
            case .bossMasterList, .mountMasterList, .petMasterList, .zoneMasterList:
                return "Master List"
            case .characterStats, .petStats:
                return "Stats"
            case .allCharacterAchievements:
                return "Character Achievements"
            case .allGuildAchievements:
                return "Guild Achievements"
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
    
    
    let wowMC = WorldOfWarcraftModelController.shared
    
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
            let mythicChallengeModeAPIs: [GameDataService] = [.getMythicChallengeMode]
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
                        Section(type: .mythicChallengeMode, rows: mythicChallengeModeAPIs),
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
            let bossAPIs: [CommunityService] = [.bossMasterList, .boss]
            let challengeModeAPIs: [CommunityService] = [.realmLeaderboard, .regionLeaderboard]
            let characterProfileAPIs: [CommunityService] = [.characterProfile, .characterAchievements, .appearance, .feed, .guild, .hunterPets,
                                                            .items, .mounts, .pets, .petSlots, .professions, .progression, .pvp, .quests,
                                                            .reputation, .statistics, .characterStats, .talents, .titles, .audit]
            let guildProfileAPIs: [CommunityService] = [.guildProfile, .members, .guildAchievements, .news, .challenge]
            let itemAPIs: [CommunityService] = [.item, .itemSet]
            let mountAPIs: [CommunityService] = [.mountMasterList]
            let petAPIs: [CommunityService] = [.petMasterList, .abilities, .species, .petStats]
            let pvpAPIs: [CommunityService] = [.leaderboards]
            let questAPIs: [CommunityService] = [.quest]
            let realmStatusAPIs: [CommunityService] = [.realmStatus]
            let recipeAPIs: [CommunityService] = [.recipe]
            let spellAPIs: [CommunityService] = [.spell]
            let userAPIs: [CommunityService] = [.characters]
            let zoneAPIs: [CommunityService] = [.zoneMasterList, .zone]
            let dataResourcesAPIs: [CommunityService] = [.allBattlegroups, .allCharacterRaces, .allCharacterClasses, .allCharacterAchievements,
                                                         .allGuildRewards, .allGuildPerks, .allGuildAchievements,
                                                         .allItemClasses, .allTalents, .allPetTypes]
            
            sections = [Section(type: .achievement, rows: achievementAPIs),
                        Section(type: .auction, rows: auctionAPIs),
                        Section(type: .boss, rows: bossAPIs),
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
                        Section(type: .user, rows: userAPIs),
                        Section(type: .zone, rows: zoneAPIs),
                        Section(type: .dataResources, rows: dataResourcesAPIs)]
        case .profile:
            let wowMythicKeystoneCharacterProfileAPIs: [ProfileService] = [.getCharacterMythicKeystoneProfile, .getCharacterMythicKeystoneProfileSeason]
            
            sections = [Section(type: .wowMythicKeystoneCharacterProfile, rows: wowMythicKeystoneCharacterProfileAPIs)]
        }
    }
    
    
    
    // MARK: - Game Data APIs
    
    // MARK: Connected Realm API
    
    func getConnectedRealmIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getConnectedRealmIndex(region: region, locale: locale) { result in
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
    
    
    func getConnectedRealm(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getConnectedRealm(id: id, region: region, locale: locale) { result in
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
    
    func getMythicKeystoneAffixes(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneAffixes(region: region, locale: locale) { result in
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
    
    
    func getMythicKeystoneAffix(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneAffix(id: id, region: region, locale: locale) { result in
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
    
    func getMythicRaidLeaderboard(raid: String, faction: FactionType, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicRaidLeaderboard(raid: raid, faction: faction, region: region, locale: locale) { result in
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
    
    func getMythicKeystoneDungeons(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneDungeons(region: region, locale: locale) { result in
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
    
    
    func getMythicKeystoneDungeon(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneDungeon(id: id, region: region, locale: locale) { result in
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
    
    
    func getMythicKeystones(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystones(region: region, locale: locale) { result in
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
    
    
    func getMythicKeystonePeriods(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystonePeriods(region: region, locale: locale) { result in
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
    
    
    func getMythicKeystonePeriod(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystonePeriod(id: id, region: region, locale: locale) { result in
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
    
    
    func getMythicKeystoneSeasons(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneSeasons(region: region, locale: locale) { result in
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
    
    
    func getMythicKeystoneSeason(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicKeystoneSeason(id: id, region: region, locale: locale) { result in
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
    
    func getMythicLeaderboards(connectedRealmID: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicLeaderboards(connectedRealmID: connectedRealmID, region: region, locale: locale) { result in
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
    
    
    func getMythicLeaderboard(connectedRealmID: Int, dungeonID: Int, period: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicLeaderboard(connectedRealmID: connectedRealmID, dungeonID: dungeonID, period: period, region: region, locale: locale) { result in
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
    
    
    func getMythicChallengeMode(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getMythicChallengeMode(region: region, locale: locale) { result in
            switch result {
            case .success(let mythicChallengeMode):
                let keystoneAffixes = mythicChallengeMode.currentKeystoneAffixes.compactMap { $0.keystoneAffix.name }
                Debug.print("Retrieved Mythic Challenge Mode with Current Period \(mythicChallengeMode.currentPeriod) with Keystone Affixes \(keystoneAffixes.joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = mythicChallengeMode
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Playable Class API
    
    func getPlayableClasses(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableClasses(region: region, locale: locale) { result in
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
    
    
    func getPlayableClass(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableClass(id: id, region: region, locale: locale) { result in
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
    
    
    func getPlayableClassPvPTalentSlots(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableClassPvPTalentSlots(id: id, region: region, locale: locale) { result in
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
    
    func getPlayableSpecializations(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableSpecializations(region: region, locale: locale) { result in
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
    
    
    func getPlayableSpecialization(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableSpecialization(id: id, region: region, locale: locale) { result in
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
    
    func getPowerTypes(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPowerTypes(region: region, locale: locale) { result in
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
    
    
    func getPowerType(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPowerType(id: id, region: region, locale: locale) { result in
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
    
    func getPlayableRaces(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableRaces(region: region, locale: locale) { result in
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
    
    
    func getPlayableRace(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getPlayableRace(id: id, region: region, locale: locale) { result in
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
    
    func getRealmIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getRealmIndex(region: region, locale: locale) { result in
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
    
    
    func getRealm(id: Int? = nil, slug: String? = nil, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getRealm(id: id, slug: slug, region: region, locale: locale) { result in
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
    
    func getRegionIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getRegionIndex(region: region, locale: locale) { result in
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
    
    
    func getRegion(id: Int, region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getRegion(id: id, region: region, locale: locale) { result in
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
    
    func getTokenIndex(region: APIRegion = Current.region, locale: APILocale? = Current.locale) {
        wowMC.getTokenIndex(region: region, locale: locale) { result in
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
    
    func getAchievement(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getAchievement(id: id, region: region, locale: locale) { result in
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
    
    func getAuctions(realm: String, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getAuctions(realm: realm, region: region, locale: locale) { result in
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
    
    
    // MARK: Boss API
    
    func getBosses(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getBosses(region: region, locale: locale) { result in
            switch result {
            case .success(let bosses):
                Debug.print("Retrieved \(bosses.count) Boss(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = bosses
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getBoss(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getBoss(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let boss):
                Debug.print("Retrieved Boss \(boss.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = boss
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Challenge Mode API
    
    func getChallengeLeaderboards(realm: String, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getChallengeLeaderboards(realm: realm, region: region, locale: locale) { result in
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
    
    
    func getTopChallengeLeaderboards(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getTopChallengeLeaderboards(region: region, locale: locale) { result in
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
    
    func getCharacter(_ name: String, realm: String, fields: WOWCharacterField? = nil, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getCharacter(name, realm: realm, fields: fields, region: region, locale: locale) { result in
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
    
    func getGuild(_ name: String, realm: String, fields: WOWGuildField? = nil, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getGuild(name, realm: realm, fields: fields, region: region, locale: locale) { result in
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
    
    func getWOWItem(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getItem(id: id, region: region, locale: locale) { result in
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
    
    
    func getWOWItemSet(setID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getItemSet(setID: setID, region: region, locale: locale) { result in
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
    
    func getMounts(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getMounts(region: region, locale: locale) { result in
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
    
    func getPets(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getPets(region: region, locale: locale) { result in
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
    
    
    func getPetAbility(abilityID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getPetAbility(abilityID: abilityID, region: region, locale: locale) { result in
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
    
    
    func getPetSpecies(speciesID: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getPetSpecies(speciesID: speciesID, region: region, locale: locale) { result in
            switch result {
            case .success(let petSpecies):
                Debug.print("Retrieved Pet Species \(petSpecies.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = petSpecies
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getPetStats(speciesID: Int, level: Int = 1, breedID: Int = 3, qualityID: Int = 1, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getPetStats(speciesID: speciesID, level: level, breedID: breedID, qualityID: qualityID, region: region, locale: locale) { result in
            switch result {
            case .success(let petStats):
                Debug.print("Retrieved Pet Stats: health \(petStats.health), power \(petStats.power), speed \(petStats.speed)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = petStats
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: PVP API
    
    func getWOWLeaderboard(bracket: WOWLeaderboardBracket, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getLeaderboard(bracket: bracket, region: region, locale: locale) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved WOW Leaderboard with \(leaderboard.rows.count) entry(s)")
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
    
    
    // MARK: Quest API
    
    func getWOWQuest(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getQuest(id: id, region: region, locale: locale) { result in
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
    
    func getWOWRealmsStatus(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getRealmsStatus(region: region, locale: locale) { result in
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
    
    func getWOWRecipe(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getRecipe(id: id, region: region, locale: locale) { result in
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
    
    func getWOWSpell(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getSpell(id: id, region: region, locale: locale) { result in
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
    
    
    // MARK: User API
    
    func getCharacters(region: APIRegion = Current.region) {
        wowMC.getCharacters(region: region) { result in
            switch result {
            case .success(let characters):
                Debug.print("Retrieved \(characters.count) Character(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = characters
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Zone API
    
    func getZones(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getZones(region: region, locale: locale) { result in
            switch result {
            case .success(let zones):
                let raids = zones.filter { $0.isRaid }
                let dungeons = zones.filter { $0.isDungeon }
                Debug.print("Retrieved \(zones.count) Zone(s) with \(raids.count) Raid(s) and \(dungeons.count) Dungeon(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = zones
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Data Resources
    
    func getZone(id: Int, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getZone(id: id, region: region, locale: locale) { result in
            switch result {
            case .success(let zone):
                Debug.print("Retrieved Zone \(zone.name) with \(zone.bosses.count) Bosses")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = zone
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getBattlegroups(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getBattlegroups(region: region, locale: locale) { result in
            switch result {
            case .success(let battlegroups):
                Debug.print("Retrieved \(battlegroups.count) Battlegroup(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = battlegroups
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRaces(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getRaces(region: region, locale: locale) { result in
            switch result {
            case .success(let races):
                Debug.print("Retrieved \(races.count) Race(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = races
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWClasses(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getClasses(region: region, locale: locale) { result in
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
    
    
    func getWOWAchievements(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getAchievements(region: region, locale: locale) { result in
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
    
    
    func getWOWGuildRewards(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getGuildRewards(region: region, locale: locale) { result in
            switch result {
            case .success(let rewards):
                Debug.print("Retrieved \(rewards.count) WOW Guild Reward(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = rewards
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildPerks(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getGuildPerks(region: region, locale: locale) { result in
            switch result {
            case .success(let perks):
                Debug.print("Retrieved \(perks.count) WOW Guild Perk(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = perks
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getWOWGuildAchievements(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getGuildAchievements(region: region, locale: locale) { result in
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
    
    
    func getItemClasses(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getItemClasses(region: region, locale: locale) { result in
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
    
    
    func getTalents(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getTalents(region: region, locale: locale) { result in
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
    
    
    func getPetTypes(region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getPetTypes(region: region, locale: locale) { result in
            switch result {
            case .success(let petTypes):
                Debug.print("Retrieved \(petTypes.count) Pet Type(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = petTypes
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: - Profile APIs
    // MARK: WoW Mythic Keystone Character Profile API
    
    func getMythicKeystoneProfile(characterName: String, realmSlug: String, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getMythicKeystoneProfile(characterName: characterName, realmSlug: realmSlug, region: region, locale: locale) { result in
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
    
    
    func getMythicKeystoneProfileSeason(seasonID: Int, characterName: String, realmSlug: String, region: APIRegion = Current.region, locale: APILocale = Current.locale) {
        wowMC.getMythicKeystoneProfileSeason(seasonID: seasonID, characterName: characterName, realmSlug: realmSlug, region: region, locale: locale) { result in
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
    
    func handleError(_ error: HTTPError, function: String = #function) {
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
            case .getMythicChallengeMode:
                getMythicChallengeMode()
            case .getPlayableClassesIndex:
                getPlayableClasses()
            case .getPlayableClass:
                getPlayableClass(id: 7)
            case .getPlayableClassPvPTalentSlots:
                getPlayableClassPvPTalentSlots(id: 7)
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
                getAuctions(realm: "medivh")
            case .bossMasterList:
                getBosses()
            case .boss:
                getBoss(id: 24723)
            case .realmLeaderboard:
                getChallengeLeaderboards(realm: "medivh")
            case .regionLeaderboard:
                getTopChallengeLeaderboards()
            case .characterProfile:
                getCharacter("Aedimus", realm: "Aegwynn", fields: [])
            case .characterAchievements:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.hunterPets])
            case .appearance:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.appearance])
            case .feed:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.feed])
            case .guild:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.guild])
            case .hunterPets:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.hunterPets])
            case .items:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.items])
            case .mounts:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.mounts])
            case .pets:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.pets])
            case .petSlots:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.petSlots])
            case .professions:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.professions])
            case .progression:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.progression])
            case .pvp:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.pvp])
            case .quests:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.quests])
            case .reputation:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.reputation])
            case .statistics:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.statistics])
            case .characterStats:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.stats])
            case .talents:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.talents])
            case .titles:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.titles])
            case .audit:
                getCharacter("Ahote", realm: "Aegwynn", fields: [.audit])
            case .guildProfile:
                getGuild("Limit", realm: "Illidan", fields: [])
            case .members:
                getGuild("Limit", realm: "Illidan", fields: [.members])
            case .guildAchievements:
                getGuild("Limit", realm: "Illidan", fields: [.achievements])
            case .news:
                getGuild("Limit", realm: "Illidan", fields: [.news])
            case .challenge:
                getGuild("Limit", realm: "Illidan", fields: [.challenges])
            case .item:
                getWOWItem(id: 18803)
            case .itemSet:
                getWOWItemSet(setID: 1060)
            case .mountMasterList:
                getMounts()
            case .petMasterList:
                getPets()
            case .abilities:
                getPetAbility(abilityID: 640)
            case .species:
                getPetSpecies(speciesID: 258)
            case .petStats:
                getPetStats(speciesID: 258, level: 25, breedID: 5, qualityID: 4)
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
            case .characters:
                getCharacters()
            case .zoneMasterList:
                getZones()
            case .zone:
                getZone(id: 4131)
            case .allBattlegroups:
                getBattlegroups()
            case .allCharacterRaces:
                getRaces()
            case .allCharacterClasses:
                getWOWClasses()
            case .allCharacterAchievements:
                getWOWAchievements()
            case .allGuildRewards:
                getWOWGuildRewards()
            case .allGuildPerks:
                getWOWGuildPerks()
            case .allGuildAchievements:
                getWOWGuildAchievements()
            case .allItemClasses:
                getItemClasses()
            case .allTalents:
                getTalents()
            case .allPetTypes:
                getPetTypes()
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
