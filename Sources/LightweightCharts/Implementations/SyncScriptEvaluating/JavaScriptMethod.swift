import Foundation

public enum JavaScriptMethod<Input: Decodable, Output: Encodable> {
    case javaScript(String)
    case closure((Input) -> Output)
}

// MARK: - JavaScriptSyncMethod
extension JavaScriptMethod: JavaScriptSyncMethod {
    
    struct Payload<T: Decodable>: Decodable {
        let params: T
    }
    
    func evaluate(payloadData: Data, with decoder: JSONDecoder) -> String {
        var result = ""
        if case let .closure(closure) = self,
            let payload = try? decoder.decode(Payload<Input>.self, from: payloadData) {
            let output = closure(payload.params)
            result = (output as? String) ?? output.jsonString
        }
        return result
    }
    
}

// MARK: - JSFunction
struct JSFunction<Input: Decodable, Output: Encodable> {
    
    enum PromptFunction {
        
        case simpleFormatter
        case tickMarkFormatter
        case autoscaleInfoProvider
        
        var name: String {
            switch self {
            case .simpleFormatter:
                return "promptFunction"
            case .tickMarkFormatter:
                return "promptTickMarkFormatterFunction"
            case .autoscaleInfoProvider:
                return "promptAutoscaleInfoProviderFunction"
            }
        }
        
    }
    
    let name = "function" + .uniqueString
    let function: JavaScriptMethod<Input, Output>
    
    private let promptFunctionName: String
    
    init(prompt: PromptFunction = .simpleFormatter, function: JavaScriptMethod<Input, Output>) {
        self.function = function
        self.promptFunctionName = prompt.name
    }
    
    init(prompt: PromptFunction = .simpleFormatter, closure: @escaping (Input) -> Output) {
        self.init(prompt: prompt, function: .closure(closure))
    }
    
    init(prompt: PromptFunction = .simpleFormatter, javaScript: String) {
        self.init(prompt: prompt, function: .javaScript(javaScript))
    }
    
    func script() -> String {
        switch function {
        case let .javaScript(javaScript):
            return javaScript
        case .closure:
            return "\(promptFunctionName)('\(name)');"
        }
    }
    
}
