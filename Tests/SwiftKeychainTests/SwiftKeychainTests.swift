import XCTest
@testable import SwiftKeychain

final class SwiftKeychainTests: XCTestCase {

    struct Struct: Codable, Equatable {
        let intValue: Int
        let stringValue: String
    }

    func testKeychainForData() throws {
        let key = "tempKey"
        SwiftKeychain.delete(key: key)
        let data = "Data".data(using: .utf8)!

        let result = SwiftKeychain.add(data: data, for: key)
        XCTAssert(result)

        let resultData = SwiftKeychain.search(key: key)
        XCTAssert(resultData == data)

        let resultStatus = SwiftKeychain.delete(key: key)
        XCTAssert(resultStatus)
    }

    func testKeychainForCodable() throws {
        let key = "tempKey"
        let value = Struct(intValue: 10, stringValue: "abcd")
        SwiftKeychain.delete(key: key)

        let result = try! SwiftKeychain.add(value: value, for: key)
        XCTAssert(result)

        let resultValue: Struct = try! SwiftKeychain.search(key: key)
        XCTAssert(resultValue == value)

        let resultStatus = SwiftKeychain.delete(key: key)
        XCTAssert(resultStatus)
    }
}
