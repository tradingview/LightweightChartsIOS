import Foundation

protocol LineSeriesData: SeriesData {

    /**
     * Price value of data item
     */
    var value: Double? { get }
    
}

/**
* Structure describing single data item for series of type Line or Area
*/
public struct LineData: LineSeriesData {
    
    public var time: Time
    public var value: Double?
    
    public init(time: Time, value: Double?) {
        self.time = time
        self.value = value
    }
    
}
