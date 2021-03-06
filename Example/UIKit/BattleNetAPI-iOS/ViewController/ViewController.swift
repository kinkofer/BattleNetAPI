//
//  ViewController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import UIKit
import AuthenticationServices
import BattleNetAPI


class ViewController: UIViewController {
    struct ReuseIdentifier {
        static let cell = "Cell"
    }
    
    enum Game: String {
        case diablo3 = "Diablo 3"
        case starCraft2 = "StarCraft 2"
        case worldOfWarcraft = "World of Warcraft"
        case battleNet = "BattleNet Profile"
    }
    
    
    struct Section: TableSection {
        typealias SectionType = Game
        
        var type: Game
        var rows: [Any]
        
        init(type: Game, rows: [APIType]) {
            self.type = type
            self.rows = rows
        }
        
        func getTitle(forSection: Int) -> String {
            return type.rawValue
        }
        
        func getTitle(forRowAt indexPath: IndexPath) -> String {
            return (rows[indexPath.row] as? APIType)?.displayName ?? ""
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let battleNetAPI = BattleNetAPI(credentials: Current.credentials)
    
    lazy var authRepo = AuthenticationRepository(battleNetAPI: battleNetAPI)
    lazy var userRepo = UserRepository(battleNetAPI: battleNetAPI)
    
    lazy var authManager = AuthenticationManager(battleNetAPI: battleNetAPI, oauth: Current.oauth, providerContext: self)
    
    let sections: [Section] = [Section(type: .battleNet, rows: [.profile]),
                               Section(type: .diablo3, rows: [.gameData, .community]),
                               Section(type: .starCraft2, rows: [.gameData, .community]),
                               Section(type: .worldOfWarcraft, rows: [.gameData, .profile, .community])]
    
    
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        battleNetAPI.d3.getLeaderboards(eraID: 1) { result in
            let result = Result { try EraLeaderboardIndex.decode(from: try result.get()) }
            switch result {
            case .success(let eraLeaderboard):
                Debug.print("Retrieved \(eraLeaderboard.leaderboard.count) Leaderboards for Era 1")
            case .failure(let error):
                self.handleError(error)
            }
        }
        
        authManager.getClientAccessToken { result in
            switch result {
            case .success(let token):
                Debug.print("clientAccessToken: \(token)")
                Debug.print("Ready for game data web services")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    
    func showAPI(type: APIType, for game: Game) {
        let viewController: APIViewer
        
        switch game {
        case .diablo3:
            viewController = Diablo3ViewController()
        case .starCraft2:
            viewController = StarCraft2ViewController()
        case .worldOfWarcraft:
            viewController = WorldOfWarcraftViewController()
        case .battleNet:
            getUser()
            return
        }
        
        viewController.apiType = type
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func authenticateUser(showAPI: (APIType, Game)? = nil) {
        self.authManager.getUserAccessToken { result in
            switch result {
            case .success(let userAccessToken):
                Debug.print("userAccessToken: \(userAccessToken)")
                Debug.print("Ready for community web services")
                
                if let (apiType, game) = showAPI {
                    self.showAPI(type: apiType, for: game)
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    // MARK: - Profile API
    
    func getUser() {
        userRepo.getUser { result in
            switch result {
            case .success(let user):
                Debug.print("Retrieved User \(user.battletag)")
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    
    
    // MARK: - Error handling
    
    func handleError(_ error: Error, function: String = #function) {
        Debug.print(error.localizedDescription, function: function)
    }
    
}
    


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections.getTitle(forSectionAt: section)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.cell)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: ReuseIdentifier.cell)
        }
        
        let section = sections[indexPath.section]
        
        switch section.type {
        case .battleNet:
            cell.textLabel?.text = "User Info"
        default:
            cell.textLabel?.text = sections.getTitle(forRowAt: indexPath)
        }
        
        return cell
    }
}



// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = sections[indexPath.section]
        let apiType = section.rows[indexPath.row] as! APIType
        
        if apiType == .gameData {
            self.showAPI(type: apiType, for: section.type)
        }
        else if (apiType == .community || apiType == .profile) && Current.credentials.userAccessToken == nil {
            self.presentConfirmAlert(title: "User Authorization Required",
                                     message: "These APIs require you sign in to your BattleNet account and grant permission to this app.",
                                     buttonTitle: "Sign In",
                                     confirmed: { _ in
                                        self.authenticateUser(showAPI: (apiType, section.type))
            })
        }
        else {
            authManager.getUserAccessToken { result in
                switch result {
                case .success(_):
                    self.showAPI(type: apiType, for: section.type)
                case .failure(let error):
                    self.handleError(error)
                }
            }
        }
    }
}



extension ViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}
