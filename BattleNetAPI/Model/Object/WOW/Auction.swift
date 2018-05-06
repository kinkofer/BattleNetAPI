//
//  Auction.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Auction: Codable {
    var files: [AuctionFile] = [AuctionFile]()
}



class AuctionFile: Codable {
    var url: String = ""
    var lastModified: Double = 0
}
