//
//  WOWRecipe.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWRecipe: Codable {
    public let id: Int
    public let name: String
    public let profession: String
    public let icon: String
}
