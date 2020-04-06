//
//  NetworkServiceTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs

@testable import Suitmovie

class NetworkServiceTest: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSuccess() {
        let obj: [String: Any] = ["status": 200, "message": "success"]
        stub(condition: isHost("api.themoviedb.org")) { request in
            return OHHTTPStubsResponse(
                jsonObject: obj,
                statusCode: 200,
                headers: .none
            )
        }
        
        let network = NetworkService()

        let expect = expectation(description: "network_test_success")

        network.get(path: "", parameters: nil, headers: nil, onSuccess: { response in
            XCTAssertNotNil(response)
            expect.fulfill()
        }) { error in
            XCTAssertNil(error)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        OHHTTPStubs.removeAllStubs()
    }
    
    func testGetFail() {
        stub(condition: isHost("api.themoviedb.org")) { request in
            let error = NetworkHelper.customError(code: 400, message: "Error for testing")
            return OHHTTPStubsResponse(error: error)
        }
        
        let network = NetworkService()

        let expect = expectation(description: "network_test_success")

        network.get(path: "", parameters: nil, headers: nil, onSuccess: { response in
            XCTAssertNil(response)
            expect.fulfill()
        }) { error in
            XCTAssertNotNil(error)
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        OHHTTPStubs.removeAllStubs()

    }
}
