import Foundation

/**
 * Structure describing options of the chart. Series options are to be set separately
 */
public struct ChartOptions {
    
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
     Structure with price scale options
     */
    public var priceScale: PriceScaleOptions?
    
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
     Structure that describes scrolling behavior
     */
    public var handleScroll: HandleScrollOptions?
    
    /**
     Structure that describes scaling behavior
     */
    public var handleScale: HandleScaleOptions?
        
    public init(width: Double? = nil,
                height: Double? = nil,
                watermark: WatermarkOptions? = nil,
                layout: LayoutOptions? = nil,
                priceScale: PriceScaleOptions? = nil,
                timeScale: TimeScaleOptions? = nil,
                crosshair: CrosshairOptions? = nil,
                grid: GridOptions? = nil,
                localization: LocalizationOptions? = nil,
                handleScroll: HandleScrollOptions? = nil,
                handleScale: HandleScaleOptions? = nil) {
        self.width = width
        self.height = height
        self.watermark = watermark
        self.layout = layout
        self.priceScale = priceScale
        self.timeScale = timeScale
        self.crosshair = crosshair
        self.grid = grid
        self.localization = localization
        self.handleScroll = handleScroll
        self.handleScale = handleScale
    }
    
}

// MARK: - Codable
extension ChartOptions: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case width
        case height
        case watermark
        case layout
        case priceScale
        case timeScale
        case crosshair
        case grid
        case localization
        case handleScroll
        case handleScale
    }
    
}

// MARK: -
extension ChartOptions {
    
    func formattedJSONtoJavaScript() -> ChartFormattedJSONtoJavaScript {
        var jsonOptions = jsonString
        var priceFormatterScript = ""
        var timeFormatterScript = ""
        var priceFormatterFunction: FunctionWithName<BarPrice>?
        var timeFormatterFunction: FunctionWithName<EventTime>?
        
        if let localization = self.localization {
            if localization.priceFormatter != nil || localization.timeFormatter != nil {
                let flag = localization.jsonFlagForReplacing
                jsonOptions = jsonOptions
                    .replacingOccurrences(of: "\"\(flag)", with: "")
                    .replacingOccurrences(of: "\(flag)\"", with: "")
            }
            if let priceFormatterJSFunction = localization.priceFormatterJSFunction {
                let name = priceFormatterJSFunction.name
                priceFormatterFunction = FunctionWithName(name: name, function: priceFormatterJSFunction.function)
                priceFormatterScript = priceFormatterJSFunction.declarationScript()
            }
            if let timeFormatterJSFunction = localization.timeFormatterJSFunction {
                let name = timeFormatterJSFunction.name
                timeFormatterFunction = FunctionWithName(name: name, function: timeFormatterJSFunction.function)
                timeFormatterScript = timeFormatterJSFunction.declarationScript()
            }
        }
        return ChartFormattedJSONtoJavaScript(
            functionsDeclarations: "\(priceFormatterScript)\(timeFormatterScript)",
            optionsScript: jsonOptions,
            priceFormatter: priceFormatterFunction,
            timeFormatter: timeFormatterFunction
        )
    }
    
}
