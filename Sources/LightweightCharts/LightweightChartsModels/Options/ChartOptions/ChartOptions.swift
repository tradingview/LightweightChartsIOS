import Foundation

/**
 * Structure describing options of the chart. Series options are to be set separately
 */
public struct ChartOptions: Codable {
    
    /**
     Width of the chart
     */
    public var width: Double?
    
    /**
     Height of the chart
     */
    public var height: Double?
    
    /**
     Structure with watermark options
     */
    public var watermark: WatermarkOptions?
    
    /**
     Structure with layout options
     */
    public var layout: LayoutOptions?
    
    /**
     Structure with price scale option for left price scale
     */
    public var leftPriceScale: VisiblePriceScaleOptions?
    
    /**
     Structure with price scale option for right price scale
     */
    public var rightPriceScale: VisiblePriceScaleOptions?
    
    /**
     Structure describing default price scale options for overlays
     */
    public var overlayPriceScales: OverlayPriceScaleOptions?
    
    /**
     Structure with time scale options
     */
    public var timeScale: TimeScaleOptions?
    
    /**
     Structure with crosshair options
     */
    public var crosshair: CrosshairOptions?
    
    /**
     Structure with grid options
     */
    public var grid: GridOptions?
    
    /**
     Structure with localization options
     */
    public var localization: LocalizationOptions?
    
    /**
     Structure that describes scrolling behavior or boolean flag that disables/enables all kinds of scrolls
     */
    public var handleScroll: HandleScrollOptions?
    
    /**
     Structure that describes scaling behavior or boolean flag that disables/enables all kinds of scales
     */
    public var handleScale: TogglableOptions<HandleScaleOptions>?
    
    /**
     Structure that describes kinetic scroll behavior
     */
    public var kineticScroll: KineticScrollOptions?
    
    /**
     Represent options for the tracking mode's behavior.
     */
    public var trackingMode: TrackingModeOptions?
        
    public init(width: Double? = nil,
                height: Double? = nil,
                watermark: WatermarkOptions? = nil,
                layout: LayoutOptions? = nil,
                leftPriceScale: VisiblePriceScaleOptions? = nil,
                rightPriceScale: VisiblePriceScaleOptions? = nil,
                overlayPriceScales: OverlayPriceScaleOptions? = nil,
                timeScale: TimeScaleOptions? = nil,
                crosshair: CrosshairOptions? = nil,
                grid: GridOptions? = nil,
                localization: LocalizationOptions? = nil,
                handleScroll: HandleScrollOptions? = nil,
                handleScale: TogglableOptions<HandleScaleOptions>? = nil,
                kineticScroll: KineticScrollOptions? = nil,
                trackingMode: TrackingModeOptions? = nil) {
        self.width = width
        self.height = height
        self.watermark = watermark
        self.layout = layout
        self.leftPriceScale = leftPriceScale
        self.rightPriceScale = rightPriceScale
        self.overlayPriceScales = overlayPriceScales
        self.timeScale = timeScale
        self.crosshair = crosshair
        self.grid = grid
        self.localization = localization
        self.handleScroll = handleScroll
        self.handleScale = handleScale
        self.kineticScroll = kineticScroll
        self.trackingMode = trackingMode
    }
    
}

// MARK: -
extension ChartOptions {
    
    func optionsScript(for closuresStore: ClosuresStore?) -> (options: String, variableName: String) {
        let variableName = "options"
        var optionsScript = "var \(variableName) = \(jsonString);"
        if let formatter = localization?.priceFormatterJSFunction {
            closuresStore?.addMethod(formatter.function, forName: formatter.name)
            optionsScript.append("\(variableName).localization.priceFormatter = \(formatter.script());")
        }
        if let formatter = localization?.timeFormatterJSFunction {
            closuresStore?.addMethod(formatter.function, forName: formatter.name)
            optionsScript.append("\(variableName).localization.timeFormatter = \(formatter.script());")
        }
        if let formatter = timeScale?.tickMarkFormatterJSFunction {
            closuresStore?.addMethod(formatter.function, forName: formatter.name)
            optionsScript.append("\(variableName).timeScale.tickMarkFormatter = \(formatter.script());")
        }
        return (optionsScript, variableName)
    }
    
}
