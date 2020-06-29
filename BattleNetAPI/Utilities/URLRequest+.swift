//
//  URLRequest+.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


extension URLRequest {
    public mutating func addHeaders(_ headers: [String: String?]) {
        for (key, value) in headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    public mutating func addHeader(_ header: HTTPHeader) {
        self.addHeaders([header.key: header.value])
    }
    
    public mutating func addHeaders(_ headers: [HTTPHeader]) {
        let headersDict = Dictionary(headers.map { ($0.key, $0.value) }) { _, last in last }
        self.addHeaders(headersDict)
    }
}
