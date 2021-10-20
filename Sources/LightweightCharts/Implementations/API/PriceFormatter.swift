import Foundation

class PriceFormatter: JavaScriptObject {
    
    let jsName = "priceFormatter" + .uniqueString
    
    private weak var context: JavaScriptEvaluator?
        
    init(context: JavaScriptEvaluator) {
        self.context = context
    }
    
}

// MARK: - PriceFormatterApi
extension PriceFormatter: PriceFormatterApi {
    
    func format(price: BarPrice, completion: @escaping (String?) -> Void) {
        let script = "\(jsName).format(\(price));"
        context?.evaluateScript(script) { (result, _) in
            completion(result as? String)
        }
    }
    
}
