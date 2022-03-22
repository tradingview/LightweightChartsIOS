import Foundation

/**
 Represents a price line options
 */
public struct PriceLineOptions: Codable {
    
    /**
     Price line's value
     */
    public var price: Double?
    
    /**
     Price line's color
     */
    public var color: ChartColor?
    
    /**
     Price line's width in pixels
     */
    public var lineWidth: LineWidth?
    
    /**
     Price line's style
     */
    public var lineStyle: LineStyle?
    
    /**
     Display line
     */
    public var lineVisible: Bool?
    
    /**
     Display the current price value in on the price scale
     */
    public var axisLabelVisible: Bool?
    
    /**
     Price line's on the chart pane
     */
    public var title: String?
    
    public init(price: Double? = nil,
                color: ChartColor? = nil,
                lineWidth: LineWidth? = nil,
                lineStyle: LineStyle? = nil,
                lineVisible: Bool? = nil,
                axisLabelVisible: Bool? = nil,
                title: String? = nil) {
        self.price = price
        self.color = color
        self.lineWidth = lineWidth
        self.lineStyle = lineStyle
        self.lineVisible = lineVisible
        self.axisLabelVisible = axisLabelVisible
        self.title = title
    }
    
}
