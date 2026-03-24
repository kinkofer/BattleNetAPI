//
//  WOWRecipe.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/23/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct WOWRecipe: Codable, SelfDecodable {
    public let _links: SelfLink<WOWRecipe>?
    public let id: Int
    public let name: String
    public let media: MediaLink
    public let craftedItem: KeyLink<WOWItem>?
    public let reagents: [RecipeReagent]?
    public let craftedQuantity: Quantity?
    
    
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}


public struct RecipeReagent: Codable {
    public let reagent: KeyLink<WOWItem>
    public let quantity: Int
}
