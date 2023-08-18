import Foundation
import WebKit

public protocol ChartDelegate: AnyObject {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams)
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams)
    
}

// MARK: -
class Chart: JavaScriptObject {
    
    enum SubscribeState: CaseIterable {
        case declared
        case active
    }
    
    typealias Context = JavaScriptEvaluator & JavaScriptMessageProducer
    
    let jsName = "chart" + .uniqueString
    
    weak var delegate: ChartDelegate?
    
    private unowned var context: Context
    private let messageHandler: MessageHandler
    private weak var closureStore: ClosuresStore?
    private var activeSubscriptions: Dictionary<Subscription,SubscribeState> = [:]
    
    init(context: Context, closureStore: ClosuresStore?) {
        self.context = context
        self.closureStore = closureStore
        messageHandler = MessageHandler()
        messageHandler.delegate = self
    }
    
    private func addSeries<T: SeriesApi & SeriesObject>(options: T.Options) -> T {
        let series = T(context: context, closureStore: closureStore)
        let optionsScript = options.optionsScript(for: closureStore)
        let script = """
        \(optionsScript.options)
        var \(series.jsName) = \(jsName).add\(T.name)(\(optionsScript.variableName));
        seriesArray.push({name: "\(series.jsName)", series: \(series.jsName)});
        """
        context.evaluateScript(script, completion: nil)
        return series
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
        if (activeSubscriptions[subscription] == .active) {
            NSLog("LWChart: double subscribe detected \(subscription)")
            return
        }
        let name = subscriberName(for: subscription)
        var subscriberScript = ""
        if (activeSubscriptions[subscription] != .declared) {
            subscriberScript = subsriberScript(forName: name, subscription: subscription)
            context.addMessageHandler(messageHandler, name: name)
        }
        let script = subscriberScript + "\n\(jsName).subscribe\(subscription.jsRepresentation)(\(name));"
        context.evaluateScript(script, completion: nil)
        activeSubscriptions[subscription] = .active
    }
    
    private func unsubscribe(subsription: Subscription) {
        if (activeSubscriptions[subsription] != .active) {
            NSLog("LWChart: double unsubscribe detected \(subsription)")
            return
        }
        let name = subscriberName(for: subsription)
        let script = "\(jsName).unsubscribe\(subsription.jsRepresentation)(\(name));"
        context.evaluateScript(script, completion: nil)
        activeSubscriptions[subsription] = .declared
    }
    
    private func unsubscribeAll() {
        unsubscribeClick()
        unsubscribeCrosshairMove()
    }
    
}

// MARK: - ChartApi
extension Chart: ChartApi {
    
    func remove() {
        unsubscribeAll()
        let script = "\(jsName).remove();"
        context.evaluateScript(script, completion: nil)
    }
    
    func resize(width: Double, height: Double, forceRepaint: Bool?) {
        var parameters = "\(width), \(height)"
        if let forceRepaint = forceRepaint {
            parameters += ", \(forceRepaint)"
        }
        let script = "\(jsName).resize(\(parameters));"
        context.evaluateScript(script, completion: nil)
    }

    // MARK: Series methods
    
    func addAreaSeries(options: AreaSeries.Options?) -> AreaSeries {
        addSeries(options: options ?? AreaSeries.Options())
    }
    
    func addBarSeries(options: BarSeries.Options?) -> BarSeries {
        addSeries(options: options ?? BarSeries.Options())
    }
    
    func addCandlestickSeries(options: CandlestickSeries.Options?) -> CandlestickSeries {
        addSeries(options: options ?? CandlestickSeries.Options())
    }
    
    func addHistogramSeries(options: HistogramSeries.Options?) -> HistogramSeries {
        addSeries(options: options ?? HistogramSeries.Options())
    }
    
    func addLineSeries(options: LineSeries.Options?) -> LineSeries {
        addSeries(options: options ?? LineSeries.Options())
    }
    
    func addBaselineSeries(options: BaselineSeries.Options?) -> BaselineSeries {
        addSeries(options: options ?? BaselineSeries.Options())
    }
    
    func removeSeries<T: SeriesApi & SeriesObject>(seriesApi: T) {
        let script = "\(jsName).removeSeries(\(seriesApi.jsName));"
        context.evaluateScript(script, completion: nil)
    }
    
    // MARK: Subscriptions
    
    func subscribeClick() {
        subscribe(subscription: .click)
    }
    
    func unsubscribeClick() {
        unsubscribe(subsription: .click)
    }
    
    func subscribeCrosshairMove() {
        subscribe(subscription: .crosshairMove)
    }
    
    func unsubscribeCrosshairMove() {
        unsubscribe(subsription: .crosshairMove)
    }
    
    // MARK: Other APIs and options methods
    
    func priceScale(priceScaleId: String?) -> PriceScaleApi {
        let priceScale = PriceScale(context: context)
        let priceScaleId = priceScaleId ?? ""
        let script = "var \(priceScale.jsName) = \(jsName).priceScale(\(priceScaleId));"
        context.evaluateScript(script) { _, _ in
        }
        return priceScale
    }
    
    func timeScale() -> TimeScaleApi {
        let timeScale = TimeScale(context: context, closureStore: closureStore)
        let script = "var \(timeScale.jsName) = \(jsName).timeScale();"
        context.evaluateScript(script) { _, _ in
        }
        return timeScale
    }
    
    func applyOptions(options: ChartOptions) {
        let optionsScript = options.optionsScript(for: closureStore)
        let script = """
        \(optionsScript.options)
        \(jsName).applyOptions(\(optionsScript.variableName));
        """
        context.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (ChartOptions?) -> Void) {
        let script = "\(jsName).options();"
        context.decodedResult(forScript: script, completion: completion)
    }
    
    func takeScreenshot(completion: @escaping (UIImage?) -> Void) {
        let imageFormat = "image/jpeg"
        let script = "\(jsName).takeScreenshot().toDataURL('\(imageFormat)', 1.0);"
        context.evaluateScript(script) { (result, error) in
            DispatchQueue.global().async {
                var image: UIImage?
                if error == nil,
                    let dataString = result as? String,
                    !dataString.isEmpty {
                    // format:
                    // data:[<mediatype>][;base64],<data>
                    // example
                    // (data:image/jpeg;base64,/9j/4AAQSkZJRgA
                    let countToRemove = "data:\(imageFormat);base64,".count
                    let index = dataString.index(dataString.startIndex, offsetBy: countToRemove)
                    let base64String = String(dataString[index...])
                    if let data = Data(base64Encoded: base64String) {
                        if let screenshot = UIImage(data: data) {
                            image = screenshot
                        }
                    }
                }
                completion(image)
            }
        }
    }
    
}

// MARK: - MessageHandlerDelegate
extension Chart: MessageHandlerDelegate {
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveClickWithParameters parameters: MouseEventParams) {
        delegate?.didClick(onChart: self, parameters: parameters)
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveCrosshairMoveWithParameters parameters: MouseEventParams) {
        delegate?.didCrosshairMove(onChart: self, parameters: parameters)
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleTimeRangeChangeWithParameters parameters: TimeRange?) {
    }
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleLogicalRangeChangeWithParameters parameters: LogicalRange?) {
    }
    
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveTimeScaleSizeChangeWithParameters parameters: Rectangle?) {
    }
}
