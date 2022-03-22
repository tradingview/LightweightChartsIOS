import Foundation

protocol LineSeriesData: SingleValueSeriesData {
    
    /**
     Optional color value for certain data item. If missed, color from options is used
     */
    var color: ChartColor? { get }
}

// MARK: -
/**
* Structure describing single data item for series of type Line or Area
*/
public struct LineData: LineSeriesData {
    
    public var time: Time
    public var value: Double?
    public var color: ChartColor?
    
    public init(time: Time, value: Double?, color: ChartColor? = nil) {
        self.time = time
        self.value = value
        self.color = color
    }
    
}
