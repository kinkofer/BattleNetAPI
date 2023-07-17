//
//  Matches.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct MatchIndex: Codable {
    public let matches: [Match]
}



public struct Match: Codable {
    public let map: String
    public let type: String
    public let decision: String
    public let speed: String
    public let date: Double
}
