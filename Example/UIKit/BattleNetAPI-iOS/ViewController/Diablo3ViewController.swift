//
//  Diablo3ViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/7/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit
import BattleNetAPI


protocol APIViewer: UIViewController {
    var apiType: APIType { get set }
}


class Diablo3ViewController: UITableViewController, APIViewer {
    struct ReuseIdentifier {
        static let cell = "Cell"
    }
    
    
    enum API: String {
        // Game Data
        case gameData = "Game Data API"
        // Community
        case d3Act = "D3 Act API"
        case d3ArtisanAndRecipe = "D3 Aristan and Recipe API"
        case d3Follower = "D3 Follower API"
        case d3CharacterClassAndSkill = "D3 Character Class and Skill API"
        case d3ItemType = "D3 Item Type API"
        case d3Item = "D3 Item API"
        case d3Profile = "D3 Profile API"
    }
    
    
    
    enum GameDataService: String, CaseIterable {
        case seasonIndex = "Season Index"
        case season = "Season"
        case seasonLeaderboard = "Season Leaderboard"
        case eraIndex = "Era Index"
        case era = "Era"
        case eraLeaderboard = "Era Leaderboard"
    }
    
    
    
    enum CommunityService: String, CaseIterable {
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
        // Profile
        case getApiAccount
        case getApiHero
        case getApiDetailedHeroItems
        case getApiDetailedFollowerItems
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
                return row.rawValue
            }
            else if let row = rows[safe: indexPath.row] as? CommunityService {
                return row.rawValue
            }
            else {
                return ""
            }
        }
    }
    
    
    let battleNetAPI = BattleNetAPI(credentials: Current.credentials)
    lazy var d3Repo = Diablo3Repository(battleNetAPI: battleNetAPI)
    
    public var apiType: APIType = .gameData
    
    var sections: [Section] = [Section]()
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if apiType == .gameData {
            sections = [Section(type: .gameData, rows: GameDataService.allCases)]
        }
        else if apiType == .community {
            let actAPIs: [CommunityService] = [.getActIndex, .getAct]
            let artisanAndRecipeAPIs: [CommunityService] = [.getArtisan, .getRecipe]
            let followerAPIs: [CommunityService] = [.getFollower]
            let characterClassAndSkillAPIs: [CommunityService] = [.getCharacterClass, .getApiSkill]
            let itemTypeAPIs: [CommunityService] = [.getItemTypeIndex, .getItemType]
            let itemAPIs: [CommunityService] = [.getItem]
            let profileAPIs: [CommunityService] = [.getApiAccount, .getApiHero, .getApiDetailedHeroItems, .getApiDetailedFollowerItems]
            
            sections = [Section(type: .d3Act, rows: actAPIs),
                        Section(type: .d3ArtisanAndRecipe, rows: artisanAndRecipeAPIs),
                        Section(type: .d3Follower, rows: followerAPIs),
                        Section(type: .d3CharacterClassAndSkill, rows: characterClassAndSkillAPIs),
                        Section(type: .d3ItemType, rows: itemTypeAPIs),
                        Section(type: .d3Item, rows: itemAPIs),
                        Section(type: .d3Profile, rows: profileAPIs)]
        }
        else {
            fatalError("apiType must be specified")
        }
    }
    
    
    
    // MARK: - Game Data APIs
    
    func getSeasons() {
        d3Repo.getSeasons { result in
            switch result {
            case .success(let seasonIndex):
                Debug.print("Retrieved \(seasonIndex.season.count) Seasons")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = seasonIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboards(forSeason seasonID: Int) {
        d3Repo.getLeaderboards(forSeason: seasonID) { result in
            switch result {
            case .success(let seasonLeaderboard):
                Debug.print("Retrieved \(seasonLeaderboard.leaderboard.count) Leaderboards for Season \(seasonID)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = seasonLeaderboard
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forSeason seasonID: Int) {
        d3Repo.getLeaderboard(leaderboard, forSeason: seasonID) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved Season Leaderboard \(leaderboard.season) which has \(leaderboard.column.count) Column(s) and \(leaderboard.row.count) Entry(s)")
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
    
    
    func getEras() {
        d3Repo.getEras { result in
            switch result {
            case .success(let eraIndex):
                Debug.print("Retrieved \(eraIndex.era.count) Eras")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = eraIndex
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboards(forEra eraID: Int) {
        d3Repo.getLeaderboards(forEra: eraID) { result in
            switch result {
            case .success(let eraLeaderboard):
                Debug.print("Retrieved \(eraLeaderboard.leaderboard.count) Leaderboards for Era \(eraID)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = eraLeaderboard
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLeaderboard(_ leaderboard: String, forEra eraID: Int) {
        d3Repo.getLeaderboard(leaderboard, forEra: eraID) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved Era Leaderboard \(leaderboard.era) which has \(leaderboard.column.count) Column(s) and \(leaderboard.row.count) Entry(s)")
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
    
    
    
    // MARK: Community APIs
    
    func getActs() {
        d3Repo.getActs { result in
            switch result {
            case .success(let acts):
                Debug.print("Retrieved \(acts.count) Acts")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = acts
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getAct(_ id: Int) {
        d3Repo.getAct(id) { result in
            switch result {
            case .success(let act):
                Debug.print("Retrieved \(act.name)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = act
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getArtisan(_ slug: String) {
        d3Repo.getArtisan(slug) { result in
            switch result {
            case .success(let artisan):
                Debug.print("Artisan \(artisan.name) has \(artisan.training.tiers.first!.trainedRecipes.count) Trained Recipes at first tier")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = artisan
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getRecipe(_ recipeSlug: String, forArtisan artisanSlug: String) {
        d3Repo.getRecipe(recipeSlug, forArtisan: artisanSlug) { result in
            switch result {
            case .success(let recipe):
                Debug.print("Recipe \(recipe.name) has \(recipe.reagents.count) Reagents and produces \(recipe.itemProduced.name)")
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
    
    
    func getFollower(_ slug: String) {
        d3Repo.getFollower(slug) { result in
            switch result {
            case .success(let follower):
                Debug.print("Follower \(follower.name) has \(follower.skills.count) Skills")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = follower
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getClass(_ slug: String) {
        d3Repo.getClass(slug) { result in
            switch result {
            case .success(let d3Class):
                Debug.print("Class \(d3Class.name) has \(d3Class.skills.active.count) Active Skills")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = d3Class
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getSkill(_ skillSlug: String, forClass classSlug: String) {
        d3Repo.getSkill(skillSlug, forClass: classSlug) { result in
            switch result {
            case .success(let skillConfig):
                Debug.print("Skill \(skillConfig.skill.name) has \(skillConfig.runes?.count ?? 0) Runes")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = skillConfig
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3ItemTypes() {
        d3Repo.getItemTypes { result in
            switch result {
            case .success(let itemTypes):
                Debug.print("Retrieved \(itemTypes.count) Item Type(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = itemTypes
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3ItemsByType(_ typeSlug: String) {
        d3Repo.getItemsByType(typeSlug) { result in
            switch result {
            case .success(let items):
                Debug.print("Retrieved \(items.count) Item(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = items
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getD3Item(_ slugAndID: String) {
        d3Repo.getItem(slugAndID) { result in
            switch result {
            case .success(let item):
                Debug.print("Retrieved Full Item \(item.name)")
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
    
    
    func getProfile(battleTag: String) {
        d3Repo.getProfile(battleTag: battleTag) { result in
            switch result {
            case .success(let profile):
                Debug.print("Retrieved Profile \(profile.battleTag)")
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
    
    
    func getHero(_ heroID: Int, for battleTag: String) {
        d3Repo.getHero(heroID, for: battleTag) { result in
            switch result {
            case .success(let hero):
                Debug.print("Retrieved Hero \(hero.name) with Main Hand Item \(hero.items.mainHand?.name ?? "no item")")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = hero
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getItems(forHero heroID: Int, forBattleTag battleTag: String) {
        d3Repo.getItems(forHero: heroID, forBattleTag: battleTag) { result in
            switch result {
            case .success(let equippedItems):
                let slots = [equippedItems.head?.slots,
                             equippedItems.neck?.slots,
                             equippedItems.torso?.slots,
                             equippedItems.shoulders?.slots,
                             equippedItems.legs?.slots,
                             equippedItems.waist?.slots,
                             equippedItems.hands?.slots,
                             equippedItems.bracers?.slots,
                             equippedItems.feet?.slots,
                             equippedItems.leftFinger?.slots,
                             equippedItems.rightFinger?.slots,
                             equippedItems.mainHand?.slots,
                             equippedItems.offHand?.slots].compactMap({$0})
                
                Debug.print("Hero \(heroID) has items equipped to \(slots.joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = equippedItems
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getFollowerItems(forHero heroID: Int, forBattleTag battleTag: String) {
        d3Repo.getFollowerItems(forHero: heroID, forBattleTag: battleTag) { result in
            switch result {
            case .success(let heroFollower):
                let slots: (FullEquippedItems) -> [String] = { followerItems in
                    return [followerItems.head?.slots,
                            followerItems.neck?.slots,
                            followerItems.torso?.slots,
                            followerItems.shoulders?.slots,
                            followerItems.legs?.slots,
                            followerItems.waist?.slots,
                            followerItems.hands?.slots,
                            followerItems.bracers?.slots,
                            followerItems.feet?.slots,
                            followerItems.leftFinger?.slots,
                            followerItems.rightFinger?.slots,
                            followerItems.mainHand?.slots,
                            followerItems.offHand?.slots].compactMap({$0})
                }
                
                Debug.print("Hero \(heroID)'s templar has items equipped to \(slots(heroFollower.templar).joined(separator: ", "))")
                Debug.print("Hero \(heroID)'s scoundrel has items equipped to \(slots(heroFollower.scoundrel).joined(separator: ", "))")
                Debug.print("Hero \(heroID)'s enchantress has items equipped to \(slots(heroFollower.enchantress).joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = heroFollower
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
        case .community:
            let service = sections.getRow(at: indexPath) as! CommunityService
            
            switch service {
            case .getActIndex:
                getActs()
            case .getAct:
                getAct(5)
            case .getArtisan:
                getArtisan("blacksmith")
            case .getRecipe:
                getRecipe("apprentice-flamberge", forArtisan: "blacksmith")
            case .getFollower:
                getFollower("templar")
            case .getCharacterClass:
                getClass("barbarian")
            case .getApiSkill:
                getSkill("bash", forClass: "barbarian")
            case .getItemTypeIndex:
                getD3ItemTypes()
            case .getItemType:
                getD3ItemsByType("sword2h")
            case .getItem:
                getD3Item("corrupted-ashbringer-Unique_Sword_2H_104_x1")
            case .getApiAccount:
                getProfile(battleTag: "kinkofer-11254")
            case .getApiHero:
                getHero(88095369, for: "hionpotuse-1872")
//                getItems(forHero: 88095369, forBattleTag: "hionpotuse-1872")
            case .getApiDetailedHeroItems:
                getItems(forHero: 99983354, forBattleTag: "kinkofer-11254")
            case .getApiDetailedFollowerItems:
                getFollowerItems(forHero: 88095369, forBattleTag: "hionpotuse-1872")
            }
        case .gameData:
            let service = sections.getRow(at: indexPath) as! GameDataService
            
            switch service {
            case .seasonIndex:
                getSeasons()
            case .season:
                getLeaderboards(forSeason: 1)
            case .seasonLeaderboard:
                getLeaderboard("achievement-points", forSeason: 1)
            case .eraIndex:
                getEras()
            case .era:
                getLeaderboards(forEra: 1)
            case .eraLeaderboard:
                getLeaderboard("rift-barbarian", forEra: 1)
            }
        case .profile:
            break
        }
    }
}


