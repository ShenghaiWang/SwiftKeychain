import Foundation

public struct Certificate: ItemValue {
    public enum Attribute: KeyValue {
        case access(SecAccess)
        case accessGroup(String)
        case accessible(AccessibilityValue)
        case certificateType(CertificateType)
        case certificateEncoding(CertificateEncoding)
        case label(String)
        case subject(Data)
        case issuer(Data)
        case serialNumber(Data)
        case subjectKeyID(Data)
        case publicKeyHash(Data)

        public var key: String {
            switch self {
            case .access: return kSecAttrAccess as String
            case .accessGroup: return kSecAttrAccessGroup as String
            case .accessible: return kSecAttrAccessible as String
            case .certificateType: return kSecAttrCertificateType as String
            case .certificateEncoding: return kSecAttrCertificateEncoding as String
            case .label: return kSecAttrLabel as String
            case .subject: return kSecAttrSubject as String
            case .issuer: return kSecAttrIssuer as String
            case .serialNumber: return kSecAttrSerialNumber as String
            case .subjectKeyID: return kSecAttrSubjectKeyID as String
            case .publicKeyHash: return kSecAttrPublicKeyHash as String
            }
        }

        public var value: Any {
            switch self {
            case let .access(value): return value
            case let .accessGroup(value): return value as CFString
            case let .accessible(value): return value.value as CFString
            case let .certificateType(value): return value.value as CFNumber
            case let .certificateEncoding(value): return value.value as CFNumber
            case let .label(value): return value as CFString
            case let .subject(value): return value as CFData
            case let .issuer(value): return value as CFData
            case let .serialNumber(value): return value as CFData
            case let .subjectKeyID(value): return value as CFData
            case let .publicKeyHash(value): return value as CFData
            }
        }
    }
    public let type: CFString = Item.certificate
    public var attributes: [Attribute] = []
    public var data: Data?
}
