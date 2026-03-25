//
//  HearthstoneTests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 3/25/26.
//  Copyright © 2026 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


class HearthstoneTests: XCTestCase {
    var battleNetAPI: BattleNetAPI!


    override func setUp() {
        super.setUp()

        guard credentials.clientAccessToken != nil else {
            XCTFail("clientAccessToken must be set in credentials.")
            return
        }

        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth, locale: .en_US)
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: - Game Data API

    // MARK: Cards API

    func testSearchCards() async throws { XCTAssert(true) }
    func testGetCard() async throws { XCTAssert(true) }


    // MARK: Card Backs API

    func testSearchCardBacks() async throws { XCTAssert(true) }
    func testGetCardBack() async throws { XCTAssert(true) }


    // MARK: Deck API

    func testGetDeck() async throws { XCTAssert(true) }


    // MARK: Metadata API

    func testGetMetadata() async throws { XCTAssert(true) }
    func testGetMetadataByType() async throws { XCTAssert(true) }
}
