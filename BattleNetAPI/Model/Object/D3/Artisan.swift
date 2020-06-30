//
//  Artisan.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class Artisan: Codable {
    public let slug: String
    public let name: String
    public let portrait: String
    
    public let training: Training
}


public class Training: Codable {
    public let tiers: [Tier]
}


public class Tier: Codable {
    public let tier: Int
    public let trainedRecipes: [D3Recipe]
}


public class D3Recipe: Codable {
    public let id: String
    public let slug: String
    public let name: String
    
    public let cost: Int
    public let reagents: [Reagent]
    public let itemProduced: D3Item
}


public class Reagent: Codable {
    public let quantity: Int
    public let item: D3Item
}
