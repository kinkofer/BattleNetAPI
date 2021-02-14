//
//  BattleNetAPITests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


/// Set the credentials that will be used for all tests.
/// - Note: `clientAccessToken` and `userAccessToken` need to fetched before running tests.
let credentials = BattleNetCredentials(clientID: "CLIENT_ID", clientSecret: "CLIENT_SECRET", clientAccessToken: nil, userAccessToken: nil)


class BattleNetAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    // MARK: -
    
    static func webServiceClosureTest<T: Decodable>(result: Result<Data, Error>, decodable: T.Type, expectation: XCTestExpectation) {
        switch result {
        case .success(let data):
            do {
                let decode = try T.decode(from: data)
                XCTAssertNotNil(decode, "Nil object decoded")
            }
            catch {
                XCTFail("Could not decode")
            }
        case .failure(let error):
            XCTAssertNil(error, "Web service error: \(error.localizedDescription)")
        }
        
        expectation.fulfill()
    }
}
