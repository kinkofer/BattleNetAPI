//
//  APICall.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol APICall {
    var path: String { get }
}


extension APICall {
    func createUrl(baseURL: String) -> URL? {
        return URL(string: baseURL + path)
    }
    
    
    
    func createUrlRequest(baseURL: String, method: HTTPMethod, headers: [HTTPHeader]? = nil, body: Data? = nil) throws -> URLRequest {
        guard let url = createUrl(baseURL: baseURL) else {
            throw HTTPError.invalidRequest
        }
        
        return createUrlRequest(url: url, method: method, headers: headers, body: body)
    }
    
    
    private func createUrlRequest(url: URL, method: HTTPMethod, headers: [HTTPHeader]? = nil, body: Data? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            request.addHeaders(headers)
        }
        request.httpBody = body
        return request
    }
}
