import Foundation

public enum ResultKey {
    /// A key whose value is a Boolean indicating whether or not to return item data.
    case data
    /// A key whose value is a Boolean indicating whether or not to return item attributes.
    case attributes
    /// A key whose value is a Boolean indicating whether or not to return a reference to an item.
    case ref
    /// A key whose value is a Boolean indicating whether or not to return a persistent reference to an item.
    case persistentRef

    public var value: String {
        switch self {
        case .data: return kSecReturnData as String
        case .attributes: return kSecReturnAttributes as String
        case .ref: return kSecReturnRef as String
        case .persistentRef: return kSecReturnPersistentRef as String
        }
    }
}

extension Array where Element == ResultKey {
    public var query: [(String, Any)] {
        map({ ($0.value, true) }) as [(String, Any)]
    }
}
