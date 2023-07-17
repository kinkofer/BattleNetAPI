//
//  Act.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct ActIndex: Codable {
    public let acts: [Act]
}



public struct Act: Codable {
    public let number: Int
    public let name: String
    public let slug: String
    public let quests: [D3Quest]
}



public struct D3Quest: Codable {
    public let id: Int?
    public let name: String
    public let slug: String
}
