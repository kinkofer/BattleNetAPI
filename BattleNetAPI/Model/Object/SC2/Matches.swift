//
//  Matches.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MatchIndex: Codable {
    let matches: [Match]
}



class Match: Codable {
    let map: String
    let type: String
    let decision: String
    let speed: String
    let date: Double
}
