import Foundation

public struct OperationResult {
    public enum Attibute {
        // General
        ///A key with a value that indicates access control list settings for the item.
        case access
        ///A key with a value that’s an access control instance indicating access control settings for the item.
        case accessControl
        ///A key with a value that indicates when the keychain item is accessible.
        case accessible
        ///A key with a value that’s a string indicating the access group the item is in.
        case accessGroup
        ///A key with a value that’s a string indicating whether the item synchronizes through iCloud.
        case synchronizable
        ///A key with a value that indicates the item's creation date.
        case creationDate
        ///A key with a value that indicates the item's most recent modification date.
        case modificationDate
        ///A key with a value that’s a string indicating the item's description.
        case description
        ///A key with a value that’s a string indicating a comment associated with the item.
        case comment
        ///A key with a value that indicates the item's creator.
        case creator
        ///A key with a value that indicates the item's type.
        case type
        ///A key with a value that’s a string indicating the item's label.
        case label
        ///A key with a value that’s a Boolean indicating the item's visibility.
        case isInvisible
        ///A key with a value that’s a Boolean indicating whether the item has a valid password.
        case isNegative
        ///A key with a value that’s a string that provides a sync view hint.
        case syncViewHint
        /// kSecAttrPersistantReference
        case persistantReference
        /// kSecAttrPersistantReference
        case persistentReference
        ///A key with a value that indicates whether to store the data in a keychain available to anyone who uses the device.
        /// only available for tvos(16.0) ATM, ignore it
//        case useUserIndependentKeychain

        // password

        /// A key whose value is a string indicating the item's account name.
        case account
        /// A key whose value is a string indicating the item's service.
        case service
        /// A key whose value indicates the item's user-defined attributes.
        case generic
        /// A key whose value is a string indicating the item's security domain.
        case securityDomain
        /// A key whose value is a string indicating the item's server.
        case server
        /// A key whose value indicates the item's protocol.
        case `protocol`
        /// A key whose value indicates the item's authentication scheme.
        case authenticationType
        /// A key whose value indicates the item's port.
        case port
        /// A key whose value is a string indicating the item's path attribute.
        case path

        /// A key whose value indicates the item's subject name.
        case subject
        /// A key whose value indicates the item's issuer.
        case issuer
        /// A key whose value indicates the item's serial number.
        case serialNumber
        /// A key whose value indicates the item's subject key ID.
        case subjectKeyID
        /// A key whose value indicates the item's public key hash.
        case publicKeyHash
        /// A key whose value indicates the item's certificate type.
        case certificateType
        /// A key whose value indicates the item's certificate encoding.
        case certificateEncoding
        // Cryptographic Key Attribute Keys
        /// A key whose value indicates the item's cryptographic key class.
        case keyClass
        /// A key whose value indicates the item's application label.
        case applicationLabel
        /// A key whose value indicates the item's private tag.
        case applicationTag
        /// A key whose value indicates the item's algorithm.
        case keyType
        /// A key whose value indicates the item's pseudorandom function.
        case PRF
        /// A key whose value indicates the salt to use for this item.
        case salt
        /// A key whose value indicates the number of rounds to run the pseudorandom function.
        case rounds
        /// A key whose value indicates the number of bits in a cryptographic key.
        case keySizeInBits
        /// A key whose value indicates the effective number of bits in a cryptographic key.
        case effectiveKeySize
        /// A key whose value indicates that a cryptographic key is in an external store.
        case tokenID
        // Cryptographic Key Usage Attribute Keys
        /// A key whose value indicates the item's permanence.
        case isPermanent
        /// A key whose value indicates the item's sensitivity.
        case isSensitive
        /// A key whose value indicates the item's extractability.
        case isExtractable
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for encryption.
        case canEncrypt
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for decryption.
        case canDecrypt
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for derivation.
        case canDerive
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for digital signing.
        case canSign
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for signature verification.
        case canVerify
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for wrapping.
        case canWrap
        /// A key whose value is a Boolean that indicates whether the cryptographic key can be used for unwrapping.
        case canUnwrap

        /// A key whose value is the item's data.
        case data
        /// A key whose value is a reference to the item.
        case rRef
        /// A key whose value is a persistent reference to the item.
        case persistentRef

        public var value: String {
            switch self {
            case .access: return kSecAttrAccess as String
            case .accessControl: return kSecAttrAccessControl as String
            case .accessible: return kSecAttrAccessible as String
            case .accessGroup: return kSecAttrAccessGroup as String
            case .synchronizable: return kSecAttrSynchronizable as String
            case .creationDate: return kSecAttrCreationDate as String
            case .modificationDate: return kSecAttrModificationDate as String
            case .description: return kSecAttrDescription as String
            case .comment: return kSecAttrComment as String
            case .creator: return kSecAttrCreator as String
            case .type: return kSecAttrType as String
            case .label: return kSecAttrLabel as String
            case .isInvisible: return kSecAttrIsInvisible as String
            case .isNegative: return kSecAttrIsNegative as String
            case .syncViewHint: return kSecAttrSyncViewHint as String
            case .persistantReference: return kSecAttrPersistantReference as String
            case .persistentReference: return kSecAttrPersistentReference as String
//            case .useUserIndependentKeychain: return kSecUseUserIndependentKeychain as String

            case .account: return kSecAttrAccount as String
            case .service: return kSecAttrService as String
            case .generic: return kSecAttrGeneric as String
            case .securityDomain: return kSecAttrSecurityDomain as String
            case .server: return kSecAttrServer as String
            case .protocol: return kSecAttrProtocol as String
            case .authenticationType: return kSecAttrAuthenticationType as String
            case .port: return kSecAttrPort as String
            case .path: return kSecAttrPath as String

            case .subject: return kSecAttrSubject as String
            case .issuer: return kSecAttrIssuer as String
            case .serialNumber: return kSecAttrSerialNumber as String
            case .subjectKeyID: return kSecAttrSubjectKeyID as String
            case .publicKeyHash: return kSecAttrPublicKeyHash as String
            case .certificateType: return kSecAttrCertificateType as String
            case .certificateEncoding: return kSecAttrCertificateEncoding as String
            case .keyClass: return kSecAttrKeyClass as String
            case .applicationLabel: return kSecAttrApplicationLabel as String
            case .applicationTag: return kSecAttrApplicationTag as String
            case .keyType: return kSecAttrKeyType as String
            case .PRF: return kSecAttrPRF as String
            case .salt: return kSecAttrSalt as String
            case .rounds: return kSecAttrRounds as String
            case .keySizeInBits: return kSecAttrKeySizeInBits as String
            case .effectiveKeySize: return kSecAttrEffectiveKeySize as String
            case .tokenID: return kSecAttrTokenID as String
            case .isPermanent: return kSecAttrIsPermanent as String
            case .isSensitive: return kSecAttrIsSensitive as String
            case .isExtractable: return kSecAttrIsExtractable as String
            case .canEncrypt: return kSecAttrCanEncrypt as String
            case .canDecrypt: return kSecAttrCanDecrypt as String
            case .canDerive: return kSecAttrCanDerive as String
            case .canSign: return kSecAttrCanSign as String
            case .canVerify: return kSecAttrCanVerify as String
            case .canWrap: return kSecAttrCanWrap as String
            case .canUnwrap: return kSecAttrCanUnwrap as String

            case .data: return kSecValueData as String
            case .rRef: return kSecValueRef as String
            case .persistentRef: return kSecValuePersistentRef as String
            }
        }
    }

    let status: OSStatus?
    let result: AnyObject?
}

extension OperationResult {
    public var isSuccessful: Bool {
        guard let status else { return true } // Some operation won't return status
        return status == errSecSuccess
    }

    public var hasValue: Bool {
        result != nil
    }

    public var data: Data? {
        (result as? Data) ?? self[.data]
    }

    subscript<T>(attribute: OperationResult.Attibute) -> T? {
        guard let result else { return nil }
        if let dict = result as? [String: Any] {
            return dict[attribute.value] as? T
        }
        return self[0, attribute]
    }

    subscript<T>(index: Int, attribute: OperationResult.Attibute) -> T? {
        if CFArrayGetTypeID() == CFGetTypeID(result) {
            if let array = (result as? NSArray) as? [[String: Any]],
                array.count > index {
                return array[index][attribute.value] as? T
            } else {
                return nil
            }
        }
        return nil
    }
}
