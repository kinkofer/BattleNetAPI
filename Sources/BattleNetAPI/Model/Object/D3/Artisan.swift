//
//  Artisan.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct Artisan: Codable {
    public let slug: String
    public let name: String
    public let portrait: String
    
    public let training: Training
}


public struct Training: Codable {
    public let tiers: [Tier]
}


public struct Tier: Codable {
    public let tier: Int
    public let trainedRecipes: [D3Recipe]
}


public struct D3Recipe: Codable {
    public let id: String
    public let slug: String
    public let name: String
    
    public let cost: Int
    public let reagents: [Reagent]
    public let itemProduced: D3Item
}


public struct Reagent: Codable {
    public let quantity: Int
    public let item: D3Item
}
