import Foundation


public struct AreaData: SingleValueSeriesData {
    
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
    
    /**
     * The time of the data.
     */
    public var time: Time
    
    /**
     * Price value of the data.
     */
    public var value: Double?
    
}
