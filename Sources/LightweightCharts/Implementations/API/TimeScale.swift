import Foundation

public protocol TimeScaleDelegate: AnyObject {
    
    func didVisibleTimeRangeChange(onTimeScale timeScale: TimeScaleApi, parameters: TimeRange?)
    func didVisibleLogicalRangeChange(onTimeScale timeScale: TimeScaleApi, parameters: LogicalRange?)
    func didReceiveTimeScaleSizeChangeWithParameters(onTimeScale timeScale: TimeScaleApi, parameters: Rectangle?)
    
}

// MARK: -
class TimeScale: JavaScriptObject {
    
    typealias Context = JavaScriptEvaluator & JavaScriptMessageProducer
    
    let jsName = "timeScale" + .uniqueString
    
    weak var delegate: TimeScaleDelegate?
    
    private weak var context: Context?
    weak var closureStore: ClosuresStore?
    private let messageHandler: MessageHandler
        
    init(context: Context, closureStore: ClosuresStore?) {
        self.context = context
        self.closureStore = closureStore
        messageHandler = MessageHandler()
        messageHandler.delegate = self
    }
    
    private func subsriberScript(forName name: String, subscription: Subscription) -> String {
        switch subscription {
        case .crosshairMove, .click:
            return "var \(name) = subscriberCrosshairMoveAndClickFunction('\(name)');"
        default:
            return "var \(name) = postMessageFunction('\(name)');"
        }
    }
    
    private func subscriberName(for subsription: Subscription) -> String {
        return "\(subsription.rawValue)_\(jsName)"
    }
    
    private func subscribe(subscription: Subscription) {
        let name = subscriberName(for: subscription)
        let subscriberScript = subsriberScript(forName: name, subscription: subscription)
        let script = subscriberScript + "\n\(jsName).subscribe\(subscription.jsRepresentation)(\(name));"
        context?.addMessageHandler(messageHandler, name: name)
        context?.evaluateScript(script, completion: nil)
    }
    
    private func unsubscribe(subsription: Subscription) {
        let name = subscriberName(for: subsription)
        let script = "\(jsName).unsubscribe\(subsription.jsRepresentation)(\(name));"
        context?.evaluateScript(script, completion: nil)
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
    
    func getVisibleLogicalRange(completion: @escaping (LogicalRange?) -> Void) {
        let script = "\(jsName).getVisibleLogicalRange();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func setVisibleLogicalRange(range: FromToRange<Double>) {
        let script = "\(jsName).setVisibleLogicalRange(\(range.jsonString));"
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
    
    func logicalToCoordinate(logical: Logical, completion: @escaping (Coordinate?) -> Void) {
        let script = "\(jsName).logicalToCoordinate(\(logical));"
        context?.evaluateScript(script) { (result, _) in
            completion(result as? Coordinate)
        }
    }
    
    func coordinateToLogical(x: Double, completion: @escaping (Logical?) -> Void) {
        let script = "\(jsName).coordinateToLogical(\(x));"
        context?.evaluateScript(script) { (result, _) in
            completion(result as? Logical)
        }
    }
    
    func timeToCoordinate(time: Time, completion: @escaping (Coordinate?) -> Void) {
        let script = "\(jsName).timeToCoordinate(\(time.jsonString));"
        context?.evaluateScript(script) { (result, _) in
            completion(result as? Coordinate)
        }
    }
    
    func coordinateToTime(x: Double, completion: @escaping (Time?) -> Void) {
        let script = "\(jsName).coordinateToTime(\(x));"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func subscribeVisibleTimeRangeChange() {
        subscribe(subscription: .visibleTimeRangeChange)
    }
    
    func unsubscribeVisibleTimeRangeChange() {
        unsubscribe(subsription: .visibleTimeRangeChange)
    }
    
    func subscribeVisibleLogicalRangeChange() {
        subscribe(subscription: .visibleLogicalRangeChange)
    }
    
    func unsubscribeVisibleLogicalRangeChange() {
        unsubscribe(subsription: .visibleLogicalRangeChange)
    }
    
    func applyOptions(options: TimeScaleOptions) {
        let optionsScript = options.optionsScript(for: closureStore)
        let script = """
        \(optionsScript.options)
        \(jsName).applyOptions(\(optionsScript.variableName));
        """
        context?.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (TimeScaleOptions?) -> Void) {
        let script = "\(jsName).options();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func width(completion: @escaping (Double?) -> Void) {
        let script = "\(jsName).width();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func height(completion: @escaping (Double?) -> Void) {
        let script = "\(jsName).height();"
        context?.decodedResult(forScript: script, completion: completion)
    }
    
    func subscribeSizeChange() {
        subscribe(subscription: .timeScaleSizeChange)
    }
    
    func unsubscribeSizeChange() {
        unsubscribe(subsription: .timeScaleSizeChange)
    }
}

// MARK: - MessageHandlerDelegate
extension TimeScale: MessageHandlerDelegate {
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveClickWithParameters parameters: MouseEventParams) {
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveCrosshairMoveWithParameters parameters: MouseEventParams) {
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleTimeRangeChangeWithParameters parameters: TimeRange?) {
        delegate?.didVisibleTimeRangeChange(onTimeScale: self, parameters: parameters)
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleLogicalRangeChangeWithParameters parameters: LogicalRange?) {
        delegate?.didVisibleLogicalRangeChange(onTimeScale: self, parameters: parameters)
    }
    
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveTimeScaleSizeChangeWithParameters parameters: Rectangle?) {
        delegate?.didReceiveTimeScaleSizeChangeWithParameters(onTimeScale: self, parameters: parameters)
    }
    
}
