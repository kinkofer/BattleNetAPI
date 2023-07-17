//
//  Auction.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Auction: Codable {
    public let files: [AuctionFile]
}



public struct AuctionFile: Codable {
    public let url: String
    public let lastModified: Double
}
