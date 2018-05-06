//
//  JSONHelper.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/8/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


extension Data {
    func jsonPrettyPrinted() throws -> String? {
        let json = try JSONSerialization.jsonObject(with: self, options: [])
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        return String(data: jsonData, encoding: .utf8)
    }
}



extension Decodable {
    static func decode(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: data)
    }
}



extension Array where Element: Decodable {
    static func decode(from data: Data) throws -> [Element] {
        return try JSONDecoder().decode([Element].self, from: data)
    }
}
