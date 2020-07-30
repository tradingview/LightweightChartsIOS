import Foundation

public enum JavaScriptMethod<T: Decodable> {
    case javaScript(String)
    case closure((T) -> String)
}

// MARK: - JavaScriptSyncMethod
extension JavaScriptMethod: JavaScriptSyncMethod {
    
    struct Payload<T: Decodable>: Decodable {
        let params: T
    }
    
    func evaluate(payloadData: Data, with decoder: JSONDecoder) -> String {
        var result = ""
        if case let .closure(closure) = self,
            let payload = try? decoder.decode(Payload<T>.self, from: payloadData) {
            result = closure(payload.params)
        }
        return result
    }
    
}

// MARK: - JSFunction
struct JSFunction<T: Decodable> {
    
    let name = "function" + .uniqueString
    let function: JavaScriptMethod<T>
    
    init(function: JavaScriptMethod<T>) {
        self.function = function
    }
    
    init(closure: @escaping (T) -> String) {
        self.init(function: .closure(closure))
    }
    
    init(javaScript: String) {
        self.init(function: .javaScript(javaScript))
    }
    
    func script() -> String {
        switch function {
        case let .javaScript(javaScript):
            return javaScript
        case .closure:
            return "promptFunction('\(name)');"
        }
    }
    
}
