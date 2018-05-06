//
//  Act.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class ActIndex: Codable {
    var acts = [Act]()
}



class Act: Codable {
    var number = 0
    var name = ""
    var slug = ""
    var quests = [D3Quest]()
}



class D3Quest: Codable {
    var id: Int? = 0
    var name = ""
    var slug = ""
}
