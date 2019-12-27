import Foundation

class TimeScale: JavaScriptObject {
    
    let jsName = "timeScale" + .uniqueString
    
    private weak var context: JavaScriptEvaluator?
        
    init(context: JavaScriptEvaluator) {
        self.context = context
    }
    
}

// MARK: - TimeScaleApi
extension TimeScale: TimeScaleApi {
    
    func scrollPosition(completion: @escaping (Double?) -> Void) {
        let script = "\(jsName).scrollPosition();"
        context?.evaluateScript(script) { (result, _) in
            completion(result as? Double)
        }
    }
    
    func scrollToPosition(position: Double, animated: Bool) {
        let script = "\(jsName).scrollToPosition(\(position), \(animated));"
        context?.evaluateScript(script, completion: nil)
    }
    
    func scrollToRealTime() {
        let script = "\(jsName).scrollToRealTime();"
        context?.evaluateScript(script, completion: nil)
    }
    
    func getVisibleRange(completion: @escaping (TimeRange?) -> Void) {
        let script = "\(jsName).getVisibleRange();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func setVisibleRange(range: TimeRange) {
        let script = "\(jsName).setVisibleRange(\(range.jsonString));"
        context?.evaluateScript(script, completion: nil)
    }
    
    func resetTimeScale() {
        let script = "\(jsName).resetTimeScale();"
        context?.evaluateScript(script, completion: nil)
    }
    
    func fitContent() {
        let script = "\(jsName).fitContent();"
        context?.evaluateScript(script, completion: nil)
    }
    
    func applyOptions(options: TimeScaleOptions) {
        let script = "\(jsName).applyOptions(\(options.jsonString));"
        context?.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (TimeScaleOptions?) -> Void) {
        let script = "\(jsName).options();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
}
