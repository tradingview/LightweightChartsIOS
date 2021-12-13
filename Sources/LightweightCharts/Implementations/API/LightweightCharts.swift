import Foundation
import WebKit

public protocol LightweightChartsDelegate: AnyObject {
    
    func lightweightChartsDidLoad(_ lightweightCharts: LightweightCharts)
    func lightweightCharts(_ lightweightCharts: LightweightCharts, didFailLoadWithError error: Error)
    
}

/// Lightweight Charting Library
public class LightweightCharts: UIView {
    
    /**
     * Loding delegate for chart. Tells the delegate when the chart has loaded or when the load failed. Weak reference.
     */
    public weak var loadDelegate: LightweightChartsDelegate?
    public weak var errorDelegate: JavaScriptErrorDelegate? {
        get { webView.errorDelegate }
        set { webView.errorDelegate = newValue }
    }
    
    private let webView: WebView = WebView()
    private let promptHandler: PromptHandler = PromptHandler()
    private var chart: ChartApi!
    
    public required init(
        frame: CGRect = .zero,
        options: ChartOptions = ChartOptions(),
        loadDelegate: LightweightChartsDelegate? = nil
    ) {
        super.init(frame: frame)
        
        self.loadDelegate = loadDelegate
        setupChart(options: options)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupChart(options: ChartOptions())
    }
    
    /// This function is the main entry point of the Lightweight Charting Library
    /// - Parameter options: This function is the main entry point of the Lightweight Charting Library
    /// - Returns: an interface to the created chart
    private func createChart(options: ChartOptions?) -> ChartApi {
        let chart = Chart(context: webView, closureStore: promptHandler)
        let options = options ?? ChartOptions()
        let optionsScript = options.optionsScript(for: promptHandler)
        let script = """
        \(optionsScript.options)
        var \(chart.jsName) = LightweightCharts.createChart(document.body, \(optionsScript.variableName));
        var seriesArray = [];
        """
        webView.evaluateScript(script) { [weak self] (_, error) in
            guard let self = self else { return }
            if let error = error {
                self.loadDelegate?.lightweightCharts(self, didFailLoadWithError: error)
            } else {
                self.loadDelegate?.lightweightChartsDidLoad(self)
            }
        }
        self.chart = chart
        return chart
    }
    
    public func clearWebViewBackground() {
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        webView.frame = bounds
        let width = bounds.width
        let height = bounds.height
        chart.resize(width: width, height: height, forceRepaint: nil)
    }
    
    private func setupChart(options: ChartOptions) {
        setupWebView()
        loadLibrary()
        loadWrapperFunctions()
        chart = createChart(options: options)
    }
    
    private func setupWebView() {
        webView.uiDelegate = promptHandler
        
        let scrollView = webView.scrollView
        if #available(iOS 11, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
        scrollView.isScrollEnabled = false
        
        addSubview(webView)
        
        evaluateScriptFromFile(withFileName: "content-setup")
    }
    
    private func loadLibrary() {
        evaluateScriptFromFile(withFileName: "lightweight-charts")
    }
    
    private func loadWrapperFunctions() {
        evaluateScriptFromFile(withFileName: "wrapper_functions")
    }
    
    private func loadScript(withName fileName: String) throws -> String {
        let bundle = Bundle.module
        let pathForJSRuntime = bundle.path(forResource: fileName, ofType: "js")
        guard let path = pathForJSRuntime else {
            return ""
        }
        return try String(contentsOfFile: path, encoding: .utf8)
    }
    
    private func evaluateScriptFromFile(withFileName fileName: String) {
        do {
            let script = try loadScript(withName: fileName)
            webView.evaluateJavaScript(script) { [weak self] (_, error) in
                guard let self = self else { return }
                if let error = error {
                    self.loadDelegate?.lightweightCharts(self, didFailLoadWithError: error)
                }
            }
        } catch {
            loadDelegate?.lightweightCharts(self, didFailLoadWithError: error)
        }
    }
    
}

// MARK: - ChartApi
extension LightweightCharts: ChartApi {
    
    public var delegate: ChartDelegate? {
        get {
            chart.delegate
        }
        set {
            chart.delegate = newValue
        }
    }
    
    public func remove() {
        chart.remove()
    }
    
    public func resize(width: Double, height: Double, forceRepaint: Bool?) {
        chart.resize(width: width, height: height, forceRepaint: forceRepaint)
    }
    
    public func addAreaSeries(options: AreaSeries.Options?) -> AreaSeries {
        chart.addAreaSeries(options: options)
    }
    
    public func addBarSeries(options: BarSeries.Options?) -> BarSeries {
        chart.addBarSeries(options: options)
    }
    
    public func addCandlestickSeries(options: CandlestickSeries.Options?) -> CandlestickSeries {
        chart.addCandlestickSeries(options: options)
    }
    
    public func addHistogramSeries(options: HistogramSeries.Options?) -> HistogramSeries {
        chart.addHistogramSeries(options: options)
    }
    
    public func addLineSeries(options: LineSeries.Options?) -> LineSeries {
        chart.addLineSeries(options: options)
    }
    
    public func addBaselineSeries(options: BaselineSeries.Options?) -> BaselineSeries {
        chart.addBaselineSeries(options: options)
    }
    
    public func removeSeries<T: SeriesObject & SeriesApi>(seriesApi: T) {
        chart.removeSeries(seriesApi: seriesApi)
    }
    
    public func subscribeClick() {
        chart.subscribeClick()
    }
    
    public func unsubscribeClick() {
        chart.unsubscribeClick()
    }
    
    public func subscribeCrosshairMove() {
        chart.subscribeCrosshairMove()
    }
    
    public func unsubscribeCrosshairMove() {
        chart.unsubscribeCrosshairMove()
    }
    
    public func priceScale(priceScaleId: String?) -> PriceScaleApi {
        chart.priceScale(priceScaleId: priceScaleId)
    }
    
    public func timeScale() -> TimeScaleApi {
        chart.timeScale()
    }
    
    public func applyOptions(options: ChartOptions) {
        chart.applyOptions(options: options)
    }
    
    public func options(completion: @escaping (ChartOptions?) -> Void) {
        chart.options(completion: completion)
    }
    
    public func takeScreenshot(completion: @escaping (UIImage?) -> Void) {
        chart.takeScreenshot(completion: completion)
    }
    
}
