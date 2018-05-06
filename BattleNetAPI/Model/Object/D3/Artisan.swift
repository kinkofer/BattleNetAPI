//
//  Artisan.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/10/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


class Artisan: Codable {
    var slug = ""
    var name = ""
    var portrait = ""
    
    var training = Training()
}


class Training: Codable {
    var tiers = [Tier]()
}


class Tier: Codable {
    var tier = 0
    var trainedRecipes = [D3Recipe]()
}


class D3Recipe: Codable {
    var id = ""
    var slug = ""
    var name = ""
    
    var cost = 0
    var reagents = [Reagent]()
    var itemProduced = D3Item()
}


class Reagent: Codable {
    var quantity = 0
    var item = D3Item()
}
