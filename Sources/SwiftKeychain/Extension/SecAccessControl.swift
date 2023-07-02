import Foundation

extension SecAccessControl {
    public static func new(using allocator: CFAllocator? = nil,
                           protection: AccessibilityValue,
                           flags: SecAccessControlCreateFlags) throws -> SecAccessControl {
        var error: Unmanaged<CFError>?
        if let access = SecAccessControlCreateWithFlags(allocator,
                                                        protection.value as CFString,
                                                        flags,
                                                        &error) {
            return access
        } else {
            throw KeychainError.error(error: error)
        }
    }
}
