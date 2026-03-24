//
//  JSONHelper.swift
//  BattleNetAPI-Example
//
//  Created by Christopher Jennewein on 2/11/21.
//

import Foundation


extension Data {
    func jsonPrettyPrinted() throws -> String? {
        let json = try JSONSerialization.jsonObject(with: self, options: [.allowFragments])
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted, .withoutEscapingSlashes])
        return String(data: jsonData, encoding: .utf8)
    }
}
