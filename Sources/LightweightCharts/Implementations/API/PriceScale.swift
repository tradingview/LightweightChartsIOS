import Foundation

class PriceScale: JavaScriptObject {
    
    let jsName = "priceScale" + .uniqueString
    
    private weak var context: JavaScriptEvaluator?
        
    init(context: JavaScriptEvaluator) {
        self.context = context
    }
    
}

// MARK: - PriceScaleApi
extension PriceScale: PriceScaleApi {
    
    func applyOptions(options: PriceScaleOptions) {
        let script = "\(jsName).applyOptions(\(options.jsonString));"
        context?.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (PriceScaleOptions?) -> Void) {
        let script = "\(jsName).options();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func width(completion: @escaping (Double?) -> Void) {
        let script = "\(jsName).width();"
        context?.evaluateScript(script) { result, _ in
            completion(result as? Double)
        }
    }
    
}
