//
//  APICall.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 6/28/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


/// An API endpoint
protocol APICall {
    /// The basePath, often determined by the APIType
    var basePath: String? { get }
    /// The ending url path
    var path: String { get }
    /// The apiType
    var apiType: APIType? { get }
    /// Queries to add to the url
    var queries: [String: String]? { get }
}
