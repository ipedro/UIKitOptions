import XCTest
@testable import UIKeyCommandOptions

final class UIKeyCommandOptionsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UIKeyCommandOptions().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
