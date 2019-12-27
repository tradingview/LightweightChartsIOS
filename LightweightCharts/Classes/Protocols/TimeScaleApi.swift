import CoreGraphics

/** Interface to chart time scale */
public protocol TimeScaleApi: class {
    
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
     * Restores default zooming and scroll position of the time scale
     */
    func resetTimeScale()

    /**
     * Automatically calculates the visible range to fit all data from all series
     * This is a momentary operation.
     */
    func fitContent()

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
