import Foundation

protocol BarSeriesData: SeriesData {
    
    var time: Time { get }

    var open: Double? { get }
    var high: Double? { get }
    var low: Double? { get }
    var close: Double? { get }
    
}

public struct BarData: BarSeriesData {
    
    public var time: Time
    public var open: Double?
    public var high: Double?
    public var low: Double?
    public var close: Double?
    
    public init(time: Time, open: Double?, high: Double?, low: Double?, close: Double?) {
        self.time = time
        self.open = open
        self.high = high
        self.low = low
        self.close = close
    }
    
}
