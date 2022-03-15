import Foundation

protocol BarSeriesData: OhlcData {
    var color: ChartColor? { get }
}

// MARK: -
public struct BarData: BarSeriesData {
    
    public var time: Time
    public var open: Double?
    public var high: Double?
    public var low: Double?
    public var close: Double?
    public var color: ChartColor?
    
    public init(time: Time, open: Double?, high: Double?, low: Double?, close: Double?, color: ChartColor? = nil) {
        self.time = time
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.color = color
    }
    
}
