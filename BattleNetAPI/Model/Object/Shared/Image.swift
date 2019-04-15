//
//  Image.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Image: Codable {
    var x: Int
    var y: Int
    var w: Int
    var h: Int
    var offset: Int
    var url: String
}
