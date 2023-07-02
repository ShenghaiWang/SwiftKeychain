import Foundation

public enum AuthenticationType {
    /// Windows NT LAN Manager authentication.
    case NTLM
    /// Microsoft Network default authentication.
    case MSN
    /// Distributed Password authentication.
    case DPA
    /// Remote Password authentication.
    case RPA
    /// HTTP Basic authentication.
    case HTTPBasic
    /// HTTP Digest Access authentication.
    case HTTPDigest
    /// HTML form based authentication.
    case HTMLForm
    /// The default authentication type.
    case Default

    public var value: String {
        switch self {
        case .NTLM: return kSecAttrAuthenticationTypeNTLM as String
        case .MSN: return kSecAttrAuthenticationTypeMSN as String
        case .DPA: return kSecAttrAuthenticationTypeDPA as String
        case .RPA: return kSecAttrAuthenticationTypeRPA as String
        case .HTTPBasic: return kSecAttrAuthenticationTypeHTTPBasic as String
        case .HTTPDigest: return kSecAttrAuthenticationTypeHTTPDigest as String
        case .HTMLForm: return kSecAttrAuthenticationTypeHTMLForm as String
        case .Default: return kSecAttrAuthenticationTypeDefault as String
        }
    }
}
