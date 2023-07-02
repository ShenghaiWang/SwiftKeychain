import Foundation

public enum CertificateEncoding {
    case UNKNOWN
    case CUSTOM
    case BER
    case DER
    case NDR
    case SEXPR
    case PGP
    case MULTIPLE
    case LAST
    /* Applications wishing to define their own custom certificate
     encoding should create a uint32 value greater than the
     CSSM_CL_CUSTOM_CERT_ENCODING */
    case CL_CUSTOM(UInt32)

    var value: UInt32 {
        switch self {
        case .UNKNOWN: return        0x00
        case .CUSTOM: return            0x01
        case .BER: return            0x02
        case .DER: return            0x03
        case .NDR: return            0x04
        case .SEXPR: return            0x05
        case .PGP: return            0x06
        case .MULTIPLE: return        0x7FFE
        case .LAST: return            0x7FFF
        case let .CL_CUSTOM(value): return value
        }
    }
}
