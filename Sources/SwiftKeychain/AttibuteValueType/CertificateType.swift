import Foundation

public enum CertificateType {
    case UNKNOWN
    case X_509v1
    case X_509v2
    case X_509v3
    case PGP
    case SPKI
    case SDSIv1
    case Intel
    case X_509_ATTRIBUTE
    case X9_ATTRIBUTE
    case TUPLE
    case ACL_ENTRY
    case MULTIPLE
    case LAST
    /* Applications wishing to define their own custom certificate
     type should define and publicly document a uint32 value greater
     than the CSSM_CL_CUSTOM_CERT_TYPE */
    case CUSTOM(UInt32)
    
    var value: UInt32 {
        switch self {
        case .UNKNOWN: return           0x00
        case .X_509v1: return           0x01
        case .X_509v2: return           0x02
        case .X_509v3: return           0x03
        case .PGP: return               0x04
        case .SPKI: return              0x05
        case .SDSIv1: return            0x06
        case .Intel: return             0x08
        case .X_509_ATTRIBUTE: return   0x09
        case .X9_ATTRIBUTE: return      0x0A
        case .TUPLE: return             0x0B
        case .ACL_ENTRY: return         0x0C
        case .MULTIPLE: return          0x7FFE
        case .LAST: return              0x7FFF
        case let .CUSTOM(value): return value
        }
    }
}

