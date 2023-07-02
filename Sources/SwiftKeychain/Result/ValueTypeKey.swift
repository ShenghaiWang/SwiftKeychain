import Foundation

public enum ValueTypeKey: String {
    /// A key whose value is the item's data.
    case data
    /// A key whose value is a reference to the item.
    case rRef
    /// A key whose value is a persistent reference to the item.
    case persistentRef

    public var value: String {
        switch self {
        case .data: return kSecValueData as String
        case .rRef: return kSecValueRef as String
        case .persistentRef: return kSecValuePersistentRef as String
        }
    }
}
