import XCTest
@testable import swiftc

final class swiftcTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swiftc().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
