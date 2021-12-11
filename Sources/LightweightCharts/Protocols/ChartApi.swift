import UIKit

 /**
 The main interface of a single chart
 */
public protocol ChartApi: AnyObject {
    
    /**
     * Subsription delegate for chart events. Weak reference.
     */
    var delegate: ChartDelegate? { get set }
    
    /**
     * Removes the chart object including all DOM elements.
     * This is an irreversible operation, you cannot do anything with the chart after removing it.
     */
    func remove()

    /**
     * Sets fixed size of the chart. By default chart takes up 100% of its container
     * - Parameter height: target height of the chart
     * - Parameter width: target width of the chart
     * - Parameter forceRepaint: true to initiate resize immediately.
     * One could need this to get screenshot immediately after resize
     */
    func resize(width: Double, height: Double, forceRepaint: Bool?)

    // MARK: - Series methods
    /**
     * Creates an area series with specified parameters
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addAreaSeries(options: AreaSeries.Options?) -> AreaSeries
    
    /**
     * Creates a bar series with specified parameters
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addBarSeries(options: BarSeries.Options?) -> BarSeries
    
    /**
     * Creates a candlestick series with specified parameters
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addCandlestickSeries(options: CandlestickSeries.Options?) -> CandlestickSeries
    
    /**
     * Creates a histogram series with specified parameters
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addHistogramSeries(options: HistogramSeries.Options?) -> HistogramSeries

    /**
     * Creates a line series with specified parameters
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addLineSeries(options: LineSeries.Options?) -> LineSeries
    
    /**
     * Creates a baseline series with specified parameters.
     * - Parameter options: customization parameters of the series being created
     * - Returns: an interface of the created series
     */
    func addBaselineSeries(options: BaselineSeries.Options?) -> BaselineSeries

    /**
     * Removes a series of any type.
     * This is an irreversible operation, you cannot do anything with the series after removing it
     * - Parameter seriesApi: Series to remove
     */
    func removeSeries<T: SeriesApi & SeriesObject>(seriesApi: T)
    
    // MARK: - Subsriptions methods
    /**
     * Adds a subscription to mouse click event
     * - Parameter handler: handler (function) to be called on mouse click
     */
    func subscribeClick()
    
    /**
     * Removes mouse click subscription
     * - Parameter handler: previously subscribed handler
     */
    func unsubscribeClick()

    /**
     * Adds a subscription to crosshair movement to receive notifications on crosshair movements
     * - Parameter handler: handler (function) to be called on crosshair move
     */
    func subscribeCrosshairMove()

    /**
     * Removes a subscription on crosshair movement
     * - Parameter handler: previously subscribed handler
     */
    func unsubscribeCrosshairMove()

    // MARK: - Other APIs and options methods
    /**
     * Returns API to manipulate the price scale
     * - Parameter priceScaleID: id of scale to access to
     * - Returns: target API
     */
    func priceScale(priceScaleId: String?) -> PriceScaleApi

    /**
     * Returns API to manipulate the time scale
     * - Returns: target API
     */
    func timeScale() -> TimeScaleApi

    /**
     * Applies new options to the chart
     * - Parameter options: any subset of chart options
     */
    func applyOptions(options: ChartOptions)

    /**
     * Returns currently applied options
     * - Parameter completion: full set of currently applied options, including defaults
     */
    func options(completion: @escaping (ChartOptions?) -> Void)

    /**
     * Make a screenshot of the chart with all the elements excluding crosshair.
     * - Parameter completion: a canvas with the chart drawn on
     */
    func takeScreenshot(completion: @escaping (UIImage?) -> Void)
    
}

// MARK: -
public extension ChartApi {
    
    /**
     * Sets fixed size of the chart. By default chart takes up 100% of its container
     * - Parameter height: target height of the chart
     * - Parameter width: target width of the chart
     * - Parameter forceRepaint: true to initiate resize immediately.
     * One could need this to get screenshot immediately after resize
     */
    func resize(width: CGFloat, height: CGFloat, forceRepaint: Bool?) {
        self.resize(width: Double(width), height: Double(height), forceRepaint: forceRepaint)
    }
    
    /**
     * Sets fixed size of the chart. By default chart takes up 100% of its container
     * - Parameter height: target height of the chart
     * - Parameter width: target width of the chart
     * - Parameter forceRepaint: true to initiate resize immediately.
     * One could need this to get screenshot immediately after resize
     */
    func resize(width: Int, height: Int, forceRepaint: Bool?) {
        self.resize(width: Double(width), height: Double(height), forceRepaint: forceRepaint)
    }
    
}
