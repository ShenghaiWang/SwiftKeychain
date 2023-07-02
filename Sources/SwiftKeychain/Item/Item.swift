import Foundation

public enum Item {
    case genericPassword(GenericPassword)
    case internetPassword(InternetPassword)
    case certificate(Certificate)
    case key(Key)
    case identity(Identity)

    public var value: any ItemValue {
        switch self {
        case let .genericPassword(genericPassword): return genericPassword
        case let .internetPassword(internetPassword): return internetPassword
        case let .certificate(certificate): return certificate
        case let .key(key): return key
        case let .identity(identity): return identity
        }
    }

    public static let genericPassword = kSecClassGenericPassword
    public static let internetPassword = kSecClassInternetPassword
    public static let certificate = kSecClassCertificate
    public static let key = kSecClassKey
    public static let identity = kSecClassIdentity
}
