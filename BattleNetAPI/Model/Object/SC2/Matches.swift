//
//  Matches.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class MatchIndex: Codable {
    var matches = [Match]()
}



class Match: Codable {
    var map = ""
    var type = ""
    var decision = ""
    var speed = ""
    var date: Double = 0
}
