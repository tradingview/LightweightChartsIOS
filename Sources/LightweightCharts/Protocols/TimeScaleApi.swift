import CoreGraphics

/** Interface to chart time scale */
public protocol TimeScaleApi: AnyObject {
    
    var delegate: TimeScaleDelegate? { get set }
    
    /**
     * Returns current scroll position of the chart
     * - Parameter completion: a distance from the right edge to the latest bar, measured in bars
     */
    func scrollPosition(completion: @escaping (Double?) -> Void)

    /**
     * Scrolls the chart to the specified position
     * - Parameter position: target data position
     * - Parameter animated: setting this to true makes the chart scrolling smooth and adds animation
     */
    func scrollToPosition(position: Double, animated: Bool)

    /**
     * Restores default scroll position of the chart. This process is always animated.
     */
    func scrollToRealTime()

    /**
     * Returns current visible time range of the chart
     * - Parameter completion: visible range or null if the chart has no data at all
     */
    func getVisibleRange(completion: @escaping (TimeRange?) -> Void)

    /**
     * Sets visible range of data
     * - Parameter range: target visible range of data
     */
    func setVisibleRange(range: TimeRange)

    /**
     * Returns the currently visible logical range of data.
     * - Parameter completion: visible range or null if the chart has no data at all
     */
    func getVisibleLogicalRange(completion: @escaping (LogicalRange?) -> Void)
    
    /**
     * Sets visible logical range of data.
     * - Parameter range: target visible logical range of data.
     */
    func setVisibleLogicalRange(range: FromToRange<Double>)
    
    /**
     * Restores default zooming and scroll position of the time scale
     */
    func resetTimeScale()

    /**
     * Automatically calculates the visible range to fit all data from all series
     * This is a momentary operation.
     */
    func fitContent()

    /**
     * Converts a logical index to local x coordinate.
     *
     * - Parameter logical: logical index needs to be converted
     * - Parameter completion: x coordinate of that time or `null` if the chart doesn't have data
     */
    func logicalToCoordinate(logical: Logical, completion: @escaping (Coordinate?) -> Void)
    
    /**
     * Converts a coordinate to logical index.
     *
     * - Parameter x: coordinate needs to be converted
     * - Parameter completion: logical index that is located on that coordinate or `null` if the chart doesn't have data
     */
    func coordinateToLogical(x: Double, completion: @escaping (Logical?) -> Void)
    
    /**
     * Converts a time to local x coordinate.
     *
     * @param time - time needs to be converted
     * @returns x coordinate of that time or `null` if no time found on time scale
     */
    func timeToCoordinate(time: Time, completion: @escaping (Coordinate?) -> Void)
    /**
     * Converts a coordinate to time.
     *
     * @param x - coordinate needs to be converted
     * @returns time of a bar that is located on that coordinate or `null` if there are no bars found on that coordinate
     */
    
    func coordinateToTime(x: Double, completion: @escaping (Time?) -> Void)
    /**
     * Adds a subscription to visible range changes to receive notification about visible range of data changes
     *
     * @param handler - handler (function) to be called on changing visible data range
     */
    
    func subscribeVisibleTimeRangeChange()
    /**
     * Removes a subscription to visible range changes
     *
     * @param handler - previously subscribed handler
     */
    func unsubscribeVisibleTimeRangeChange()
    
    /**
     * Adds a subscription to visible index range changes to receive notifications about visible indexes of the data
     *
     * @param handler - handler (function) to be called when the visible indexes change
     */
    func subscribeVisibleLogicalRangeChange()
    
    /**
     * Removes a subscription to visible index range changes
     *
     * @param handler - previously subscribed handler
     */
    func unsubscribeVisibleLogicalRangeChange()
    
    func subscribeSizeChange()
    
    func unsubscribeSizeChange()
    
    /**
     * Applies new options to the time scale.
     * - Parameter options: any subset of options
     */
    func applyOptions(options: TimeScaleOptions)

    /**
     * Returns current options
     * - Parameter completion: currently applied options
     */
    func options(completion: @escaping (TimeScaleOptions?) -> Void)
    
}

// MARK: -
extension TimeScaleApi {
    
    /**
     * Scrolls the chart to the specified position
     * - Parameter position: target data position
     * - Parameter animated: setting this to true makes the chart scrolling smooth and adds animation
     */
    func scrollToPosition(position: CGFloat, animated: Bool) {
        self.scrollToPosition(position: Double(position), animated: animated)
    }
    
}
