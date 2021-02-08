//
//  HTTPHeader.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public enum HTTPHeader {
    case accept(MediaType)
    case acceptVersion(String)
    case authorization(AuthorizationType)
    case contentType(MediaType)
    case ifModifiedSince(Date)
    case namespace(String)
    
    
    public var key: String {
        switch self {
        case .accept, .acceptVersion:
            return "Accept"
        case .authorization:
            return "Authorization"
        case .contentType:
            return "Content-Type"
        case .ifModifiedSince:
            return "If-Modified-Since"
        case .namespace:
            return "Battlenet-Namespace"
        }
    }
    
    public var value: String {
        switch self {
        case .accept(let mediaType):
            return mediaType.headerValue
        case .acceptVersion(let value):
            return value
        case .authorization(let authType):
            switch authType {
            case .basic(let encryptedCredentials):
                return "Basic \(encryptedCredentials)"
            case .bearer(let token):
                return "Bearer \(token)"
            }
        case .contentType(let mediaType):
            return mediaType.headerValue
        case .ifModifiedSince(let date):
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
            dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
            return dateFormatter.string(from: date)
        case .namespace(let namespace):
            return namespace
        }
    }
}



public struct MediaType: OptionSet {
    public let rawValue: Int
    
    public static let json = MediaType(rawValue: 1 << 0)
    public static let html = MediaType(rawValue: 1 << 1)
    public static let plainText = MediaType(rawValue: 1 << 2)
    public static let png = MediaType(rawValue: 1 << 3)
    public static let jpeg = MediaType(rawValue: 1 << 4)
    public static let form = MediaType(rawValue: 1 << 5)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    
    /// The format required for the HTTP header
    public var headerValue: String {
        var values = [String]()
        
        if self.contains(.json) {
            values.append("application/json")
        }
        
        if self.contains(.html) {
            values.append("text/html")
        }
        
        if self.contains(.plainText) {
            values.append("text/plain")
        }
        
        if self.contains(.png) {
            values.append("image/png")
        }
        
        if self.contains(.jpeg) {
            values.append("image/jpeg")
        }
        
        if self.contains(.form) {
            values.append("application/x-www-form-urlencoded")
        }
        
        return values.joined(separator: "; ")
    }
}



public enum AuthorizationType {
    case basic(String)
    case bearer(String)
}
