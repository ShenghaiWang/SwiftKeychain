import Foundation

extension SecAccess {
    public static func new(name: String,
                           trustedlist: [SecTrustedApplication],
                           accessRef: UnsafeMutablePointer<SecAccess?>) throws -> SecAccess {
        var access: SecAccess?
        let status = SecAccessCreate(name as CFString, trustedlist as CFArray, &access)
        if let access {
            return access
        } else {
            throw KeychainError.error(status: status)
        }
    }
}
