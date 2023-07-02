import Foundation
import LocalAuthentication

public enum SearchAttribute: KeyValue {
    /// A key whose value indicates a policy with which a matching certificate or identity must verify.
    case policy(SecPolicy)
    /// A key whose value indicates a list of items to search.
    case itemList([AnyObject])
    /// A key whose value indicates a list of items to search.
    case searchList([AnyObject])
    /// A key whose value is a string to match against a certificate or identity's issuers.
    case issuers(Data)
    /// A key whose value is a string to match against a certificate or identity's email address.
    case emailAddressIfPresent(String)
    /// A key whose value is a string to look for in a certificate or identity's subject.
    case subjectContains(String)
    /// A key whose value is a string to match against the beginning of a certificate or identity's subject.
    case subjectStartsWith(String)
    /// A key whose value is a string to match against the end of a certificate or identity's subject.
    case subjectEndsWith(String)
    /// A key whose value is a string to exactly match a certificate or identity's subject.
    case subjectWholeString(String)
    /// A key whose value is a Boolean indicating whether case-insensitive matching is performed.
    case caseInsensitive(Bool)
    /// A key whose value is a Boolean indicating whether diacritic-insensitive matching is performed.
    case diacriticInsensitive(Bool)
    /// A key whose value is a Boolean indicating whether width-insensitive matching is performed.
    case widthInsensitive(Bool)
    /// A key whose value is a Boolean indicating whether untrusted certificates should be returned.
    case trustedOnly(Bool)
    /// A key whose value indicates the validity date.
    case validOnDate(Date)
    /// A key whose value indicates the match limit.
    case limit(MatchLimit)
    /// A key whose value is an array of items to search.
    case useItemList([AnyObject])
    /// A key whose value is a keychain to operate on.
    case useKeychain(AnyObject)
    /// A key whose value indicates whether the user may be prompted for authentication.
    case useAuthenticationUI(AuthenticationUI)
    /// A key whose value indicates a local authentication context to use.
    case useAuthenticationContext(LAContext)
    /// A key whose value indicates whether to treat macOS keychain items like iOS keychain items.
    case useDataProtectionKeychain(Bool)

    public var key: String {
        switch self {
        case .policy: return kSecMatchPolicy as String
        case .itemList: return kSecMatchItemList as String
        case .searchList: return kSecMatchSearchList as String
        case .issuers: return kSecMatchIssuers as String
        case .emailAddressIfPresent: return kSecMatchEmailAddressIfPresent as String
        case .subjectContains: return kSecMatchSubjectContains as String
        case .subjectStartsWith: return kSecMatchSubjectStartsWith as String
        case .subjectEndsWith: return kSecMatchSubjectEndsWith as String
        case .subjectWholeString: return kSecMatchSubjectWholeString as String
        case .caseInsensitive: return kSecMatchCaseInsensitive as String
        case .diacriticInsensitive: return kSecMatchDiacriticInsensitive as String
        case .widthInsensitive: return kSecMatchWidthInsensitive as String
        case .trustedOnly: return kSecMatchTrustedOnly as String
        case .validOnDate: return kSecMatchValidOnDate as String
        case .limit: return kSecMatchLimit as String
        case .useItemList: return kSecUseItemList as String
        case .useKeychain: return kSecUseKeychain as String
        case .useAuthenticationUI: return kSecUseAuthenticationUI as String
        case .useAuthenticationContext: return kSecUseAuthenticationContext as String
        case .useDataProtectionKeychain: return kSecUseDataProtectionKeychain as String
        }
    }

    public var value: Any {
        switch self {
        case let .policy(value): return value
        case let .itemList(value): return value
        case let .searchList(value): return value
        case let .issuers(value): return value as CFData
        case let .emailAddressIfPresent(value): return value as CFString
        case let .subjectContains(value): return value as CFString
        case let .subjectStartsWith(value): return value as CFString
        case let .subjectEndsWith(value): return value as CFString
        case let .subjectWholeString(value): return value as CFString
        case let .caseInsensitive(value): return value as CFBoolean
        case let .diacriticInsensitive(value): return value as CFBoolean
        case let .widthInsensitive(value): return value as CFBoolean
        case let .trustedOnly(value): return value as CFBoolean
        case let .validOnDate(value): return value as CFDate
        case let .limit(value): return value.value as CFString
        case let .useItemList(value): return value
        case let .useKeychain(value): return value
        case let .useAuthenticationUI(value): return value.value as CFString
        case let .useAuthenticationContext(value): return value
        case let .useDataProtectionKeychain(value): return value as CFBoolean
        }
    }
}

public enum MatchLimit {
    case one
    case all

    public var value: CFString {
        switch self {
        case .one: return kSecMatchLimitOne
        case .all: return kSecMatchLimitAll
        }
    }
}

public enum AuthenticationUI {
    case skip

    public var value: CFString {
        return kSecUseAuthenticationUISkip
    }
}

extension Array where Element == SearchAttribute {
    public var query: [(String, Any)] {
        map({ ($0.key, $0.value) }) as [(String, Any)]
    }
}
