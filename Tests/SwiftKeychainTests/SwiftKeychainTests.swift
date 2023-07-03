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

    func testKeychainAttribute() throws {
        let password = "password".data(using: .utf8)!
        let searchItem = Item.internetPassword(.init(attributes: [.account("tim.wang"),
                                                                   .protocol(.AFP)]))
        _ = SwiftKeychain.delete(item: searchItem,
                                 with: [.limit(.one)])

        let result = SwiftKeychain.add(item:
                .internetPassword(.init(attributes: [.account("tim.wang"),
                                                     .protocol(.AFP),
                                                     .server("temp.server.com")],
                                        data: password)))
        XCTAssert(result.isSuccessful)

        let resultValue = SwiftKeychain.search(item: searchItem,
                                               with: [.limit(.one)],
                                               results: [.data, .attributes])
        XCTAssert(resultValue.data == password)

        let resultStatus = SwiftKeychain.delete(item: searchItem)
        XCTAssert(resultStatus.isSuccessful)
    }

    func testKeychainAttributeArray() throws {
        let password = "password".data(using: .utf8)!
        let searchItem = Item.genericPassword(.init(attributes: [.service("tim.wang")]))
        _ = SwiftKeychain.delete(item: searchItem,
                                 with: [.limit(.all)])

        _ = SwiftKeychain.add(item:
                .genericPassword(.init(attributes: [.service("tim.wang"),
                                                    .account("user1")],
                                        data: password)))
        _ = SwiftKeychain.add(item:
                .genericPassword(.init(attributes: [.service("tim.wang"),
                                                    .account("user2")],
                                        data: password)))

        let resultValue = SwiftKeychain.search(item: searchItem,
                                               with: [.limit(.all)],
                                               results: [.attributes])
        XCTAssert(resultValue[.account] == "user1")
        XCTAssert(resultValue[1, .account] == "user2")

        let resultStatus = SwiftKeychain.delete(item: searchItem)
        XCTAssert(resultStatus.isSuccessful)
    }
}
