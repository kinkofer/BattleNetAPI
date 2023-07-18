//
//  WebService.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}


/// A protocol for a class that calls web services
protocol WebService {
    var region: APIRegion { get }
    var locale: APILocale? { get }
    var session: URLSession { get }
    /// The base url of the web service to call
    var baseURL: URL? { get }
    
    var authenticationService: AuthenticationWebService? { get }
}


extension WebService {
    /// Property to contain web service functions that return decoded objects
    var decoded: Decoded<Self> { Decoded(self) }
}

/// Struct used to hold a reference to a WebService so that methods within the Decoded extension can reference its webService
public struct Decoded<WebService> {
    public let webService: WebService
    
    public init(_ webService: WebService) {
        self.webService = webService
    }
}




extension WebService {
    /// Makes a call using only the function paramaters to create the request.
    func call(url: URL, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        session.startData(request) { result in
            completion(result)
        }
    }
    
    
    /// Makes a call using only the function paramaters to create the request.
    func call(url: URL, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> Data {
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        return try await session.startData(request)
    }
}


extension WebService {
    /// Makes a web service call, configured for the endpoint
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: endpoint, namespace: nil, method: method, headers: headers, body: body, completion: completion)
    }
    
    
    /// Makes a web service call, configured for the endpoint
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> Data {
        return try await call(endpoint: endpoint, namespace: nil, method: method, headers: headers, body: body)
    }
    
    
    /// Makes a web service call, configured for the endpoint
    func call(endpoint: APICall, namespace: APINamespace? = nil, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        let basePath = endpoint.basePath ?? ""
        guard var url = baseURL?.appendingPathComponent(basePath + endpoint.path) else {
            return completion(.failure(HTTPError.invalidRequest))
        }
        
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        if let queries = endpoint.queries {
            url.appendQuery(parameters: queries)
        }
        
        var headers = headers
        if let namespace = namespace {
            if headers == nil { headers = [HTTPHeader]() }
            headers?.append(namespace.getHeader(for: region))
        }
        
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        // Make the request
        if let authenticationService = authenticationService,
            let apiType = endpoint.apiType {
            authenticationService.performAuthenticatedRequest(request, for: apiType, completion: completion)
        }
        else {
            session.startData(request) { result in
                completion(result)
            }
        }
    }
    
    
    /// Makes a web service call, configured for the endpoint
    func call(endpoint: APICall, namespace: APINamespace? = nil, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> Data {
        let basePath = endpoint.basePath ?? ""
        guard var url = baseURL?.appendingPathComponent(basePath + endpoint.path) else {
            throw HTTPError.invalidRequest
        }
        
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        if let queries = endpoint.queries {
            url.appendQuery(parameters: queries)
        }
        
        var headers = headers
        if let namespace = namespace {
            if headers == nil { headers = [HTTPHeader]() }
            headers?.append(namespace.getHeader(for: region))
        }
        
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        // Make the request
        if let authenticationService = authenticationService,
            let apiType = endpoint.apiType {
            return try await authenticationService.performAuthenticatedRequest(request, for: apiType)
        }
        else {
            return try await session.startData(request)
        }
    }
    
    
    /// Makes a web service call using the full url provided with authentication from the `APIType`
    func callResource(url: String, apiType: APIType, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard var url = URL(string: url) else {
            return completion(.failure(HTTPError.invalidRequest))
        }
        
        // Append locale to url because it will not be added automatically
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        // Make the request
        if let authenticationService = authenticationService {
            authenticationService.performAuthenticatedRequest(request, for: apiType, completion: completion)
        }
        else {
            session.startData(request) { result in
                completion(result)
            }
        }
    }
    
    
    /// Makes a web service call using the full url provided with authentication from the `APIType`
    func callResource(url: String, apiType: APIType, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> Data {
        guard var url = URL(string: url) else { throw HTTPError.invalidRequest }
        
        // Append locale to url because it will not be added automatically
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        // Make the request
        if let authenticationService = authenticationService {
            return try await authenticationService.performAuthenticatedRequest(request, for: apiType)
        }
        else {
            return try await session.startData(request)
        }
    }
}
