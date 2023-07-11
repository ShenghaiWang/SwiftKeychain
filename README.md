#  SwiftKeychain

A Keychain wrapper allowing safely interaction with Keychain using strongly typed values and even in **Swift concurrency** fashion.

## Install

    .package(url: "https://github.com/ShenghaiWang/SwiftKeychain.git", from: "1.0.0")


## Usage [API Doc](https://m.timwang.au/swiftkeychain/documentation/swiftkeychain/swiftkeychain)

The simplest usage would be combining Swift macro with SwiftKeychain like below. Please add [SwiftMacros](https://github.com/ShenghaiWang/SwiftMacros) package first.

```swift
struct TestAccess {
    @Access<CodableStruct?>(.keychain)
    var value: CodableStruct?
}
```

Or use it without macros like below:

```Swift
// Add keychain item
SwiftKeychain.add(data: data, for: key) // For data value
let result = try? SwiftKeychain.add(value: value, for: key) // For Codable value

// Search keychain item
let resultData = SwiftKeychain.search(key: key) // For data value
let resultValue: Struct = try? SwiftKeychain.search(key: key) // For Codable value

// Delete
let resultStatus = SwiftKeychain.delete(key: key)

```

The full-fledged methods provide full acceess to keychain even in **Swift concurrency** fashion.

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

### Full-fledged methods

There are four sets of methods responsible for adding, searching, updating and deleting keychain items. All have synchronous method and its asynchronous counterparts. 

Please also refer to the **Result parsing** section for handling result.

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

### Result parsing

Apart from convenience methods, all methods return `OperationResult` that contains status code and result object.

Keychain returns results in a very flexible way - the returned object could be a data object, an dictionary or array etc. In order to simplify result handling process, `OperationResult` provides the following methods to access the result object:

1. `.data` variable: to access the data object of the keychain item. This will automatically try to get the data from the result no matter of the returned object type.

2. `attribute` subscription: to access the attribute value from result dictionary. If the result is an array, it will try to return the value of the first element of the array.

3. `index, attribute` subscription: to access the attributed value of the specified index of the result array.
