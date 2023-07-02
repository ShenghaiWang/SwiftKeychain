import Foundation

public enum KeyType {
    /// RSA algorithm.
    case RSA
    /// DSA algorithm.
    case DSA
    /// AES algorithm.
    case AES
    /// DES algorithm.
    case DES
    /// 3DES algorithm.
    case ThreeDES
    /// RC4 algorithm.
    case RC4
    /// RC2 algorithm.
    case RC2
    /// CAST algorithm.
    case CAST
    /// Elliptic curve DSA algorithm.
    case ECDSA
    /// Elliptic curve algorithm.
    case EC
    /// Elliptic curve algorithm.
    case ECSECPrimeRandom

    public var value: String {
        switch self {
        case .RSA: return kSecAttrKeyTypeRSA as String
        case .DSA: return kSecAttrKeyTypeDSA as String
        case .AES: return kSecAttrKeyTypeAES as String
        case .DES: return kSecAttrKeyTypeDES as String
        case .ThreeDES: return kSecAttrKeyType3DES as String
        case .RC4: return kSecAttrKeyTypeRC4 as String
        case .RC2: return kSecAttrKeyTypeRC2 as String
        case .CAST: return kSecAttrKeyTypeCAST as String
        case .ECDSA: return kSecAttrKeyTypeECDSA as String
        case .EC: return kSecAttrKeyTypeEC as String
        case .ECSECPrimeRandom: return kSecAttrKeyTypeECSECPrimeRandom as String
        }
    }
}
