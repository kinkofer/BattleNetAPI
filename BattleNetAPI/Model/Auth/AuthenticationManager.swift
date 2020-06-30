//
//  AuthenticationManager.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation
import AuthenticationServices


public class AuthenticationManager {
    public let authMC = AuthenticationModelController.shared
    
    /// The clientID is a unique token provided by the Blizzard Battle.net Developer Portal
    public let clientID = AuthToken.clientID
    /// The clientSecret is a unique token provided by the Blizzard Battle.net Developer Portal
    public let clientSecret = AuthToken.clientSecret
    
    /// The clientAccessToken is required for your app to make API calls. It is retrieved from a service that only requires your clientToken and clientSecret.
    public var clientAccessToken: String?
    /// The userAccessToken is used to make API calls that require the user's permission. It is retrieved from a redirect after the user enters their credentials.
    public var userAccessToken: String?
    
    private var webAuthSession: ASWebAuthenticationSession?
    
    
    
    // MARK: - Init
    
    public init() {
        // TODO: retrieve access tokens from keychain
        clientAccessToken = AuthToken.clientAccessToken
        userAccessToken = AuthToken.userAccessToken
    }
    
    
    
    // MARK: -
    
    public func getClientAccessToken(completion: @escaping (_ result: Result<String, HTTPError>) -> Void) {
        if let accessToken = clientAccessToken {
            authMC.validateClientAccessToken(accessToken) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        completion(.success(accessToken))
                    case .failure(let error):
                        self.clientAccessToken = nil
                        completion(.failure(error))
                    }
                }
            }
        }
        else {
            authMC.getClientAccessToken(clientID: clientID, clientSecret: clientSecret) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let access):
                        // TODO: Save to keychain if new
                        self.clientAccessToken = access.token
                        completion(.success(access.token))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    
    public func getUserAccessToken(scope: Scope, on providerContext: ASWebAuthenticationPresentationContextProviding, completion: @escaping (_ result: Result<String, HTTPError>) -> Void) {
        if let userAccessToken = userAccessToken {
            authMC.validateUserAccessToken(userAccessToken) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(_):
                        completion(.success(userAccessToken))
                    case .failure(let error):
                        self.userAccessToken = nil
                        completion(.failure(error))
                    }
                }
            }
        }
        else {
            authenicateUser(scope: scope, on: providerContext, completion: completion)
        }
    }
    
    
    /**
     Opens the sign in page for BattleNet to allow the user to authenticate.
     
     - parameter scope: The games you are requesting the user to give you access to.
     - parameter providerContext: The view where the sign in page will be presented
     - parameter completion: The result of the user's sign in attempt, containing the user's access token if they successfully authenticated.
     */
    private func authenicateUser(scope: Scope, on providerContext: ASWebAuthenticationPresentationContextProviding, completion: @escaping (_ result: Result<String, HTTPError>) -> Void) {
        let redirectUrlStr = "https://oauth.click/BattleNetAPI/"
        guard let url = authMC.getOAuthURL(region: Current.region, clientID: clientID, scope: scope, redirectURL: redirectUrlStr) else {
            return
        }
        
        webAuthSession = ASWebAuthenticationSession(url: url, callbackURLScheme: "BattleNetAPI://") { callback, error in
            guard error == nil,
                let callbackUrl = callback else {
                    return
            }
            
            guard let code = callbackUrl.queryParameters?.first(where: { $0.name == "code" })?.value,
                let state = UserDefaults.standard.string(forKey: "state"),
                let callbackState = callbackUrl.queryParameters?.first(where: { $0.name == "state" })?.value,
                state == callbackState else {
                    completion(.failure(HTTPError.unexpectedResponse))
                    return
            }
            
            self.authMC.getUserAccessToken(region: Current.region, clientID: self.clientID, clientSecret: self.clientSecret, code: code, redirectURL: redirectUrlStr) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let access):
                        self.userAccessToken = access.token
                        // TODO: Save to keychain if new
                        completion(.success(access.token))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
        }
        
        webAuthSession?.presentationContextProvider = providerContext
        webAuthSession?.start()
    }
}
