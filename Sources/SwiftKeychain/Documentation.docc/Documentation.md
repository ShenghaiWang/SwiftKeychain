# SwiftKeychain

A Keychain wrapper allowing safely interaction with Keychain using strongly typed values and even in **Swift concurrency** fashion.

## Overview

It provides convenience methods to quickly save/retrieve data and Codable data into keychain using a simple string Key as well as full-fledged methods to access keychain.

There are four sets of methods responsible for adding, searching, updating and deleting keychain items. All have synchronous method and its asynchronous counterparts. 

The simplest usage would be combining Swift macro with SwiftKeychain like below. Please add [SwiftMacros](https://github.com/ShenghaiWang/SwiftMacros) package first.

```swift
struct TestAccess {
    @Access<CodableStruct?>(.keychain)
    var value: CodableStruct?
}
```

Please also refer to the [Readme](https://github.com/ShenghaiWang/SwiftKeychain#readme) in the code repo for more examples.

## Result parsing

Apart from convenience methods, all methods return `OperationResult` that contains status code and result object.

Keychain returns results in a very flexible way - the returned object could be a data object, an dictionary or array etc. In order to simplify result handling process, `OperationResult` provides the following methods to access the result object:

1. `.data` variable: to access the data object of the keychain item. This will automatically try to get the data from the result no matter of the returned object type.

2. `attribute` subscription: to access the attribute value from result dictionary. If the result is an array, it will try to return the value of the first element of the array.

3. `index, attribute` subscription: to access the attributed value of the specified index of the result array.

## Topics

### Convenience methods - Add

- ``SwiftKeychain/SwiftKeychain/add(data:for:)``
- ``SwiftKeychain/SwiftKeychain/add(value:for:)``

### Convenience methods - Search

- ``SwiftKeychain/SwiftKeychain/search(key:)-9s7j1``
- ``SwiftKeychain/SwiftKeychain/search(key:)-92ve2``

### Convenience methods - Delete

- ``SwiftKeychain/SwiftKeychain/delete(key:)``

### Full-fledged methods - Add

- ``SwiftKeychain/SwiftKeychain/add(item:results:)-7t0h5``
- ``SwiftKeychain/SwiftKeychain/add(item:results:)-90pey``
- ``SwiftKeychain/SwiftKeychain/add(item:results:completion:)

### Full-fledged methods - Search

- ``SwiftKeychain/SwiftKeychain/search(item:with:results:)-3strc``
- ``SwiftKeychain/SwiftKeychain/search(item:with:results:)-2v8dr``
- ``SwiftKeychain/SwiftKeychain/search(item:with:results:completion:)``

### Full-fledged methods - Update

- ``SwiftKeychain/SwiftKeychain/update(item:with:to:)-44p04``
- ``SwiftKeychain/SwiftKeychain/update(item:with:to:)-3617l``
- ``SwiftKeychain/SwiftKeychain/update(item:with:to:completion:)``

### Full-fledged methods - Delete

- ``SwiftKeychain/SwiftKeychain/delete(item:with:)-1lzim``
- ``SwiftKeychain/SwiftKeychain/delete(item:with:)-wpmt``
- ``SwiftKeychain/SwiftKeychain/delete(item:with:completion:)

