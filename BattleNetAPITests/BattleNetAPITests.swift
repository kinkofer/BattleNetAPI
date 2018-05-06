//
//  BattleNetAPITests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 4/6/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI


let clientID = "x68y75qh6dpzpsthczrdjv9ck57xapms"
let clientSecret = "pTXHmmqac5346E6SDWGamsPrp5RjEmXE"

let clientAccessToken: String = "rqq9f8hrnsbk4kdqq5cec5gj"
let userAccessToken: String = "rck2xwtvnu5umxrtxv99ujg3"


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
    
    static func webServiceClosureTest<T: Decodable>(result: Result<Data>, decodable: T.Type, expectation: XCTestExpectation) {
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
            XCTAssertNil(error, "Web service error: \(error.message)")
        }
        
        expectation.fulfill()
    }
}
