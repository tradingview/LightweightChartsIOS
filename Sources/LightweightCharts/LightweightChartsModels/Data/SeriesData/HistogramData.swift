import Foundation

/**
Structure describing a single item of data for histogram series
*/
protocol HistogramSeriesData: SingleValueSeriesData {
    
    /**
     * Optional color value for certain data item. If missed, color from HistogramSeriesOptions is used
     */
    var color: ChartColor? { get }
    
}

// MARK: -
public struct HistogramData: HistogramSeriesData {
    
    public var color: ChartColor?
    public var time: Time
    public var value: Double?
    
    public init(color: ChartColor?, time: Time, value: Double?) {
        self.color = color
        self.time = time
        self.value = value
    }
    
    public init(time: Time, value: Double?, color: ChartColor? = nil) {
        self.time = time
        self.value = value
        self.color = color
    }
}
