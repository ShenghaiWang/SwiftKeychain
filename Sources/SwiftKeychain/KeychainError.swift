import Foundation

public enum KeychainError: Error {
    case error(error: Unmanaged<CFError>? = nil, status: OSStatus? = nil)
}
