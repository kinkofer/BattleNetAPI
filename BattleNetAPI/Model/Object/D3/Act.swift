//
//  Act.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ActIndex: Codable {
    let acts: [Act]
}



class Act: Codable {
    let number: Int
    let name: String
    let slug: String
    let quests: [D3Quest]
}



class D3Quest: Codable {
    let id: Int?
    let name: String
    let slug: String
}
