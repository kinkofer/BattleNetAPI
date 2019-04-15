//
//  Auction.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Auction: Codable {
    let files: [AuctionFile]
}



class AuctionFile: Codable {
    let url: String
    let lastModified: Double
}
