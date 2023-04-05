import Foundation

public struct BaselineData: SingleValueSeriesData {
    
    /**
     * The time of the data.
     */
    public var time: Time
    
    /**
     * Price value of the data.
     */
    public var value: Double?
    
    /**
     * Optional top area top fill color value for certain data item. If missed, color from options is used
     */
    public var topFillColor1: ChartColor?
    
    /**
     * Optional top area bottom fill color value for certain data item. If missed, color from options is used
     */
    public var topFillColor2: ChartColor?
    
    /**
     * Optional top area line color value for certain data item. If missed, color from options is used
     */
    public var topLineColor: ChartColor?
    
    /**
     * Optional bottom area top fill color value for certain data item. If missed, color from options is used
     */
    public var bottomFillColor1: ChartColor?
    
    /**
     * Optional bottom area bottom fill color value for certain data item. If missed, color from options is used
     */
    public var bottomFillColor2: ChartColor?
    
    /** 
     * Optional bottom area line color value for certain data item. If missed, color from options is used
     */
    public var bottomLineColor: ChartColor?
    
    public init(time: Time,
         value: Double? = nil,
         topFillColor1: ChartColor? = nil,
         topFillColor2: ChartColor? = nil,
         topLineColor: ChartColor? = nil,
         bottomFillColor1: ChartColor? = nil,
         bottomFillColor2: ChartColor? = nil,
         bottomLineColor: ChartColor? = nil) {
        self.time = time
        self.value = value
        self.topFillColor1 = topFillColor1
        self.topFillColor2 = topFillColor2
        self.topLineColor = topLineColor
        self.bottomFillColor1 = bottomFillColor1
        self.bottomFillColor2 = bottomFillColor2
        self.bottomLineColor = bottomLineColor
    }
    
}
