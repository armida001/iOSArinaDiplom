//
//  iOSArinaDiplomTests.swift
//  iOSArinaDiplomTests
//
//  Created by Арина Зимонина on 24.11.2021.
//

import XCTest
import UIKit
@testable import iOSArinaDiplom

class iOSArinaDiplomTests: XCTestCase {
    private let service = PatternsService()
    
    func test() {
//        service.getPatterns(after: nil) { result in
//            XCTAssert(!result.isEmpty, "all right")
//        } errorCompletion: { error in
//            XCTFail(error.message)
//        }
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
