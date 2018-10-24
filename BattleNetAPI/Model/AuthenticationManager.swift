//
//  AuthenticationManager.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


protocol UserAuthDelegate {
    func didReceiveUserAccessResult(_ result: Result<String>)
}



class AuthenticationManager {
    let authMC = AuthenticationModelController.shared
    
    var delegate: UserAuthDelegate? = nil
    
    let clientID = AuthToken.clientID
    let clientSecret = AuthToken.clientSecret
    
    var clientAccessToken: String? = nil
    var userAccessToken: String? = nil
    
    
    
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
                        completion(Result(value: accessToken, error: nil))
                    case .failure(let error):
                        completion(Result(value: nil, error: error))
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
                        completion(Result(value: access.token, error: nil))
                        self.clientAccessToken = access.token
                    case .failure(let error):
                        completion(Result(value: nil, error: error))
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
                        self.delegate?.didReceiveUserAccessResult(Result(value: userAccessToken, error: nil))
                    case .failure(let error):
                        self.userAccessToken = nil
                        self.delegate?.didReceiveUserAccessResult(Result(value: nil, error: error))
                    }
                }
            }
        }
        else {
            self.delegate?.didReceiveUserAccessResult(Result(value: nil, error: HTTPError(type: .unauthorized)))
        }
    }
    
    
    @objc func didReceiveUserCode(_ notification: Notification) {
        if let code = notification.userInfo?["code"] as? String {
            authMC.getUserAccessToken(region: .us, clientID: clientID, clientSecret: clientSecret, code: code, redirectURL: "https://oauth.click/BattleNetAPI/") { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let access):
                        self.delegate?.didReceiveUserAccessResult(Result(value: access.token, error: nil))
                        self.userAccessToken = access.token
                    case .failure(let error):
                        self.delegate?.didReceiveUserAccessResult(Result(value: nil, error: error))
                    }
                }
            }
        }
        else {
            self.delegate?.didReceiveUserAccessResult(Result(value: nil, error: HTTPError(type: .unexpectedResponse)))
        }
    }
    
    
    
    // MARK: - Legacy
    
    func setupLegacyWebServices() {
        authMC.setApikeyLegacy(clientID)
        Debug.print("Ready for legacy web services")
    }
}
