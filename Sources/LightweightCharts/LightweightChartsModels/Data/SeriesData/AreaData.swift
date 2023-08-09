import Foundation


public struct AreaData: SingleValueSeriesData {
    
    /**
     * The time of the data.
     */
    public var time: Time
    
    /**
     * Price value of the data.
     */
    public var value: Double?
    
    /**
     * Optional line color value for certain data item. If missed, color from options is used*
     */
    public var lineColor: ChartColor?
    
    /**
     * Optional top color value for certain data item. If missed, color from options is used
     */
    public var topColor: ChartColor?
    
    /**
     * Optional bottom color value for certain data item. If missed, color from options is used
     */
    public var bottomColor: ChartColor?
    
    public init(time: Time, value: Double? = nil, lineColor: ChartColor? = nil, topColor: ChartColor? = nil, bottomColor: ChartColor? = nil) {
        self.time = time
        self.value = value
        self.lineColor = lineColor
        self.topColor = topColor
        self.bottomColor = bottomColor
    }
    
}
