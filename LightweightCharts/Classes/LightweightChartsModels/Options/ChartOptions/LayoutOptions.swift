import Foundation

/**
 Structure describing layout options
 */
public struct LayoutOptions: Codable {
    
    /**
     Background color of the chart area and the scales
     */
    public var backgroundColor: ChartColor?
    
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
                textColor: ChartColor? = nil,
                fontSize: Double? = nil,
                fontFamily: String? = nil) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.fontSize = fontSize
        self.fontFamily = fontFamily
    }
    
}
