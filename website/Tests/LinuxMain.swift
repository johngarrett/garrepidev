import XCTest

import websiteTests

var tests = [XCTestCaseEntry]()
tests += websiteTests.allTests()
XCTMain(tests)
