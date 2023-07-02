import XCTest
@testable import SwiftKeychain

final class SwiftKeychainTests: XCTestCase {
    func testKeychain() throws {
        let key = "tempKey"
        SwiftKeychain.delete(key: key)
        let data = "Data".data(using: .utf8)!

        let result = SwiftKeychain.add(data: data, for: key)
        XCTAssert(result == errSecSuccess)

        let resultData = SwiftKeychain.search(key: key)
        XCTAssert(resultData == data)

        let resultStatus = SwiftKeychain.delete(key: key)
        XCTAssert(resultStatus == errSecSuccess)
    }
}
