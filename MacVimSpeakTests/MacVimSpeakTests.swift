//
//  MacVimSpeakTests.swift
//  MacVimSpeakTests
//
//  Created by Pam Selle on 2/27/15.
//  Copyright (c) 2015 The Webivore. All rights reserved.
//

import Cocoa
import XCTest
import MacVimSpeak

class MacVimSpeakTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testParserWithLowerCaseLetters() {
        let parsed = Parser("abc")
        let output: Array<KeySet> = [[0], [11], [8]]
        println(parsed)
        println(output)
        XCTAssertEqual(parsed[0][0], output[0][0], "Parser returns keycode set for lowercase letters")
        XCTAssertEqual(parsed[1][0], output[1][0], "Parser returns keycode set for lowercase letters")
    }

    func testParserWithUpperCaseLetters() {
        let parsed = Parser("gV")
        let output: Array<KeySet> = [[5], [56, 9]]
        println(parsed)
        println(output)
        XCTAssertEqual(parsed[0][0], output[0][0], "Parser returns keycode set for uppercase letters")
        XCTAssertEqual(parsed[1][0], output[1][0], "Parser returns keycode set for uppercase letters")
        XCTAssertEqual(parsed[1][1], output[1][1], "Parser returns keycode set for uppercase letters")
    }
    
    func testParserWithCombo() {
        let parsed = Parser("<Shift-v>")
        let output: Array<KeySet> = [[56, 9]]
        XCTAssertEqual(parsed[0][0], output[0][0], "Parser returns keycode set for uppercase letters")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
