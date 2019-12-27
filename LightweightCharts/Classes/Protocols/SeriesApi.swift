import Foundation

public protocol SeriesApi: class {
       
    associatedtype Options: SeriesOptionsCommon
    associatedtype TickValue: SeriesData
    
    /**
     * Returns current price formatter
     * - Returns: interface to the price formatter object that can be used to format prices in the same way as the chart does
     */
    func priceFormatter() -> PriceFormatterApi

    /**
     * Converts specified series price to pixel coordinate according to the chart price scale
     * - Parameter price: input price to be converted
     * - Parameter completion: pixel coordinate of the price level on the chart
     */
    func priceToCoordinate(price: BarPrice, completion: @escaping (Coordinate?) -> Void)

    /**
     * Converts specified coordinate to price value according to the series price scale
     * - Parameter coordinate: input coordinate to be converted
     * - Parameter completion: price value  of the coordinate on the chart
     */
    func coordinateToPrice(coordinate: Coordinate, completion: @escaping (BarPrice?) -> Void)
    
    /**
     * Applies new options to the existing series
     * - Parameter options: any subset of options
     */
    func applyOptions(options: Options)

    /**
     * Returns currently applied options
     * - Parameter completion: full set of currently applied options, including defaults
     */
    func options(completion: @escaping (Options?) -> Void)

    /**
     * Sets or replaces series data
     * - Parameter data: ordered (earlier time point goes first) array of data items.
     * Old data is fully replaced with the new one.
     */
    func setData(data: [TickValue])

    /**
     * Adds or replaces a new bar
     * - Parameter bar: a single data item to be added.
     * Time of the new item must be greater or equal to the latest existing time point.
     * If the new item's time is equal to the last existing item's time, then the existing item is replaced with the new one.
     */
    func update(bar: TickValue)

    /**
     * Sets markers for the series
     * - Parameter data: array of series markers.
     * This array should be sorted by time.
     * Several markers with same time are allowed.
     */
    func setMarkers(data: [SeriesMarker])

    /**
     * Creates a new price line
     * - Parameter options:  any subset of options
     */
    func createPriceLine(options: PriceLineOptions?) -> PriceLine
    
    /**
     * Removes an existing price line
     * - Parameter line: line to remove
     */
    func removePriceLine(line: PriceLine)
    
}
