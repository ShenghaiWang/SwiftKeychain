import Foundation

public struct Key: ItemValue {
    public enum Attribute: KeyValue {
        case access(SecAccess)
        case accessGroup(String)
        case accessible(AccessibilityValue)
        case keyClass(KeyClass)
        case label(String)
        case applicationLabel(Data)
        case isPermanent(Bool)
        case applicationTag(Data)
        case keyType(KeyType)
        case PRF(String)
        case salt(Data)
        case rounds(UInt32)
        case keySizeInBits(UInt32)
        case effectiveKeySize(UInt32)
        case canEncrypt(Bool)
        case canDecrypt(Bool)
        case canDerive(Bool)
        case canSign(Bool)
        case canVerify(Bool)
        case canWrap(Bool)
        case canUnwrap(Bool)

        public var key: String {
            switch self {
            case .access: return kSecAttrAccess as String
            case .accessGroup: return kSecAttrAccessGroup as String
            case .accessible: return kSecAttrAccessible as String
            case .keyClass: return kSecAttrKeyClass as String
            case .label: return kSecAttrLabel as String
            case .applicationLabel: return kSecAttrApplicationLabel as String
            case .isPermanent: return kSecAttrIsPermanent as String
            case .applicationTag: return kSecAttrApplicationTag as String
            case .keyType: return kSecAttrKeyType as String
            case .PRF: return kSecAttrPRF as String
            case .salt: return kSecAttrSalt as String
            case .rounds: return kSecAttrRounds as String
            case .keySizeInBits: return kSecAttrKeySizeInBits as String
            case .effectiveKeySize: return kSecAttrEffectiveKeySize as String
            case .canEncrypt: return kSecAttrCanEncrypt as String
            case .canDecrypt: return kSecAttrCanDecrypt as String
            case .canDerive: return kSecAttrCanDerive as String
            case .canSign: return kSecAttrCanSign as String
            case .canVerify: return kSecAttrCanVerify as String
            case .canWrap: return kSecAttrCanWrap as String
            case .canUnwrap: return kSecAttrCanUnwrap as String
            }
        }

        public var value: Any {
            switch self {
            case let .access(value): return value
            case let .accessGroup(value): return value as CFString
            case let .accessible(value): return value.value as CFString
            case let .keyClass(value): return value.value as CFString
            case let .label(value): return value as CFString
            case let .applicationLabel(value): return value as CFData
            case let .isPermanent(value): return value as CFBoolean
            case let .applicationTag(value): return value as CFData
            case let .keyType(value): return value.value as CFString
            case let .PRF(value): return value as CFString
            case let .salt(value): return value as CFData
            case let .rounds(value): return value as CFNumber
            case let .keySizeInBits(value): return value as CFNumber
            case let .effectiveKeySize(value): return value as CFNumber
            case let .canEncrypt(value): return value as CFBoolean
            case let .canDecrypt(value): return value as CFBoolean
            case let .canDerive(value): return value as CFBoolean
            case let .canSign(value): return value as CFBoolean
            case let .canVerify(value): return value as CFBoolean
            case let .canWrap(value): return value as CFBoolean
            case let .canUnwrap(value): return value as CFBoolean
            }
        }
    }
    public let type: CFString = Item.key
    public var attributes: [Attribute] = []
    public var data: Data?
}
