#  SwiftKeychain

A Keychain wrapper allowing safely interaction with Keychain using strongly typed values.

## Install

    .package(url: "https://github.com/ShenghaiWang/SwiftKeychain.git", from: "0.1.0")


## Usage

### Convenience methods

#### Add

```swift
@discardableResult
public static func add(data: Data, for key: String) -> OSStatus?
```

#### Search

```swift
public static func search(key: String) -> Data?
```
#### Delete

```swift
@discardableResult
public static func delete(key: String) -> OSStatus?
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
