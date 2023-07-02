import Foundation

public enum KeyClass {
    /// A public key of a public-private pair.
    case Public
    /// A private key of a public-private pair.
    case Private
    /// A private key used for symmetric-key encryption and decryption.
    case Symmetric

    public var value: String {
        switch self {
        case .Public: return kSecAttrKeyClassPublic as String
        case .Private: return kSecAttrKeyClassPrivate as String
        case .Symmetric: return kSecAttrKeyClassSymmetric as String
        }
    }
}
