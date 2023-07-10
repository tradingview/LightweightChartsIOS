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
protocol OverlayPriceScaleOptionsProtocol {
    
    /**
     Mode of the price scale
     */
    var mode: PriceScaleMode? { get }
    
    /**
     True inverts the scale. Makes larger values drawn lower. Affects both the price scale and the data on the chart
     */
    var invertScale: Bool? { get }
    
    /**
     True value prevents labels on the price scale from overlapping one another by aligning them one below others
     */
    var alignLabels: Bool? { get }
    
    /**
     Defines price margins for the price scale
     */
    var scaleMargins: PriceScaleMargins? { get }
    
    /**
     Set true to draw a border between the price scale and the chart area
     */
    var borderVisible: Bool? { get }
    
    /**
     Defines a color of the border between the price scale and the chart area. It is ignored if borderVisible is false
     */
    var borderColor: ChartColor? { get }
    
    /**
     Indicates whether the price scale displays only full lines of text or partial lines.
     */
    var entireTextOnly: Bool? { get }
    
    /**
     True value add a small horizontal ticks on price axis labels
     */
    var ticksVisible: Bool? { get }
    
}

// MARK: -
protocol VisiblePriceScaleOptionsProtocol: OverlayPriceScaleOptionsProtocol {
    
    /**
     True makes chart calculate the price range automatically based on the visible data range
     */
    var autoScale: Bool? { get }
    
    /**
     Indicates if this price scale visible. Could not be applied to overlay price scale
     */
    var visible: Bool? { get }
    
}

// MARK: -
/**
Structure that describes price scale options
*/
public struct PriceScaleOptions: Codable, VisiblePriceScaleOptionsProtocol {
    
    public var autoScale: Bool?
    public var mode: PriceScaleMode?
    public var invertScale: Bool?
    public var alignLabels: Bool?
    public var scaleMargins: PriceScaleMargins?
    public var borderVisible: Bool?
    public var borderColor: ChartColor?
    public var entireTextOnly: Bool?
    public var visible: Bool?
    public var ticksVisible: Bool?
    
    public init(autoScale: Bool? = nil,
                mode: PriceScaleMode? = nil,
                invertScale: Bool? = nil,
                alignLabels: Bool? = nil,
                scaleMargins: PriceScaleMargins? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                entireTextOnly: Bool? = nil,
                visible: Bool? = nil,
                ticksVisible: Bool? = nil) {
        self.autoScale = autoScale
        self.mode = mode
        self.invertScale = invertScale
        self.alignLabels = alignLabels
        self.scaleMargins = scaleMargins
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.entireTextOnly = entireTextOnly
        self.visible = visible
        self.ticksVisible = ticksVisible
    }
    
}

// MARK: -
public typealias VisiblePriceScaleOptions = PriceScaleOptions

// MARK: -
/**
 Structure that describes price scale options
 */
public struct OverlayPriceScaleOptions: Codable, OverlayPriceScaleOptionsProtocol {
    
    public var mode: PriceScaleMode?
    public var invertScale: Bool?
    public var alignLabels: Bool?
    public var scaleMargins: PriceScaleMargins?
    public var borderVisible: Bool?
    public var borderColor: ChartColor?
    public var entireTextOnly: Bool?
    public var ticksVisible: Bool?
    
    public init(autoScale: Bool? = nil,
                mode: PriceScaleMode? = nil,
                invertScale: Bool? = nil,
                alignLabels: Bool? = nil,
                scaleMargins: PriceScaleMargins? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                entireTextOnly: Bool? = nil,
                visible: Bool? = nil,
                ticksVisible: Bool? = nil) {
        self.mode = mode
        self.invertScale = invertScale
        self.alignLabels = alignLabels
        self.scaleMargins = scaleMargins
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.entireTextOnly = entireTextOnly
        self.ticksVisible = ticksVisible
    }
    
}
