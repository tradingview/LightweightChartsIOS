import Foundation

/**
 A base interface for a data point of single-value series
 */
public protocol SingleValueSeriesData : SeriesData {
    
    /**
     * Price value of data item
     */
    var value: Double? { get }
}


public struct SingleValueData : SingleValueSeriesData {
    public var time: Time
    public var value: Double?
    
    public init(time: Time, value: Double?) {
        self.time = time
        self.value = value
    }
}
