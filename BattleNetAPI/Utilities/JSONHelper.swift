//
//  JSONHelper.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public protocol SelfDecodable: Decodable {
    static var decoder: JSONDecoder { get }
}


extension Data {
    func jsonPrettyPrinted() throws -> String? {
        let json = try JSONSerialization.jsonObject(with: self, options: [])
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        return String(data: jsonData, encoding: .utf8)
    }
}



extension Decodable {
    public static func decode(from data: Data) throws -> Self {
        if let selfDecoding = self as? SelfDecodable.Type {
            return try selfDecoding.decoder.decode(self, from: data)
        }
        else {
            return try JSONDecoder().decode(self, from: data)
        }
    }
}



extension Array where Element: Decodable {
    public static func decode(from data: Data) throws -> Array {
        if let selfDecoding = Element.self as? SelfDecodable.Type {
            return try selfDecoding.decoder.decode(self, from: data)
        }
        else {
            return try JSONDecoder().decode(self, from: data)
        }
    }
}
