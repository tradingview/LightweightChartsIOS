import Foundation

/**
 Structure describing layout options
 */
public struct LayoutOptions: Codable {
    
    /**
     Background color of the chart area and the scales
     */
    @available(*, deprecated, message: "Use background instead")
    public var backgroundColor: ChartColor?
    
    public var background: SurfaceColor?
    
    /**
     Color of a text on the scales
     */
    public var textColor: ChartColor?
    
    /**
     Font size of a text on the scales in pixels
     */
    public var fontSize: Double?
    
    /**
     Font family of a text on the scales
     */
    public var fontFamily: String?
    
    public init(backgroundColor: ChartColor? = nil,
                background: SurfaceColor? = nil,
                textColor: ChartColor? = nil,
                fontSize: Double? = nil,
                fontFamily: String? = nil) {
        self.backgroundColor = backgroundColor
        self.background = background
        self.textColor = textColor
        self.fontSize = fontSize
        self.fontFamily = fontFamily
    }
}
