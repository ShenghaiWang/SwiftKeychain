import Foundation

public protocol ItemValue {
    associatedtype Attibute: KeyValue
    var attributes: [Attibute] { get set }
    var type: CFString { get }
    var data: Data? { get }
}

extension ItemValue {
    public var query: [String: Any] {
        let result: [String: Any]
        if let data {
            result = [kSecClass as String: type,
                      kSecValueData as String: data]
        } else {
            result = [kSecClass as String: type]
        }
        return result
            .merging(attributes.map({ ($0.key, $0.value) })) { first, _ in first }
    }
}
