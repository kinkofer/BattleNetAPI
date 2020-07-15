//
//  Authentication.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class WS_Authentication: AuthenticationWebService {
    public enum API: APICall {
        case clientAccess
        case validateClientAccess
        case userAccess
        case validateUserAccess
        
        var path: String {
            return ""
        }
        
        var apiType: APIType? {
            return nil
        }
        
        // The Authentication services have unique URLs
        var basePath: String? { return nil }
    }
    
    
    private let network = Network.shared
    
    var region: APIRegion
    var locale: APILocale?
    
    var session: URLSession
    
    // The Authentication services have unique baseURLs
    var baseURL: URL? { return nil }
    
    // The Authenication services configure their own authenication
    var authenticationService: AuthenticationWebService? { return nil }
    weak var oauthAuthenticator: OAuthAuthenticator?
    
    var credentials: BattleNetCredentials
    
    
    
    init(region: APIRegion, locale: APILocale, session: URLSession, credentials: BattleNetCredentials) {
        self.region = region
        self.locale = locale
        self.session = session
        self.credentials = credentials
    }
    
    
    
    // MARK: - Client Access
    
    /**
     Returns the access dictionary configured for the your application
     
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     - note: This access token will not return specific user information. If that is needed, you must receive a user access token through OAuth
     */
    public func getClientAccess(completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard let encryptedCredientials = credentials.encryptedCredentials,
            let url = URL(string: region.tokenURI) else {
                completion(.failure(HTTPError.invalidRequest))
                return
        }
        
        guard let body = "grant_type=client_credentials".data(using: .utf8) else {
            completion(.failure(HTTPError.unexpectedBody))
            return
        }
        
        call(url: url, method: .post, headers: [.contentType([.form]), .authorization(.basic(encryptedCredientials))], body: body) { result in
            completion(result)
        }
    }
    
    
    /**
     Checks if the client token is valid to be used with web service calls
     
     - parameter token: The client token saved in the app
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func validateClientAccessToken(_ token: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard !token.isEmpty,
            let url = URL(string: "\(region.oauthURI)/check_token?token=\(token)") else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        call(url: url, method: .post) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - User Access
    
    /**
     Constructs the url that can be used to send the user to the OAuth webpage.
     
     - parameter scope: The scope of information you're requesting from the user
     - parameter redirectURL: The redirect url that will be opened after the user has authenticated and will contain the code parameter
     - parameter state: A string used to validate that the auth request made is the same as the auth response (after redirect)
     - returns: Example URL: https://us.battle.net/oauth/authorize?client_id=x68y75qh6dpzpsthczrdjv9ck57xapms&scope=wow.profile&state=BattleNetAPI1523122301&redirect_url=https://oauth.click/BattleNetAPI/&response_type=code
     - important: Blizzard does not allow redirects to app scheme urls. You would be required to receive the redirect on a server, then could open your app from there. Your app must be configured with a URLScheme before it can be opened by a url
     - note: For testing purposes, unsecure redirects can use https://oauth.click, and they also provide their redirect config for use on private, secure servers
     */
    internal func getOAuthURL(scope: Scope, redirectURL: URL, state: String) -> URL? {
        guard let baseURL = URL(string: region.oauthURI) else { return nil }
        var url = baseURL.appendingPathComponent("/authorize")
        url.appendQuery(parameters: ["client_id": credentials.clientID,
                                      "scope": scope.scopeValue,
                                      "state": state,
                                      "redirect_uri": redirectURL.absoluteString,
                                      "response_type": "code"])
        return url
    }
    
    
    /**
     Returns the access dictionary configured for the user that logged in through OAuth
     
     - parameter code: The code returned to the app when the user logs in through OAuth
     - parameter redirectURL: The url provided to the OAuth
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
    */
    public func getUserAccess(code: String, redirectURL: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard let encryptedCredientials = credentials.encryptedCredentials,
            let url = URL(string: region.tokenURI) else {
                completion(.failure(HTTPError.invalidRequest))
                return
        }
        
        let parameters = String(format: "grant_type=authorization_code&code=%@&redirect_uri=%@", code, redirectURL)
        let body = parameters.data(using: .utf8)
        
        call(url: url, method: .post, headers: [.contentType([.form]), .authorization(.basic(encryptedCredientials))], body: body) { result in
            completion(result)
        }
    }
    
    
    /**
     Checks if the user access token is valid to be used with profile web service calls
     
     - parameter token: The client token saved in the app
     - parameter completion: Returns a Result with the Data if `success` or an HTTPError if `failure`
     */
    public func validateUserAccessToken(_ token: String, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard let url = URL(string: "\(region.checkTokenURI)?token=\(token)") else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        call(url: url, method: .post) { result in
            completion(result)
        }
    }
    
    
    
    // MARK: - AuthenticationWebService
    
    internal func getClientAccessToken(completion: @escaping (Result<String, Error>) -> Void) {
        getClientAccess { result in
            completion(Result { (try Access.decode(from: try result.get() )).token })
        }
    }
    
    
    internal func getUserAccessToken(completion: @escaping (Result<String, Error>) -> Void) {
        oauthAuthenticator?.getUserAccessToken(completion: completion)
    }
}
