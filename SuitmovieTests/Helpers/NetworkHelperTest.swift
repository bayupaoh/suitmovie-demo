//
//  NetworkHelperTest.swift
//  KitamovieTests
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import XCTest
@testable import Suitmovie

class NetworkHelperTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCustomError() {
        let error = NetworkHelper.customError(code: 400, message: "User not found")
        XCTAssertEqual(error.localizedDescription, "User not found")
    }
}
