//
//  ForeCastNetworkTests.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import WeatherSwift

class ForeCastNetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        ForeCastDataController().deleteAll()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
        
        ForeCastDataController().deleteAll()

    }
    
    func testcanreadFromServer() {
        let expectation = self.expectation(description: "check if network connection can be made")
        
        ForeCastNetworkController().readForeCastForCity("London") { (success) in
            if !success {
                XCTFail()
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 30.0, handler: nil)
    }
    
    func testreadFromServerandData() {
        let expectation = self.expectation(description: "check if network connection can be made")
        
        ForeCastNetworkController().readForeCastForCity("London") { (success) in
            if !success {
                XCTFail()
            }
            if ForeCastDataController().readAll().isEmpty {
                XCTFail()
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 30.0, handler: nil)
    }

}
