import Foundation

public enum AccessibilityValue {
    /// The data in the keychain can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
    case whenPasscodeSetThisDeviceOnly
    /// The data in the keychain item can be accessed only while the device is unlocked by the user.
    case whenUnlockedThisDeviceOnly
    /// The data in the keychain item can be accessed only while the device is unlocked by the user.
    case whenUnlocked
    /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
    case afterFirstUnlockThisDeviceOnly
    /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
    case afterFirstUnlock

    public var value: String {
        switch self {
        case .whenPasscodeSetThisDeviceOnly: return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly as String
        case .whenUnlockedThisDeviceOnly: return kSecAttrAccessibleWhenUnlockedThisDeviceOnly as String
        case .whenUnlocked: return kSecAttrAccessibleWhenUnlocked as String
        case .afterFirstUnlockThisDeviceOnly: return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly as String
        case .afterFirstUnlock: return kSecAttrAccessibleAfterFirstUnlock as String
        }
    }
}
