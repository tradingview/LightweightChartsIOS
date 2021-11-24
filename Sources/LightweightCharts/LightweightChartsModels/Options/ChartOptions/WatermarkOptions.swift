import Foundation

public enum HorizontalAlignment: String, Codable {
    case left
    case center
    case right
}

// MARK: -
public enum VerticalAlignment: String, Codable {
    case top
    case center
    case bottom
}

// MARK: -
/**
 Structure describing watermark options
 */
public struct WatermarkOptions {
    
    /**
     Color of the watermark
     */
    public var color: ChartColor?
    
    /**
     Visibility of the watermark. If false, other parameters are ignored
     */
    public var visible: Bool?
    
    /**
     Text of the watermark. Word wrapping is not supported
     */
    public var text: String?
    
    /**
     Font size in pixels
     */
    public var fontSize: Int?
    
    /**
     Font family
     */
    public var fontFamily: String?
    /**
     Font style
     */
    public var fontStyle: String?
    
    /**
     Horizontal alignment of the watermark inside the chart area
     */
    public var horizontalAlignment: HorizontalAlignment?
    
    /**
     Vertical alignment of the watermark inside the chart area
     */
    public var verticalAlignment: VerticalAlignment?
    
    public init(color: ChartColor? = nil,
                visible: Bool? = nil,
                text: String? = nil,
                fontSize: Int? = nil,
                fontFamily: String? = nil,
                fontStyle: String? = nil,
                horizontalAlignment: HorizontalAlignment? = nil,
                verticalAlignment: VerticalAlignment? = nil) {
        self.color = color
        self.visible = visible
        self.text = text
        self.fontSize = fontSize
        self.fontFamily = fontFamily
        self.fontStyle = fontStyle
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
    }
    
}

// MARK: - Codable
extension WatermarkOptions: Codable {
    
    enum CodingKeys: String, CodingKey {
        case color
        case visible
        case text
        case fontSize
        case fontFamily
        case fontStyle
        case horizontalAlignment = "horzAlign"
        case verticalAlignment = "vertAlign"
    }
    
}
