//
//  BattleNetAPI.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


/// This class is an interface to all the web services, with separate properties for accessing authentication, user, and specific game web services.
class BattleNetAPI {
    /// Authenication web services
    public static let authentication = WS_Authentication()
    /// User web services
    public static let user = WS_User()
    
    /// World of Warcraft web services
    public static let wow = WS_WorldOfWarcraft()
    /// StarCraft 2 web services
    public static let sc2 = WS_StarCraft2()
    /// Diablo 3 web services
    public static let d3 = WS_Diablo3()
}
