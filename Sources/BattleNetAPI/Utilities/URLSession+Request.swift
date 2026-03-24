//
//  URLSession+Request.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


extension URLSession {
    /**
     Starts the URLRequest and returns the response from the server or an error.
     
     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error
     
        `result`: Success returns the resulting Data, or Failure returns an error. The error is nil unless:
         - the URLSession fails
         - the web service returns an error status code
         - Error with type httpError
     */
    func startData(_ request: URLRequest, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.dataTask(with: request) { data, response, error in
            do {
                if let error { throw error }
                completion(.success(try self.handleResponse(response, data: data)))
            }
            catch {
                if let nsError = error as NSError?,
                   nsError.code == HTTPError.noNetwork.code {
                    completion(.failure(HTTPError.noNetwork))
                }
                else if let nsError = error as NSError?,
                        nsError.code == HTTPError.timeout.code {
                    completion(.failure(HTTPError.timeout))
                }
                else if let httpError = error as? HTTPError {
                    completion(.failure(httpError))
                }
                else {
                    completion(.failure(HTTPError.other(error)))
                }
            }
        }.resume()
    }
    
    
    /**
     Starts the URLRequest and returns the response from the server or an error.
     
     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error
     
        `result`: Success returns the resulting Data, or Failure returns an error. The error is nil unless:
         - the URLSession fails
         - the web service returns an error status code
         - Error with type httpError
     */
    func startData(_ request: URLRequest) async throws -> Data {
        do {
            let (data, response) = try await data(for: request)
            return try handleResponse(response, data: data)
        }
        catch {
            if let nsError = error as NSError?,
               nsError.code == HTTPError.noNetwork.code {
                throw HTTPError.noNetwork
            }
            else if let nsError = error as NSError?,
                    nsError.code == HTTPError.timeout.code {
                throw HTTPError.timeout
            }
            else if let httpError = error as? HTTPError {
                throw httpError
            }
            else {
                throw HTTPError.other(error)
            }
        }
    }
    
    
    func handleResponse(_ response: URLResponse?, data: Data?) throws -> Data {
        guard let response = response as? HTTPURLResponse else { throw HTTPError.httpError }
        
        let status = HTTPStatus(code: response.statusCode)
        
        if status == .unauthorized {
            throw HTTPError.unauthorized
        }
        else if status.category == .success, let data {
            return data
        }
        else {
            throw HTTPError.serverResponse(response, data)
        }
    }
}
