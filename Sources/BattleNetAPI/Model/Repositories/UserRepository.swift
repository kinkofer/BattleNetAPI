//
//  UserRepository.swift
//  BattleNetAPI
//
//  Created by Christopher Jennewein on 4/9/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import Foundation


public struct UserRepository {
    let battleNetAPI: BattleNetAPI
    
    
    public init(battleNetAPI: BattleNetAPI) {
        self.battleNetAPI = battleNetAPI
    }
    
    
    public func getUser(completion: @escaping (_ result: Result<User, Error>) -> Void) {
        battleNetAPI.user.getUserInfo(completion: { $0.decode(completion: completion) })
    }
}
