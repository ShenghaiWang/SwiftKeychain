import Foundation
import Dispatch

/// The main class handles keychain operations(`Add`, `Search`, `Update` and `Delete`)
public class SwiftKeychain {
    private static var queue: DispatchQueue = {
        let queue = DispatchQueue(label: "swift.keychain.tw")
        return queue
    }()

    // MARK: Add

    /// Add one keychain item
    ///
    /// - Parameters:
    ///   - item: The item to be added
    ///   - results: The result types that want to be returned from key chain operation
    /// - Returns: The result in ``OperationResult`` format
    public static func add(item: Item,
                           results: [ResultKey] = []) -> OperationResult {
        var result: AnyObject?
        let allAttributes = item.value.query
            .merging(results.query) { first, _ in first }
        let status = SecItemAdd(allAttributes as CFDictionary, &result)
        return OperationResult(status: status, result: result)
    }

    /// Add one keychain item asynchronically and handle result in completion
    ///
    /// - Parameters:
    ///   - item: The item to be added
    ///   - results: The result types that want to be returned from key chain operation
    ///   - completion: The closure to handle result
    public static func add(item: Item,
                           results: [ResultKey] = [],
                           completion: @escaping (OperationResult) -> Void) {
        queue.async {
            completion(add(item: item, results: results))
        }
    }

    /// Add one keychain item and return result asynchronically
    ///
    /// - Parameters:
    ///   - item: The item to be added
    ///   - results: The result types that want to be returned from key chain operation
    /// - Returns: The result in ``OperationResult`` format
    public static func add(item: Item,
                           results: [ResultKey] = []) async throws -> OperationResult {
        await withCheckedContinuation { continuation in
            add(item: item, results: results) { result in
                continuation.resume(returning: result)
            }
        }
    }

    // MARK: Search

    /// Search keychain items
    ///
    /// - Parameters:
    ///   - item: The item attribute to be searched
    ///   - searchAttributes: Additional search attributes
    ///   - results: The result types that want to be returned from key chain operation
    /// - Returns: The result in ``OperationResult`` format
    public static func search(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              results: [ResultKey] = []) -> OperationResult {
        var result: AnyObject?
        let allAttributes = item.value.query
            .merging(searchAttributes.query) { first, _ in first }
            .merging(results.query) { first, _ in first }
        let status = SecItemCopyMatching(allAttributes as CFDictionary, &result)
        return OperationResult(status: status, result: result)
    }

    /// Search keychain items asynchronically and handle result in completion
    ///
    /// - Parameters:
    ///   - item: The item attribute to be searched
    ///   - searchAttributes: Additional search attributes
    ///   - results: The result types that want to be returned from key chain operation
    ///   - completion: The closure to handle result
    public static func search(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              results: [ResultKey] = [],
                              completion: @escaping (OperationResult) -> Void) {
        queue.async {
            completion(search(item: item, with: searchAttributes, results: results))
        }
    }

    /// Search keychain items and return result asynchronically
    ///
    /// - Parameters:
    ///   - item: The item attribute to be searched
    ///   - searchAttributes: Additional search attributes
    ///   - results: The result types that want to be returned from key chain operation
    /// - Returns: The result in ``OperationResult`` format
    public static func search(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              results: [ResultKey] = []) async throws -> OperationResult {
        await withCheckedContinuation { continuation in
            search(item: item, with: searchAttributes, results: results) { result in
                continuation.resume(returning: result)
            }
        }
    }

    // MARK: Update

    /// Update keychain item
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to update
    ///   - searchAttributes: Additional search attributes
    ///   - to: The new item values
    ///   - results: The result types that want to be returned from key chain operation
    /// - Returns: The result in ``OperationResult`` format
    public static func update(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              to newItem: Item) -> OperationResult {
        let allAttributes = item.value.query
            .merging(searchAttributes.query) { first, _ in first }
        let status = SecItemUpdate(allAttributes as CFDictionary, newItem.value.query as CFDictionary)
        return OperationResult(status: status, result: nil)
    }

    /// Update keychain item asynchronically and handle result in completion
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to update
    ///   - searchAttributes: Additional search attributes
    ///   - to: The new item values
    ///   - completion: The closure to handle result
    public static func update(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              to newItem: Item,
                              completion: @escaping (OperationResult) -> Void) {
        queue.async {
            completion(update(item: item, with: searchAttributes, to: newItem))
        }
    }

    /// Update keychain item and return result asynchronically
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to update
    ///   - searchAttributes: Additional search attributes
    ///   - to: The new item values
    /// - Returns: The result in ``OperationResult`` format
    public static func update(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              to newItem: Item) async throws -> OperationResult {
        await withCheckedContinuation { continuation in
            update(item: item, with: searchAttributes, to: newItem) { result in
                continuation.resume(returning: result)
            }
        }
    }

    // MARK: Update

    /// Update keychain item
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to delete
    ///   - searchAttributes: Additional search attributes
    /// - Returns: The result in ``OperationResult`` format
    public static func delete(item: Item,
                              with searchAttributes: [SearchAttribute] = []) -> OperationResult {
        let allAttributes = item.value.query
            .merging(searchAttributes.query) { first, _ in first }
        let status = SecItemDelete(allAttributes as CFDictionary)
        return OperationResult(status: status, result: nil)
    }

    /// Update keychain item asynchronically and handle result in completion
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to delete
    ///   - searchAttributes: Additional search attributes
    ///   - completion: The closure to handle result
    public static func delete(item: Item,
                              with searchAttributes: [SearchAttribute] = [],
                              completion: @escaping (OperationResult) -> Void) {
        queue.async {
            completion(delete(item: item, with: searchAttributes))
        }
    }

    /// Update keychain item and return result asynchronically
    ///
    /// - Parameters:
    ///   - item: The item attribute to decide the item to delete
    ///   - searchAttributes: Additional search attributes
    /// - Returns: The result in ``OperationResult`` format
    public static func delete(item: Item,
                              with searchAttributes: [SearchAttribute] = []) async throws -> OperationResult {
        await withCheckedContinuation { continuation in
            delete(item: item, with: searchAttributes) { result in
                continuation.resume(returning: result)
            }
        }
    }

    // MARK: Convenience

    /// Add data to keychain
    ///
    /// - Parameters:
    ///   - data: The data to be added to keychain
    ///   - key: The key for the new keychain item
    /// - Returns: True if the operation is successful
    @discardableResult
    public static func add(data: Data, for key: String) -> Bool {
        let item = InternetPassword(data: data, for: key)
        return add(item: .internetPassword(item)).status == errSecSuccess
    }

    /// Search data from keychain
    ///
    /// - Parameters:
    ///   - key: The key to be searched from keychain
    /// - Returns: The data associated to the key
    public static func search(key: String) -> Data? {
        let item = InternetPassword(for: key)
        return search(item: .internetPassword(item),
                      with: [.limit(.one)],
                      results: [.data]).result as? Data
    }

    /// Add data to keychain
    ///
    /// - Parameters:
    ///   - value: The value to be added to keychain
    ///   - key: The key for the new keychain item
    /// - Returns: True if the operation is successful
    @discardableResult
    public static func add(value: Encodable, for key: String) throws -> Bool {
        let data = try JSONEncoder().encode(value)
        return add(data: data, for: key)
    }

    /// Search data from keychain
    ///
    /// - Parameters:
    ///   - key: The key to be searched from keychain
    /// - Returns: The value associated to the key
    public static func search<T: Decodable>(key: String) throws -> T {
        guard let data = search(key: key) else { throw KeychainError.noDataFound(forKey: key) }
        return try JSONDecoder().decode(T.self, from: data)
    }

    /// Delete key from keychain
    ///
    /// - Parameters:
    ///   - key: The key to be searched from keychain item
    /// - Returns: True if the operation is successful
    @discardableResult
    public static func delete(key: String) -> Bool {
        let item = InternetPassword(for: key)
        return delete(item: .internetPassword(item),
                      with: [.limit(.one)]).status == errSecSuccess
    }
}
