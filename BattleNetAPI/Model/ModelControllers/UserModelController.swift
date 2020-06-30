//
//  UserModelController.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public class UserModelController {
    public static let shared = UserModelController()
    private init() { }
    
    
    public func getUser(region: APIRegion = Current.region, completion: @escaping (_ result: Result<User, HTTPError>) -> Void) {
        BattleNetAPI.user.getUserInfo(region: region) { result in
            result.decode(completion: completion)
        }
    }
}
