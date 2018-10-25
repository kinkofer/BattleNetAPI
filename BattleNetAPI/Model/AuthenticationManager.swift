//
//  AuthenticationManager.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


protocol UserAuthDelegate {
    /**
     A delegate function that is called after the user has returned from authorization, or when validating a saved userAccessToken.
     - parameter result: The Result enum containing some value if `.success` or an HTTPError if `.failure`
     
        `value`: String representing the userAccessToken
     */
    func didReceiveUserAccessResult(_ result: Result<String>)
}



class AuthenticationManager {
    let authMC = AuthenticationModelController.shared
    
    var delegate: UserAuthDelegate?
    
    /// The clientID is a unique token provided by the Blizzard Battle.net Developer Portal
    let clientID = AuthToken.clientID
    /// The clientSecret is a unique token provided by the Blizzard Battle.net Developer Portal
    let clientSecret = AuthToken.clientSecret
    
    /// The clientAccessToken is required for your app to make API calls. It is retrieved from a service that only requires your clientToken and clientSecret.
    var clientAccessToken: String?
    /// The userAccessToken is used to make API calls that require the user's permission. It is retrieved from a redirect after the user enters their credentials.
    var userAccessToken: String?
    
    
    
    // MARK: - Init
    
    init() {
        // TODO: retrieve data from keychain
        clientAccessToken = "CLIENT_TOKEN"
        userAccessToken = "USER_TOKEN"
    }
    
    
    
    // MARK: -
    
    func getClientAccessToken(completion: @escaping (_ result: Result<String>) -> Void) {
        if let accessToken = clientAccessToken {
            authMC.validateClientAccessToken(accessToken) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        completion(.success(accessToken))
                    case .failure(let error):
                        completion(.failure(error))
                        self.clientAccessToken = nil
                    }
                }
            }
        }
        else {
            authMC.getClientAccessToken(clientID: clientID, clientSecret: clientSecret) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let access):
                        completion(.success(access.token))
                        self.clientAccessToken = access.token
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    
    func getUserAccessToken(scope: Scope) {
        authMC.sendToOAuth(clientID: clientID, scope: scope, redirectURL: "https://oauth.click/BattleNetAPI/")
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveUserCode(_:)), name: .didReturnUserCodeNotification, object: nil)
    }
    
    
    func validateUserAccessToken() {
        if let userAccessToken = userAccessToken {
            authMC.validateUserAccessToken(userAccessToken) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        self.delegate?.didReceiveUserAccessResult(.success(userAccessToken))
                    case .failure(let error):
                        self.userAccessToken = nil
                        self.delegate?.didReceiveUserAccessResult(.failure(error))
                    }
                }
            }
        }
        else {
            self.delegate?.didReceiveUserAccessResult(.failure(HTTPError(type: .unauthorized)))
        }
    }
    
    
    @objc func didReceiveUserCode(_ notification: Notification) {
        if let code = notification.userInfo?["code"] as? String {
            authMC.getUserAccessToken(region: .us, clientID: clientID, clientSecret: clientSecret, code: code, redirectURL: "https://oauth.click/BattleNetAPI/") { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let access):
                        self.delegate?.didReceiveUserAccessResult(.success(access.token))
                        self.userAccessToken = access.token
                    case .failure(let error):
                        self.delegate?.didReceiveUserAccessResult(.failure(error))
                    }
                }
            }
        }
        else {
            self.delegate?.didReceiveUserAccessResult(.failure(HTTPError(type: .unexpectedResponse)))
        }
    }
    
    
    
    // MARK: - Legacy
    
    func setupLegacyWebServices() {
        authMC.setApikeyLegacy(clientID)
        Debug.print("Ready for legacy web services")
    }
}
