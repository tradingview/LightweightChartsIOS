import Foundation

/**
 * Enum of possible price scale modes
 * Normal mode displays original price values
 * Logarithmic mode makes price scale show logarithms of series values instead of original values
 * Percentage turns the percentage mode on.
 * IndexedTo100 turns the "indexed to 100" mode on
 */
public enum PriceScaleMode: Int, Codable {
    case normal
    case logarithmic
    case percentage
    case indexedTo100
}

// MARK: -
public enum PriceAxisPosition: String, Codable {
    case left
    case right
    case none
}

// MARK: -
/** Defines margins of the price scale */
public struct PriceScaleMargins: Codable {
    
    /** Top margin in percentages. Must be greater or equal to 0 and less than 100 */
    public var top: Double?
    
    /** Bottom margin in percentages. Must be greater or equal to 0 and less than 100 */
    public var bottom: Double?
    
    public init(top: Double? = nil, bottom: Double? = nil) {
        self.top = top
        self.bottom = bottom
    }
    
}

// MARK: -
/**
 Structure that describes price scale options
 */
public struct PriceScaleOptions: Codable {
    
    /**
     True makes chart calculate the price range automatically based on the visible data range
     */
    public var autoScale: Bool?
    
    /**
     Mode of the price scale
     */
    public var mode: PriceScaleMode?
    
    /**
     True inverts the scale. Makes larger values drawn lower. Affects both the price scale and the data on the chart
     */
    public var invertScale: Bool?
    
    /**
     True value prevents labels on the price scale from overlapping one another by aligning them one below others
     */
    public var alignLabels: Bool?
    
    /**
     Defines position of the price scale on the chart
     */
    public var position: PriceAxisPosition?
    
    /**
     Defines price margins for the price scale
     */
    public var scaleMargins: PriceScaleMargins?
    
    /**
     Set true to draw a border between the price scale and the chart area
     */
    public var borderVisible: Bool?
    
    /**
     Defines a color of the border between the price scale and the chart area. It is ignored if borderVisible is false
     */
    public var borderColor: ChartColor?
    
    /**
     Indicates whether the price scale displays only full lines of text or partial lines.
     */
    public var entireTextOnly: Bool?
    
    public init(autoScale: Bool? = nil,
                mode: PriceScaleMode? = nil,
                invertScale: Bool? = nil,
                alignLabels: Bool? = nil,
                position: PriceAxisPosition? = nil,
                scaleMargins: PriceScaleMargins? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                entireTextOnly: Bool? = nil) {
        self.autoScale = autoScale
        self.mode = mode
        self.invertScale = invertScale
        self.alignLabels = alignLabels
        self.position = position
        self.scaleMargins = scaleMargins
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.entireTextOnly = entireTextOnly
    }
    
}
