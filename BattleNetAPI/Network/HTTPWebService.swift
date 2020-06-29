//
//  HTTPWebService.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}


public protocol HTTPWebService {
    var session: URLSession { get }
    var baseURL: String { get }
}


extension HTTPWebService {
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, method: method, headers: headers, body: body)
            // Make the request
            session.startData(request) { result in
                completion(result)
            }
        }
        catch let error {
            completion(.failure(HTTPError.other(error)))
        }
    }
}



extension HTTPWebService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func call<Value>(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, method: method, headers: headers, body: body)
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}
