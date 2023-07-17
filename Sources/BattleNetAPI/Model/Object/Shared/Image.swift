//
//  Image.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/12/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Image: Codable {
    public var x: Int
    public var y: Int
    public var w: Int
    public var h: Int
    public var offset: Int
    public var url: String
}
