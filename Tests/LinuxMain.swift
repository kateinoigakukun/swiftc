import XCTest

import swiftcTests

var tests = [XCTestCaseEntry]()
tests += swiftcTests.allTests()
XCTMain(tests)