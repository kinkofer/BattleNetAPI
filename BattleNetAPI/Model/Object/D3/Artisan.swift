//
//  Artisan.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Artisan: Codable {
    let slug: String
    let name: String
    let portrait: String
    
    let training: Training
}


class Training: Codable {
    let tiers: [Tier]
}


class Tier: Codable {
    let tier: Int
    let trainedRecipes: [D3Recipe]
}


class D3Recipe: Codable {
    let id: String
    let slug: String
    let name: String
    
    let cost: Int
    let reagents: [Reagent]
    let itemProduced: D3Item
}


class Reagent: Codable {
    let quantity: Int
    let item: D3Item
}
