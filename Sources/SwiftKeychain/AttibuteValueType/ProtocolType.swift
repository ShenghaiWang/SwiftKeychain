import Foundation

public enum ProtocolType {
    /// FTP protocol.
    case FTP
    /// A client side FTP account.
    case FTPAccount
    /// HTTP protocol.
    case HTTP
    /// IRC protocol.
    case IRC
    /// NNTP protocol.
    case NNTP
    /// POP3 protocol.
    case POP3
    /// SMTP protocol.
    case SMTP
    /// SOCKS protocol.
    case SOCKS
    /// IMAP protocol.
    case IMAP
    /// LDAP protocol.
    case LDAP
    /// AFP over AppleTalk.
    case AppleTalk
    /// AFP over TCP.
    case AFP
    /// Telnet protocol.
    case Telnet
    /// SSH protocol.
    case SSH
    /// FTP over TLS/SSL.
    case FTPS
    /// HTTP over TLS/SSL.
    case HTTPS
    /// HTTP proxy.
    case HTTPProxy
    /// HTTPS proxy.
    case HTTPSProxy
    /// FTP proxy.
    case FTPProxy
    /// SMB protocol.
    case SMB
    /// RTSP protocol.
    case RTSP
    /// RTSP proxy.
    case RTSPProxy
    /// DAAP protocol.
    case DAAP
    /// Remote Apple Events.
    case EPPC
    /// IPP protocol.
    case IPP
    /// NNTP over TLS/SSL.
    case NNTPS
    /// LDAP over TLS/SSL.
    case LDAPS
    /// Telnet over TLS/SSL.
    case TelnetS
    /// IMAP over TLS/SSL.
    case IMAPS
    /// IRC over TLS/SSL.
    case IRCS
    /// POP3 over TLS/SSL.
    case POP3S

    public var value: String {
        switch self {
        case .FTP: return kSecAttrProtocolFTP as String
        case .FTPAccount: return kSecAttrProtocolFTPAccount as String
        case .HTTP: return kSecAttrProtocolHTTP as String
        case .IRC: return kSecAttrProtocolIRC as String
        case .NNTP: return kSecAttrProtocolNNTP as String
        case .POP3: return kSecAttrProtocolPOP3 as String
        case .SMTP: return kSecAttrProtocolSMTP as String
        case .SOCKS: return kSecAttrProtocolSOCKS as String
        case .IMAP: return kSecAttrProtocolIMAP as String
        case .LDAP: return kSecAttrProtocolLDAP as String
        case .AppleTalk: return kSecAttrProtocolAppleTalk as String
        case .AFP: return kSecAttrProtocolAFP as String
        case .Telnet: return kSecAttrProtocolTelnet as String
        case .SSH: return kSecAttrProtocolSSH as String
        case .FTPS: return kSecAttrProtocolFTPS as String
        case .HTTPS: return kSecAttrProtocolHTTPS as String
        case .HTTPProxy: return kSecAttrProtocolHTTPProxy as String
        case .HTTPSProxy: return kSecAttrProtocolHTTPSProxy as String
        case .FTPProxy: return kSecAttrProtocolFTPProxy as String
        case .SMB: return kSecAttrProtocolSMB as String
        case .RTSP: return kSecAttrProtocolRTSP as String
        case .RTSPProxy: return kSecAttrProtocolRTSPProxy as String
        case .DAAP: return kSecAttrProtocolDAAP as String
        case .EPPC: return kSecAttrProtocolEPPC as String
        case .IPP: return kSecAttrProtocolIPP as String
        case .NNTPS: return kSecAttrProtocolNNTPS as String
        case .LDAPS: return kSecAttrProtocolLDAPS as String
        case .TelnetS: return kSecAttrProtocolTelnetS as String
        case .IMAPS: return kSecAttrProtocolIMAPS as String
        case .IRCS: return kSecAttrProtocolIRCS as String
        case .POP3S: return kSecAttrProtocolPOP3S as String
        }
    }
}
