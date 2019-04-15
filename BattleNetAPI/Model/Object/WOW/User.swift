//
//  User.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class User: Codable {
    let id: Int
    let battletag: String
    let sub: String
}
