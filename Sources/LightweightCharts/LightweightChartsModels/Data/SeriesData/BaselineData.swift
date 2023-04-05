import Foundation

public struct BaselineData: SingleValueData {
    
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
    
    
    /**
     * The time of the data.
     */
    public var time: Time
    
    /**
     * Price value of the data.
     */
    public var value: Double?
    
}
