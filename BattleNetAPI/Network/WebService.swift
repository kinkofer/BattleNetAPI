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
    
    /// Web service urls must include certain parameters, like namespace
    func appendSharedURLParameters(to urlStr: String, withNamespace namespace: String) -> String
    /// Starts a web service request
    func callWebService(urlStr: String, method: HTTPMethod, apiType: APIType?, body: Data?, headers: [HTTPHeader]?, completion: @escaping (_ result: Result<Data, Error>) -> Void)
}


extension WebService {
    /// Makes a call using only the function paramaters to create the request.
    func call(url: URL, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        
        session.startData(request) { result in
            completion(result)
        }
    }
}


extension WebService {
    /// Makes a web service call, configured for the endpoint
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        call(endpoint: endpoint, namespace: nil, method: method, headers: headers, body: body, completion: completion)
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
}



extension WebService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func call<Value>(endpoint: APICall, namespace: APINamespace? = nil, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) -> AnyPublisher<Value, Error> where Value: Decodable {
        let basePath = endpoint.basePath ?? ""
        guard var url = baseURL?.appendingPathComponent(basePath + endpoint.path) else {
            return Fail(error: HTTPError.invalidRequest).eraseToAnyPublisher()
        }
        
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        var headers = headers
        if let namespace = namespace {
            headers?.append(namespace.getHeader(for: region))
        }
        
        let request = URLRequest(url: url, method: method, headers: headers, body: body)
        // TODO: Add authenticated request publisher
        return session
            .dataTaskPublisher(for: request)
            .requestJSON()
    }
}




/// TODO: Remove these functions after WS functions use call()
extension WebService {
    /**
     Adds the optional locale and namespace parameters to the url string
     
     - parameter urlStr: The url string, typically without any query parameters
     - parameter namespace: The namespace, excluding the regional indentifier (ex. `"-us"`)
     - parameter region: The user's region
     - parameter locale: Ther user's locale
    */
    func appendSharedURLParameters(to urlStr: String, withNamespace namespace: String = "dynamic") -> String {
        guard var url = URL(string: urlStr) else {
            fatalError("The web service URL is invalid")
        }
        
        if let locale = locale {
            url.appendQuery(parameters: ["locale": locale.rawValue])
        }
        
        url.appendQuery(parameters: ["namespace": namespace + region.namespaceExtension])
        
        return url.absoluteString
    }
    
    
    /**
     Configures and calls a web service and returns the response or an error through the completion
     
     - parameter url: The web service url
     - parameter method: The HTTP method
     - parameter apiType: The APIType used to configure Authorization
     - parameter body: The body to be sent with the call
     - parameter headers: Configures the HTTP request with the included headers. By default, the Accept and Content-Type headers are configured with json
     - parameter completion: Returns the web service response and error
     */
    func callWebService(urlStr: String, method: HTTPMethod, apiType: APIType? = nil, body: Data? = nil, headers: [HTTPHeader]? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        // Construct the default request
        if var request = Network.shared.createRequest(with: url, method: method, apiType: apiType) {
            // Add (or overwrite default) headers
            if let headers = headers {
                request.addHeaders(headers)
            }
            
            // Add optional body
            request.httpBody = body
            
            // Make the request
            Network.shared.start(request) { result in
                completion(result)
            }
        }
        else {
            completion(.failure(HTTPError.unauthorized))
        }
    }
}
