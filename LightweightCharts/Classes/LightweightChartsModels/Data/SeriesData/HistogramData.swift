import Foundation

/**
Structure describing a single item of data for histogram series
*/
protocol HistogramSeriesData: LineSeriesData {
    
    /**
     * Optional color value for certain data item. If missed, color from HistogramSeriesOptions is used
     */
    var color: ChartColor? { get }
    
}

public struct HistogramData: HistogramSeriesData {
    
    public var color: ChartColor?
    public var time: Time
    public var value: Double?
    
    public init(color: ChartColor?, time: Time, value: Double?) {
        self.color = color
        self.time = time
        self.value = value
    }
    
}
