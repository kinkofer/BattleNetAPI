//
//  Auction.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/22/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct AuctionIndex: Codable, SelfDecodable {
    public let _links: SelfLink<AuctionIndex>?
    public let connectedRealm: Link<ConnectedRealm>
    public let auctions: [Auction]

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct Auction: Codable, SelfDecodable {
    public let id: Int
    public let item: AuctionItem
    public let buyout: Int?
    public let quantity: Int
    public let timeLeft: String

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct AuctionItem: Codable, SelfDecodable {
    public let id: Int
    public let context: Int?
    public let bonusLists: [Int]?
    public let modifiers: [AuctionItemModifier]?

    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct AuctionItemModifier: Codable {
    public let type: Int
    public let value: Int
}
