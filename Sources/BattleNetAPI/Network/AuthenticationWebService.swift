//
//  AuthenticationWebService.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 7/6/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


/// A protocol that identifies a WebService consisting of endpoints that retrieve access tokens
protocol AuthenticationWebService: WebService {
    var credentials: BattleNetCredentials { get set }
    var authDelegate: BattleNetAuthDelegate? { get set }
    
    func getClientAccessToken(completion: @escaping (_ result: Result<String, Error>) -> Void)
    func getClientAccessToken() async throws -> String
    func getUserAccessToken(completion: @escaping (_ result: Result<String, Error>) -> Void)
    func getUserAccessToken() async throws -> String
}



extension AuthenticationWebService {
    /// Adds the required authorization header to a web service request based on APIType.
    /// If the authorization token isn't found, it will request the token from the AuthenticationWebService.
    func addAuthentication(to request: URLRequest, for apiType: APIType, completion: @escaping (_ result: Result<URLRequest, Error>) -> Void) {
        var request = request
        
        func setToken(from result: Result<String, Error>) {
            switch result {
            case .success(let token):
                self.saveToken(token, for: apiType)
                request.addHeader(.authorization(.bearer(token)))
                completion(.success(request))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        switch apiType {
        case .profile, .community:
            if let token = credentials.userAccessToken {
                request.addHeader(.authorization(.bearer(token)))
                completion(.success(request))
            }
            else {
                self.getUserAccessToken { result in
                    setToken(from: result)
                }
            }
        case .gameData:
            if let token = credentials.clientAccessToken {
                request.addHeader(.authorization(.bearer(token)))
                completion(.success(request))
            }
            else {
                self.getClientAccessToken { result in
                    setToken(from: result)
                }
            }
        }
    }
    
    
    /// Adds the required authorization header to a web service request based on APIType.
    /// If the authorization token isn't found, it will request the token from the AuthenticationWebService.
    func addAuthentication(to request: URLRequest, for apiType: APIType) async throws -> URLRequest {
        var request = request
        var token: String
        
        switch apiType {
        case .profile, .community:
            if let userAccessToken = credentials.userAccessToken {
                token = userAccessToken
            }
            else {
                token = try await getUserAccessToken()
                self.saveToken(token, for: apiType)
            }
        case .gameData:
            if let clientAccessToken = credentials.clientAccessToken {
                token = clientAccessToken
            }
            else {
                token = try await getClientAccessToken()
                self.saveToken(token, for: apiType)
            }
        }
        
        request.addHeader(.authorization(.bearer(token)))
        return request
    }
    
    
    /// Calls the web service request after adding the appropriate authentication headers
    func performAuthenticatedRequest(_ request: URLRequest, for apiType: APIType, numberOfRetryAttempts: Int = 1, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        addAuthentication(to: request, for: apiType) { result in
            switch result {
            case .success(let request):
                self.session.startData(request) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        if (error as? HTTPError) == .unauthorized, numberOfRetryAttempts > 0 {
                            self.invalidateToken(for: apiType)
                            self.performAuthenticatedRequest(request, for: apiType, numberOfRetryAttempts: numberOfRetryAttempts - 1, completion: completion)
                        } else {
                            completion(.failure(error))
                        }
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    /// Calls the web service request after adding the appropriate authentication headers
    func performAuthenticatedRequest(_ request: URLRequest, for apiType: APIType, numberOfRetryAttempts: Int = 1) async throws -> Data {
        let request = try await addAuthentication(to: request, for: apiType)
        
        do {
            return try await session.startData(request)
        }
        catch {
            if (error as? HTTPError) == .unauthorized, numberOfRetryAttempts > 0 {
                invalidateToken(for: apiType)
                return try await performAuthenticatedRequest(request, for: apiType, numberOfRetryAttempts: numberOfRetryAttempts - 1)
            } else {
                throw error
            }
        }
    }
    
    
    func invalidateToken(for apiType: APIType) {
        if apiType == .profile || apiType == .community {
            credentials.userAccessToken = nil
            authDelegate?.battleNetAPI(didChangeUserAccessToken: nil)
        }
        else if apiType == .gameData {
            credentials.clientAccessToken = nil
            authDelegate?.battleNetAPI(didChangeClientAccessToken: nil)
        }
    }
    
    
    func saveToken(_ token: String, for apiType: APIType) {
        if apiType == .profile || apiType == .community {
            credentials.userAccessToken = token
            authDelegate?.battleNetAPI(didChangeUserAccessToken: token)
        }
        else if apiType == .gameData {
            credentials.clientAccessToken = token
            authDelegate?.battleNetAPI(didChangeClientAccessToken: token)
        }
    }
}
