#  SwiftKeychain

A Keychain wrapper allowing safely interaction with Keychain using strongly typed values and even in **Swift concurrency** fashion.

## Install

    .package(url: "https://github.com/ShenghaiWang/SwiftKeychain.git", from: "0.2.0")


## Usage

```Swift
// Add

// Data
SwiftKeychain.add(data: data, for: key)
// Codable value
let result = try? SwiftKeychain.add(value: value, for: key)

// Search

// Data
let resultData = SwiftKeychain.search(key: key)
// Codable value
let resultValue: Struct = try? SwiftKeychain.search(key: key)

// Delete
let resultStatus = SwiftKeychain.delete(key: key)

```

The full fledged methods provide full acceess to keychain even in **Swift concurrency** fashion.

### Convenience methods

#### Add

```swift
@discardableResult
public static func add(data: Data, for key: String) -> Bool
// And
public static func add(value: Encodable, for key: String) throws -> Bool
```

#### Search

```swift
public static func search(key: String) -> Data?
// And
public static func search<T: Decodable>(key: String) throws -> T
```
#### Delete

```swift
@discardableResult
public static func delete(key: String) -> Bool
```

### Full fledged methods

#### Add

```swift
public static func add(item: Item,
                       results: [ResultKey] = []) -> OperationResult
```
```swift
public static func add(item: Item,
                       results: [ResultKey] = [],
                       completion: @escaping (OperationResult) -> Void)
```
```swift
public static func add(item: Item,
                       results: [ResultKey] = []) async throws -> OperationResult
```

#### Search

```swift
public static func search(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          results: [ResultKey] = []) -> OperationResult
```
```swift
public static func search(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          results: [ResultKey] = [],
                          completion: @escaping (OperationResult) -> Void)
```
```swift
public static func search(item: Item,
                         with searchAttributes: [SearchAttribute] = [],
                         results: [ResultKey] = []) async throws -> OperationResult
```

#### Update

```swift
public static func update(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          to newItem: Item) -> OperationResult
```
```swift
public static func update(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          to newItem: Item,
                          completion: @escaping (OperationResult) -> Void)
```
```swift
public static func update(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          to newItem: Item) async throws -> OperationResult
```

#### Delete

```swift
public static func delete(item: Item,
                          with searchAttributes: [SearchAttribute] = []) -> OperationResult
```
```swift
public static func delete(item: Item,
                          with searchAttributes: [SearchAttribute] = [],
                          completion: @escaping (OperationResult) -> Void)
```
```swift
public static func delete(item: Item,
                          with searchAttributes: [SearchAttribute] = []) async throws -> OperationResult
```
