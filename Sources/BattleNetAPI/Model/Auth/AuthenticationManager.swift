//
//  AuthenticationManager.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation
import AuthenticationServices


/// A manager for getting the `clientAccessToken` and `userAccessToken` required for calling web services in the BattleNet API.
public class AuthenticationManager: OAuthAuthenticator {
    let battleNetAPI: BattleNetAPI
    
    let oauth: BattleNetOAuth
    let providerContext: ASWebAuthenticationPresentationContextProviding
    
    private let authRepo: AuthenticationRepository
    private var webAuthSession: ASWebAuthenticationSession?
    
    
    
    // MARK: - Init
    
    public init(battleNetAPI: BattleNetAPI, oauth: BattleNetOAuth, providerContext: ASWebAuthenticationPresentationContextProviding) {
        self.battleNetAPI = battleNetAPI
        self.oauth = oauth
        self.providerContext = providerContext
        authRepo = AuthenticationRepository(battleNetAPI: battleNetAPI)
        battleNetAPI.authentication.oauthAuthenticator = self
    }
    
    
    
    // MARK: -
    
    /// Returns the `clientAccessToken` if previously stored and valid, or gets a new `clientAccessToken`. A valid token will be saved to the BattleNetAPI credentials.
    public func getClientAccessToken(completion: @escaping (_ result: Result<String, Error>) -> Void) {
        if let accessToken = battleNetAPI.credentials.clientAccessToken {
            authRepo.validateClientAccessToken(accessToken) { result in
                switch result {
                case .success:
                    // If the result was a success, send back the valid accessToken
                    completion(.success(accessToken))
                case .failure(let error):
                    self.battleNetAPI.credentials.clientAccessToken = nil
                    completion(.failure(error))
                }
            }
        }
        else {
            authRepo.getClientAccessToken(clientID: battleNetAPI.credentials.clientID, clientSecret: battleNetAPI.credentials.clientSecret) { result in
                switch result {
                case .success(let access):
                    self.battleNetAPI.credentials.clientAccessToken = access.token
                    completion(.success(access.token))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    /// Returns the `clientAccessToken` if previously stored and valid, or gets a new `clientAccessToken`. A valid token will be saved to the BattleNetAPI credentials.
    public func getClientAccessToken() async throws -> String {
        if let accessToken = battleNetAPI.credentials.clientAccessToken {
            do {
                let _ = try await authRepo.validateClientAccessToken(accessToken)
                return accessToken
            }
            catch {
                self.battleNetAPI.credentials.clientAccessToken = nil
                throw error
            }
        }
        else {
            let access = try await authRepo.getClientAccessToken(clientID: battleNetAPI.credentials.clientID, clientSecret: battleNetAPI.credentials.clientSecret)
            self.battleNetAPI.credentials.clientAccessToken = access.token
            return access.token
        }
    }
    
    
    /**
     Retrieves the `userAccessToken` if previously stored and valid, or prompts the user to authenicate with BattleNet to get a new `userAccessToken`.
     A valid token will be saved to the BattleNetAPI credentials.
     
     - parameter completion: The result of the user's sign in attempt, containing the user's access token if they successfully authenticated.
     */
    public func getUserAccessToken(completion: @escaping (_ result: Result<String, Error>) -> Void) {
        if let userAccessToken = battleNetAPI.credentials.userAccessToken {
            authRepo.validateUserAccessToken(userAccessToken) { result in
                switch result {
                case .success:
                    // If the result was a success, send back the valid accessToken
                    completion(.success(userAccessToken))
                case .failure:
                    self.battleNetAPI.credentials.userAccessToken = nil
                    self.authenicateUser(scope: self.oauth.scope, on: self.providerContext, scheme: self.oauth.scheme, redirectUrl: self.oauth.redirectUrl, completion: completion)
                }
            }
        }
        else {
            authenicateUser(scope: oauth.scope, on: providerContext, scheme: oauth.scheme, redirectUrl: oauth.redirectUrl, completion: completion)
        }
    }
    
    
    /**
     Retrieves the `userAccessToken` if previously stored and valid, or prompts the user to authenicate with BattleNet to get a new `userAccessToken`.
     A valid token will be saved to the BattleNetAPI credentials.
     */
    public func getUserAccessToken() async throws -> String {
        if let userAccessToken = battleNetAPI.credentials.userAccessToken {
            do {
                let _ = try await authRepo.validateUserAccessToken(userAccessToken)
                return userAccessToken
            }
            catch {
                self.battleNetAPI.credentials.userAccessToken = nil
                return try await authenicateUser(scope: self.oauth.scope, on: self.providerContext, scheme: self.oauth.scheme, redirectUrl: self.oauth.redirectUrl)
            }
        }
        else {
            return try await authenicateUser(scope: oauth.scope, on: providerContext, scheme: oauth.scheme, redirectUrl: oauth.redirectUrl)
        }
    }
    
    
    /**
     Opens the sign in page for BattleNet to allow the user to authenticate. A valid token will be saved to the BattleNetAPI credentials.
     
     - parameter scope: The games you are requesting the user to give you access to.
     - parameter providerContext: The view where the sign in page will be presented
     - parameter scheme: The custom URL scheme that the app expects in the callback URL.
     - parameter redirectUrl: A URL with the http or https scheme pointing to the authentication webpage.
     - parameter completion: The result of the user's sign in attempt, containing the user's access token if they successfully authenticated.
     */
    private func authenicateUser(scope: Scope, on providerContext: ASWebAuthenticationPresentationContextProviding,
                                 scheme: String, redirectUrl: String, completion: @escaping (_ result: Result<String, Error>) -> Void) {
        /// A randomly-generated string used to validate that the auth request made is the same as the auth response (after redirect)
        let state = "BattleNetAPI\(Int(Date().timeIntervalSince1970))"
        let stateKey = "com.battleNetAPI.state"
        UserDefaults.standard.set(state, forKey: stateKey)
        
        guard let redirectURL = URL(string: redirectUrl),
            let url = authRepo.getOAuthURL(scope: scope, redirectURL: redirectURL, state: state) else {
                completion(.failure(HTTPError.invalidRequest))
                return
        }
        
        DispatchQueue.main.async {
            self.webAuthSession = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme) { callback, error in
                guard error == nil,
                      let callbackUrl = callback else {
                    completion(.failure(HTTPError.unexpectedResponse))
                    return
                }
                
                guard let code = callbackUrl.queryParameters?.first(where: { $0.name == "code" })?.value,
                      let state = UserDefaults.standard.string(forKey: stateKey),
                      let callbackState = callbackUrl.queryParameters?.first(where: { $0.name == "state" })?.value,
                      state == callbackState else {
                    completion(.failure(HTTPError.unexpectedResponse))
                    return
                }
                
                self.authRepo.getUserAccessToken(clientID: self.battleNetAPI.credentials.clientID, clientSecret: self.battleNetAPI.credentials.clientSecret,
                                                 code: code, redirectURL: redirectUrl) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let access):
                            self.battleNetAPI.credentials.userAccessToken = access.token
                            completion(.success(access.token))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                }
            }
            
            self.webAuthSession?.presentationContextProvider = providerContext
            self.webAuthSession?.start()
        }
    }
    
    
    /**
     Opens the sign in page for BattleNet to allow the user to authenticate. A valid token will be saved to the BattleNetAPI credentials.
     
     - parameter scope: The games you are requesting the user to give you access to.
     - parameter providerContext: The view where the sign in page will be presented
     - parameter scheme: The custom URL scheme that the app expects in the callback URL.
     - parameter redirectUrl: A URL with the http or https scheme pointing to the authentication webpage.
     - returns: The user's access token if they successfully authenticated.
     */
    private func authenicateUser(scope: Scope, on providerContext: ASWebAuthenticationPresentationContextProviding,
                                 scheme: String, redirectUrl: String) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            authenicateUser(scope: scope, on: providerContext, scheme: scheme, redirectUrl: redirectUrl) { result in
                continuation.resume(with: result)
            }
        }
    }
}
