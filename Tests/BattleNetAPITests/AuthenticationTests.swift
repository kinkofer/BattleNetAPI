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
    var battleNetAPI: BattleNetAPI!
    
    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        battleNetAPI = BattleNetAPI(credentials: credentials)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    // MARK: -
    
    func testGetClientAccess() {
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.authentication.getClientAccess { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: Access.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testValidateClientAccessToken() {
        guard let clientAccessToken = credentials.clientAccessToken else {
            XCTFail("clientAccessToken must be set in AuthToken. The token is logged in the console when running ViewController.viewDidLoad().")
            return
        }
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.authentication.validateClientAccessToken(clientAccessToken) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: ClientToken.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
    
    
    func testValidateUserAccessToken() {
        guard let userAccessToken = credentials.userAccessToken else {
            XCTFail("userAccessToken must be set in AuthToken. The token is logged in the console when running authenticateUser(showAPI:).")
            return
        }
        
        let wsResponseExpectation = expectation(description: "Web Service returned a response")
        
        battleNetAPI.authentication.validateUserAccessToken(userAccessToken) { result in
            BattleNetAPITests.webServiceClosureTest(result: result, decodable: UserToken.self, expectation: wsResponseExpectation)
        }
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Exceeded timeout")
        }
    }
}
