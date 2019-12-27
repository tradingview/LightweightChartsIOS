import Foundation
import WebKit

public protocol ChartDelegate: class {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams)
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams)
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?)
    
}

// MARK: -
class Chart: JavaScriptObject {
    
    let jsName = "chart" + .uniqueString
    
    weak var delegate: ChartDelegate?
    
    private unowned var webView: WebView
    private let messageHandler: MessageHandler
    private weak var closureStore: ClosuresStore?
    
    init(webView: WebView, closureStore: ClosuresStore?) {
        self.webView = webView
        self.closureStore = closureStore
        messageHandler = MessageHandler()
        messageHandler.delegate = self
    }
    
    private func addSeries<T: SeriesApi & SeriesObject>(options: T.Options) -> T {
        let series = T(context: webView, closureStore: closureStore)
        
        let formattedJSON = options.formattedJSONtoJavaScript()
        let functionDeclarations = formattedJSON.functionsDeclarations
        if let customFormatter = formattedJSON.customFormatter {
            closureStore?.addMethod(customFormatter.function, forName: customFormatter.name)
        }
        
        let script = """
        \(functionDeclarations)
        var \(series.jsName) = \(jsName).add\(T.name)(\(formattedJSON.optionsScript));
        seriesArray.push({name: "\(series.jsName)", series: \(series.jsName)});
        """
        webView.evaluateScript(script, completion: nil)
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
        let name = subscriberName(for: subscription)
        let subscriberScript = subsriberScript(forName: name, subscription: subscription)
        let script = subscriberScript + "\n\(jsName).subscribe\(subscription.jsRepresentation)(\(name));"
        webView.configuration.userContentController.add(messageHandler, name: name)
        webView.evaluateScript(script, completion: nil)
    }
    
    private func unsubscribe(subsription: Subscription) {
        let name = subscriberName(for: subsription)
        let script = "\(jsName).unsubscribe\(subsription.jsRepresentation)(\(name));"
        webView.evaluateScript(script, completion: nil)
    }
    
    private func unsubscribeAll() {
        unsubscribeClick()
        unsubscribeCrosshairMove()
        unsubscribeVisibleTimeRangeChange()
    }
    
}

// MARK: - ChartApi
extension Chart: ChartApi {
    
    func remove() {
        unsubscribeAll()
        let script = "\(jsName).remove();"
        webView.evaluateScript(script, completion: nil)
    }
    
    func resize(width: Double, height: Double, forceRepaint: Bool?) {
        var parameters = "\(height), \(width)"
        if let forceRepaint = forceRepaint {
            parameters += ", \(forceRepaint)"
        }
        let script = "\(jsName).resize(\(parameters));"
        webView.evaluateScript(script, completion: nil)
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
    
    func removeSeries<T: SeriesApi & SeriesObject>(seriesApi: T) {
        let script = "\(jsName).removeSeries(\(seriesApi.jsName));"
        webView.evaluateScript(script, completion: nil)
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
    
    func subscribeVisibleTimeRangeChange() {
        subscribe(subscription: .visibleTimeRangeChange)
    }
    
    func unsubscribeVisibleTimeRangeChange() {
        unsubscribe(subsription: .visibleTimeRangeChange)
    }
    
    // MARK: Other APIs and options methods
    
    func priceScale() -> PriceScaleApi {
        let priceScale = PriceScale(context: webView)
        let script = "var \(priceScale.jsName) = \(jsName).priceScale();"
        webView.evaluateScript(script) { _, _ in
        }
        return priceScale
    }
    
    func timeScale() -> TimeScaleApi {
        let timeScale = TimeScale(context: webView)
        let script = "var \(timeScale.jsName) = \(jsName).timeScale();"
        webView.evaluateScript(script) { _, _ in
        }
        return timeScale
    }
    
    func applyOptions(options: ChartOptions) {
        let formattedJSON = options.formattedJSONtoJavaScript()
        if let priceFormatter = formattedJSON.priceFormatter {
            closureStore?.addMethod(priceFormatter.function, forName: priceFormatter.name)
        }
        if let timeFormatter = formattedJSON.timeFormatter {
            closureStore?.addMethod(timeFormatter.function, forName: timeFormatter.name)
        }
        let script = "\(formattedJSON.functionsDeclarations)\(jsName).applyOptions(\(formattedJSON.optionsScript));"
        webView.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (ChartOptions?) -> Void) {
        let script = "\(jsName).options();"
        webView.decodedResult(forScript: script, completion: completion)
    }
    
    func takeScreenshot(completion: @escaping (UIImage?) -> Void) {
        let imageFormat = "image/jpeg"
        let script = "\(jsName).takeScreenshot().toDataURL('\(imageFormat)', 1.0);"
        webView.evaluateScript(script) { (result, error) in
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
        delegate?.didVisibleTimeRangeChange(onChart: self, parameters: parameters)
    }
    
}
