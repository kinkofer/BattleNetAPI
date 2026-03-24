//
//  AuthenticationManager.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation
import AuthenticationServices


public protocol BattleNetAuthDelegate: AnyObject {
    func battleNetAPI(didChangeClientAccessToken token: String?)
    func battleNetAPI(didChangeUserAccessToken token: String?)
}


/// A manager for getting the `clientAccessToken` and `userAccessToken` required for calling web services in the BattleNet API.
public class AuthenticationManager: OAuthAuthenticator {
    unowned let battleNetAPI: BattleNetAPI
    let oauth: BattleNetOAuth
    
    private var webAuthSession: ASWebAuthenticationSession?
    
    
    // MARK: - Init
    
    public init(battleNetAPI: BattleNetAPI, oauth: BattleNetOAuth) {
        self.battleNetAPI = battleNetAPI
        self.oauth = oauth
        battleNetAPI.authentication.oauthAuthenticator = self
    }
    
    
    
    // MARK: -
    
    /// Returns the `clientAccessToken` if previously stored and valid, or gets a new `clientAccessToken`. A valid token will be saved to the BattleNetAPI credentials.
    public func getClientAccessToken() async throws -> String {
        if let accessToken = battleNetAPI.credentials.clientAccessToken {
            do {
                let _ = try await battleNetAPI.authentication.decoded.validateClientAccessToken(accessToken)
                return accessToken
            }
            catch {
                self.battleNetAPI.credentials.clientAccessToken = nil
                self.battleNetAPI.delegate?.battleNetAPI(didChangeClientAccessToken: nil)
                throw error
            }
        }
        else {
            let access = try await battleNetAPI.authentication.decoded.getClientAccess()
            self.battleNetAPI.credentials.clientAccessToken = access.token
            self.battleNetAPI.delegate?.battleNetAPI(didChangeClientAccessToken: access.token)
            return access.token
        }
    }
    
    
    /**
     Retrieves the `userAccessToken` if previously stored and valid, or prompts the user to authenicate with BattleNet to get a new `userAccessToken`.
     A valid token will be saved to the BattleNetAPI credentials.
     */
    public func getUserAccessToken() async throws -> String {
        if let userAccessToken = battleNetAPI.credentials.userAccessToken {
            do {
                let _ = try await battleNetAPI.authentication.decoded.validateUserAccessToken(userAccessToken)
                return userAccessToken
            }
            catch {
                self.battleNetAPI.credentials.userAccessToken = nil
                self.battleNetAPI.delegate?.battleNetAPI(didChangeUserAccessToken: nil)
                return try await authenicateUser(scope: self.oauth.scope, on: self.oauth.providerContext, scheme: self.oauth.scheme, redirectUrl: self.oauth.redirectUrl)
            }
        }
        else {
            return try await authenicateUser(scope: oauth.scope, on: oauth.providerContext, scheme: oauth.scheme, redirectUrl: oauth.redirectUrl)
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
        let state = "BattleNetAPI\(Int(Date().timeIntervalSince1970))"
        let stateKey = "com.battleNetAPI.state"
        UserDefaults.standard.set(state, forKey: stateKey)
        
        guard let redirectURL = URL(string: redirectUrl),
            let url = battleNetAPI.authentication.getOAuthURL(scope: scope, redirectURL: redirectURL, state: state) else {
                throw HTTPError.invalidRequest
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            DispatchQueue.main.async {
                self.webAuthSession = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme) { callback, error in
                    guard error == nil,
                          let callbackUrl = callback else {
                        continuation.resume(throwing: HTTPError.unexpectedResponse)
                        return
                    }
                    
                    guard let code = callbackUrl.queryParameters?.first(where: { $0.name == "code" })?.value,
                          let state = UserDefaults.standard.string(forKey: stateKey),
                          let callbackState = callbackUrl.queryParameters?.first(where: { $0.name == "state" })?.value,
                          state == callbackState else {
                        continuation.resume(throwing: HTTPError.unexpectedResponse)
                        return
                    }
                    
                    Task {
                        do {
                            let access = try await self.battleNetAPI.authentication.decoded.getUserAccess(code: code, redirectURL: redirectUrl)
                            await MainActor.run {
                                self.battleNetAPI.credentials.userAccessToken = access.token
                                self.battleNetAPI.delegate?.battleNetAPI(didChangeUserAccessToken: access.token)
                            }
                            continuation.resume(returning: access.token)
                        } catch {
                            await MainActor.run {
                                self.battleNetAPI.credentials.userAccessToken = nil
                                self.battleNetAPI.delegate?.battleNetAPI(didChangeUserAccessToken: nil)
                            }
                            continuation.resume(throwing: error)
                        }
                    }
                }
                
                self.webAuthSession?.presentationContextProvider = providerContext
                self.webAuthSession?.start()
            }
        }
    }
}
