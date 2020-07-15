//
//  StarCraft2ViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit
import BattleNetAPI


class StarCraft2ViewController: UITableViewController, APIViewer {
    struct ReuseIdentifier {
        static let cell = "Cell"
    }
    
    
    enum API: String {
        case gameData = "Game Data API"
        case profile = "Profile API"
        case ladder = "Ladder API"
        case account = "Account API"
    }
    
    
    enum GameDataService: String, CaseIterable {
        case getLeagueData
    }
    
    enum CommunityService: String, CaseIterable {
        // Profile
        case `static` = "Static"
        case metadata = "Metadata"
        case profile = "Profile"
        case ladderSummary = "Ladder Summary"
        case ladder = "Ladder"
        
        // Ladder
        case grandmasterLeaderboard = "Grandmaster Leaderboard"
        case season = "Seaon"
        
        // Account
        case player = "Player"
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
    lazy var sc2MC = StarCraft2ModelController(battleNetAPI: battleNetAPI)
    
    public var apiType: APIType = .gameData
    
    var sections: [Section] = [Section]()
    
    
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch apiType {
        case .gameData:
            sections = [Section(type: .gameData, rows: GameDataService.allCases)]
        case .community:
            let profileAPIs: [CommunityService] = [.static, .metadata, .profile, .ladderSummary, .ladder]
            let ladderAPIs: [CommunityService] = [.grandmasterLeaderboard, .season]
            let accountAPIs: [CommunityService] = [.player]
            
            sections = [Section(type: .profile, rows: profileAPIs),
                        Section(type: .ladder, rows: ladderAPIs),
                        Section(type: .account, rows: accountAPIs)]
        case .profile:
            break
        }
    }
    
    
    
    // MARK: - Game Data APIs
    
    func getLeagueData(seasonID: Int, queue: LeagueQueue, team: LeagueTeam, league: LeagueType) {
        sc2MC.getLeagueData(seasonID: seasonID, queue: queue, team: team, league: league) { result in
            switch result {
            case .success(let league):
                Debug.print("Retrieved League \(league.key.leagueID) with \(league.tier.count) tier(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = league
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: - Community APIs
    
    // MARK: Profile API
    
    func getProfileData(sc2Region: APIRegion) {
        self.sc2MC.getProfileData(sc2Region: sc2Region) { result in
            switch result {
            case .success(let profile):
                Debug.print("Retrieved profile with \(profile.achievements.count) Achievements, \(profile.categories.count) Categories, \(profile.criteria.count) Criteria, \(profile.rewards.count) Rewards")
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
    
    
    func getProfileMetadata(id: Int, sc2Region: APIRegion, realmID: Int) {
        self.sc2MC.getProfileMetadata(id: id, sc2Region: sc2Region, realmID: realmID) { result in
            switch result {
            case .success(let player):
                Debug.print("Retrieved player \(player.name) with profileID \(player.profileID) and realmID \(player.realmID)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = player
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getProfile(id: Int, sc2Region: APIRegion, realmID: Int) {
        self.sc2MC.getProfile(id: id, sc2Region: sc2Region, realmID: realmID) { result in
            switch result {
            case .success(let profile):
                Debug.print("Retrieved profile \(profile.summary.displayName) with \(profile.earnedAchievements.count) earned achievement(s)")
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
    
    
    func getLadderSummary(profileID: Int, sc2Region: APIRegion, realmID: Int) {
        self.sc2MC.getLadderSummary(profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            switch result {
            case .success(let ladderSummary):
                Debug.print("Ladder Summary retrieved with \(ladderSummary.allLadderMemberships.count) ladder membership(s), \(ladderSummary.placementMatches.count) placement match(s), and \(ladderSummary.showCaseEntries.count) show case entry(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = ladderSummary
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    func getLadder(id: Int, profileID: Int, sc2Region: APIRegion, realmID: Int) {
        self.sc2MC.getLadder(id: id, profileID: profileID, sc2Region: sc2Region, realmID: realmID) { result in
            switch result {
            case .success(let ladder):
                Debug.print("Ladder retrieved in \(ladder.league ?? "unknown") league with \(ladder.ladderTeams.count) ladder teams(s)")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceObj = ladder
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: Ladder API
    
    func getGrandmasterLeaderboard(sc2Region: APIRegion) {
        self.sc2MC.getGrandmasterLeaderboard(sc2Region: sc2Region) { result in
            switch result {
            case .success(let leaderboard):
                Debug.print("Retrieved Grandmaster Leaderbaord with \(leaderboard.ladderTeams.count) ladder teams(s)")
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
    
    
    func getLadderSeason(sc2Region: APIRegion) {
        self.sc2MC.getLadderSeason(sc2Region: sc2Region) { result in
            switch result {
            case .success(let season):
                Debug.print("Retrieved \(season.year) season")
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
    
    
    // MARK: Account API
    
    func getPlayers(userID: Int) {
        sc2MC.getPlayers(userID: userID) { result in
            switch result {
            case .success(let players):
                Debug.print("Retrieved \(players.count) player(s) named \(players.map { $0.name }.joined(separator: ", "))")
                DispatchQueue.main.async {
                    let viewController = ViewerTableViewController()
                    viewController.dataSourceArr = players
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
            case .getLeagueData:
                getLeagueData(seasonID: 37, queue: .lotV1v1, team: .arranged, league: .grandmaster)
            }
        case .community:
            let service = sections.getRow(at: indexPath) as! CommunityService
            
            switch service {
            case .static:
                getProfileData(sc2Region: .us)
            case .metadata:
                getProfileMetadata(id: 266515, sc2Region: .us, realmID: 1)
            case .profile:
                getProfile(id: 266515, sc2Region: .us, realmID: 1)
            case .ladderSummary:
                getLadderSummary(profileID: 2060165, sc2Region: .us, realmID: 1)
            case .ladder:
                getLadder(id: 277454, profileID: 2060165, sc2Region: .us, realmID: 1)
            case .grandmasterLeaderboard:
                getGrandmasterLeaderboard(sc2Region: .us)
            case .season:
                getLadderSeason(sc2Region: .us)
            case .player:
                getPlayers(userID: 8)
            }
        case .profile:
            break
        }
    }
}
