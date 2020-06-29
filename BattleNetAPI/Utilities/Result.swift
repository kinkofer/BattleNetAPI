//
//  Result+.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/15/19.
//  Copyright © 2019 Prismatic Games. All rights reserved.
//

import UIKit


extension Result {
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}



extension Result where Failure == HTTPError {
    /// Returns the success value in a closure or logs the error
    /// - parameter presentErrorOn: If a viewController is passed in it will present the default HTTPError alert controller, otherwise it will log the error messsage in the console
    /// - parameter successHandler: The closure contains the success value
    public func getSuccessValue(presentErrorOn viewController: UIViewController? = nil, file: String = #file, function: String = #function, line: Int = #line, successHandler: @escaping (Success) -> Void) {
        do {
            successHandler(try get())
        }
        catch let error as HTTPError {
            if let viewController = viewController {
                DispatchQueue.main.async {
                    viewController.present(error.alert, animated: true)
                }
            }
            else {
                Debug.print(error.localizedDescription, file: file, function: function, line: line)
            }
        }
        catch { }
    }
}



extension Result where Success == Bool, Failure == HTTPError {
    public init(success: Success) {
        if success {
            self = .success(true)
        }
        else {
            self = .failure(HTTPError.httpError)
        }
    }
}



extension Result where Success == Data, Failure == HTTPError {
    /**
     Decode a successful Result to a class specified in your completion. Will return an HTTPError.jsonParsingError if decoding fails, or the original error if the Result was a failure.
     
     - parameter customDecode: Implement a customDecode method to return the desired Decodable object if it's nested in the data or needs to be configured
     - parameter completion: Called when decoding is complete, or when errors are encountered
     */
    public func decode<U: Decodable>(customDecode: ((_ data: Data) throws -> U)? = nil, completion: @escaping (_ result: Result<U, HTTPError>) -> Void) {
        switch self {
        case .success(let data):
            do {
                let decoded = try customDecode?(data) ?? U.decode(from: data)
                completion(.success(decoded))
            }
            catch {
                completion(.failure(HTTPError.jsonParsingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    
    /**
     Deserialize a successful Result to a data type specified in your completion. Will return an HTTPError.jsonParsingError if deserializing fails, .unexpectedResponse if the data type does not match, or the original error if the Result was a failure.
     
     - parameter completion: Called when deserializing is complete, or when errors are encountered
     */
    public func jsonDeserialize<U>(completion: @escaping (_ result: Result<U, HTTPError>) -> Void) {
        switch self {
        case .success(let data):
            do {
                if let decoded = try JSONSerialization.jsonObject(with: data, options: [.allowFragments, .mutableContainers]) as? U {
                    completion(.success(decoded))
                }
                else {
                    completion(.failure(HTTPError.unexpectedResponse))
                }
            }
            catch {
                completion(.failure(HTTPError.jsonParsingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}



// MARK: - CustomDebugStringConvertible

extension Result: CustomDebugStringConvertible {
    /// The debug textual representation used when written to an output stream, which includes whether the result was a
    /// success or failure in addition to the value or error.
    public var debugDescription: String {
        switch self {
        case .success(let value):
            return "Success: \(value)"
        case .failure(let error):
            return "Failure: \(error)"
        }
    }
}
