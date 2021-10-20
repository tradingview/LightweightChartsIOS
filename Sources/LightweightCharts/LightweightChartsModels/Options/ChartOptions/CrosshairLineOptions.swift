import Foundation

/**
 Structure describing a crosshair line (vertical or horizontal)
 */
public struct CrosshairLineOptions: Codable {
    
    /**
     Color of a certain crosshair line
     */
    var color: ChartColor?
    
    /**
     Width of a certain crosshair line and corresponding scale label
     */
    var width: LineWidth?
    
    /**
     Style of a certain crosshair line
     */
    var style: LineStyle?
    
    /**
     Visibility of a certain crosshair line
     */
    var visible: Bool?
    
    /**
     Visibility of corresponding scale label
     */
    var labelVisible: Bool?
    
    /**
     Background color of corresponding scale label
     */
    var labelBackgroundColor: ChartColor?
    
    public init(color: ChartColor? = nil,
                width: LineWidth? = nil,
                style: LineStyle? = nil,
                visible: Bool? = nil,
                labelVisible: Bool? = nil,
                labelBackgroundColor: ChartColor? = nil) {
        self.color = color
        self.width = width
        self.style = style
        self.visible = visible
        self.labelVisible = labelVisible
        self.labelBackgroundColor = labelBackgroundColor
    }
    
}
