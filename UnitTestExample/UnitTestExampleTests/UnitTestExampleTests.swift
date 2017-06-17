//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by Kenny Dang on 6/17/17.
//  Copyright © 2017 frooctus. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class UnitTestExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        
        let vc = ViewController()
        
        let estimatedResults = vc.add(150, to: 150)
        let actualResults = 300
        
        XCTAssertEqual(estimatedResults, actualResults, "Estimated results does not equal to actual results")
    }
    
}
