import Foundation

protocol CandlestickSeriesData : OhlcData {
    var color: ChartColor? { get }
    var borderColor: ChartColor? { get }
    var wickColor: ChartColor? { get }
}

// MARK: -
public struct CandlestickData : CandlestickSeriesData {
    public var time: Time
    public var open: Double?
    public var high: Double?
    public var low: Double?
    public var close: Double?
    public var color: ChartColor?
    public var borderColor: ChartColor?
    public var wickColor: ChartColor?
    
    public init(time: Time,
                open: Double?,
                high: Double?,
                low: Double?,
                close: Double?,
                color: ChartColor? = nil,
                borderColor: ChartColor? = nil,
                wickColor: ChartColor? = nil) {
        self.time = time
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.color = color
        self.borderColor = borderColor
        self.wickColor = wickColor
    }
}
