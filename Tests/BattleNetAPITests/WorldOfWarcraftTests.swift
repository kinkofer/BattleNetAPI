//
//  WorldOfWarcraftTests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/3/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class WorldOfWarcraftTests: XCTestCase {
    var battleNetAPI: BattleNetAPI!


    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        guard credentials.clientAccessToken != nil else {
            XCTFail("clientAccessToken must be set in credentials.")
            return
        }

        guard credentials.userAccessToken != nil else {
            XCTFail("userAccessToken must be set in credentials.")
            return
        }

        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth, locale: .en_US)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}
