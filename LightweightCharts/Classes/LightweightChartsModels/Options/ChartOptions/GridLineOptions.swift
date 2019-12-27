import Foundation

/**
 Structure describing horizontal or vertical grid line options
 */
public struct GridLineOptions: Codable {
    
    /**
     Color of the lines
     */
    public var color: ChartColor?
    
    /**
     Style of the lines
     */
    public var style: LineStyle?
    
    /**
     Visibility of the lines
     */
    public var visible: Bool?
    
    public init(color: ChartColor? = nil,
                style: LineStyle? = nil,
                visible: Bool? = nil) {
        self.color = color
        self.style = style
        self.visible = visible
    }
    
}
