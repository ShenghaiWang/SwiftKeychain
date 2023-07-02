import Foundation

public struct GenericPassword: ItemValue {
    public enum Attribute: KeyValue {
        case access(SecAccess)
        case accessControl(SecAccessControl)
        case accessGroup(String)
        case accessible(AccessibilityValue)
        case creationDate(Date)
        case modificationDate(Date)
        case description(String)
        case comment(String)
        case creator(UInt32)
        case type(UInt32)
        case label(String)
        case isInvisible(Bool)
        case isNegative(Bool)
        case account(String)
        case service(String)
        case generic(Data)
        case synchronizable(Bool)

        public var key: String {
            switch self {
            case .access: return kSecAttrAccess as String
            case .accessControl: return kSecAttrAccessControl as String
            case .accessGroup: return kSecAttrAccessGroup as String
            case .accessible: return kSecAttrAccessible as String
            case .creationDate: return kSecAttrCreationDate as String
            case .modificationDate: return kSecAttrModificationDate as String
            case .description: return kSecAttrDescription as String
            case .comment: return kSecAttrComment as String
            case .creator: return kSecAttrCreator as String
            case .type: return kSecAttrType as String
            case .label: return kSecAttrLabel as String
            case .isInvisible: return kSecAttrIsInvisible as String
            case .isNegative: return kSecAttrIsNegative as String
            case .account: return kSecAttrAccount as String
            case .service: return kSecAttrService as String
            case .generic: return kSecAttrGeneric as String
            case .synchronizable: return kSecAttrSynchronizable as String
            }
        }

        public var value: Any {
            switch self {
            case let .access(value): return value
            case let .accessControl(value): return value
            case let .accessGroup(value): return value as CFString
            case let .accessible(value): return value.value as CFString
            case let .creationDate(value): return value as CFDate
            case let .modificationDate(value): return value as CFDate
            case let .description(value): return value as CFString
            case let .comment(value): return value as CFString
            case let .creator(value): return value as CFNumber
            case let .type(value): return value as CFNumber
            case let .label(value): return value as CFString
            case let .isInvisible(value): return value as CFBoolean
            case let .isNegative(value): return value as CFBoolean
            case let .account(value): return value as CFString
            case let .service(value): return value as CFString
            case let .generic(value): return value as CFData
            case let .synchronizable(value): return value as CFBoolean
            }
        }
    }
    public let type: CFString = Item.genericPassword
    public var attributes: [Attribute] = []
    public var data: Data?
}
