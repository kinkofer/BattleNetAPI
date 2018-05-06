//
//  AuthenticationTests.swift
//  BattleNetAPITests
//
//  Created by Christopher Jennewein on 5/2/18.
//  Copyright © 2018 Prismatic Games. All rights reserved.
//

import XCTest
@testable import BattleNetAPI

class AuthenticationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    // MARK: -
    
    func testGetClientAccessToken() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.authentication.getClientAccessToken(region: .us, clientID: clientID, clientSecret: clientSecret) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Access.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testValidateClientAccessToken() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.authentication.validateClientAccessToken(clientAccessToken, region: .us) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ClientToken.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testValidateUserAccessToken() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        BattleNetAPI.authentication.validateUserAccessToken(userAccessToken, region: .us) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: UserToken.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
}
