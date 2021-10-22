import Foundation

public class PriceLine: JavaScriptObject {
    
    let jsName = "priceLine" + .uniqueString
    weak var context: JavaScriptEvaluator?
    
    init(context: JavaScriptEvaluator) {
        self.context = context
    }
    
}

// MARK: - PriceLineApi
extension PriceLine: PriceLineApi {
    
    public func applyOptions(options: PriceLineOptions) {
        let script = "\(jsName).applyOptions(\(options.jsonString));"
        context?.evaluateScript(script, completion: nil)
    }
    
    public func options(completion: @escaping (PriceLineOptions?) -> Void) {
        let script = "\(jsName).options();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
}
