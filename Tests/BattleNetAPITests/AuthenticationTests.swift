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
        battleNetAPI = BattleNetAPI(credentials: credentials, oauth: oauth)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    
    // MARK: -
    
    func testGetClientAccess() async throws {
        let data = try await battleNetAPI.authentication.getClientAccess()
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: Access.self)
    }
    
    
    func testValidateClientAccessToken() async throws {
        guard let clientAccessToken = credentials.clientAccessToken else {
            XCTFail("clientAccessToken must be set in AuthToken. The token is logged in the console when running ViewController.viewDidLoad().")
            return
        }
        
        let data = try await battleNetAPI.authentication.validateClientAccessToken(clientAccessToken)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: ClientToken.self)
    }
    
    
    func testValidateUserAccessToken() async throws {
        guard let userAccessToken = credentials.userAccessToken else {
            XCTFail("userAccessToken must be set in AuthToken. The token is logged in the console when running authenticateUser(showAPI:).")
            return
        }
        
        let data = try await battleNetAPI.authentication.validateUserAccessToken(userAccessToken)
        BattleNetAPITests.webServiceAsyncTest(data: data, decodable: UserToken.self)
    }
}
