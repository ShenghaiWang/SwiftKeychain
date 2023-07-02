import Foundation

extension SecPolicy {
    /// Returns a policy object for the default X.509 policy.
    public static func createBasicX509() -> SecPolicy {
        SecPolicyCreateBasicX509()
    }

    /// Returns a policy object for evaluating SSL certificate chains.
    ///
    /// - Parameters:
    ///   - server: Specify true on the client side to return a policy for SSL server certificates.
    ///   - hostname: If you specify a value for this parameter, the policy will require the specified value to match the host name in the leaf certificate.
    public static func createSSL(server: Bool, hostname: CFString?) -> SecPolicy {
        SecPolicyCreateSSL(server, hostname)
    }

    /// Returns a policy object for checking revocation of certificates.
    ///
    /// - Parameters:
    ///   - revocationFlags: Flags that specify revocation checking options. See Revocation Policy Constants for a list of possible values.
    public static func createRevocation(revocationFlags: RevocationFlags) -> SecPolicy? {
        SecPolicyCreateRevocation(revocationFlags.value)
    }
}


public enum RevocationFlags {
    /// Perform revocation checking using the CRL (Certification Revocation List) method.
    case CRLMethod
    /// Consult only locally cached replies; do not use network access.
    case NetworkAccessDisabled
    /// Perform revocation checking using OCSP (Online Certificate Status Protocol).
    case OCSPMethod
    /// Prefer CRL revocation checking over OCSP; by default, OCSP is preferred.
    case PreferCRL
    /// Require a positive response to pass the policy.
    case RequirePositiveResponse
    /// Perform either OCSP or CRL checking.
    case UseAnyAvailableMethod

    public var value: CFOptionFlags {
        switch self {
        case .CRLMethod: return kSecRevocationCRLMethod
        case .NetworkAccessDisabled: return kSecRevocationNetworkAccessDisabled
        case .OCSPMethod: return kSecRevocationOCSPMethod
        case .PreferCRL: return kSecRevocationPreferCRL
        case .RequirePositiveResponse: return kSecRevocationRequirePositiveResponse
        case .UseAnyAvailableMethod: return kSecRevocationUseAnyAvailableMethod
        }
    }
}
