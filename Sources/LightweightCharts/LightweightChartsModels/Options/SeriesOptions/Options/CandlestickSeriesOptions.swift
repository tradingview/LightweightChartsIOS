import Foundation

/**
 Structure describing a drawing style of the candlestick chart
 */
public struct CandlestickSeriesOptions: SeriesOptionsCommon {
    
    public var lastValueVisible: Bool?
    public var title: String?
    public var priceScaleId: String?
    public var visible: Bool?
    public var priceLineVisible: Bool?
    public var priceLineSource: PriceLineSource?
    public var priceLineWidth: LineWidth?
    public var priceLineColor: ChartColor?
    public var priceLineStyle: LineStyle?
    public var priceFormat: PriceFormat?
    public var baseLineVisible: Bool?
    public var baseLineColor: ChartColor?
    public var baseLineWidth: LineWidth?
    public var baseLineStyle: LineStyle?
    public var autoscaleInfoProvider: AutoscaleInfoProvider?
    
    /**
     Color of rising candlesticks
     */
    public var upColor: ChartColor?
    
    /**
     Color of falling candlesticks
     */
    public var downColor: ChartColor?
    
    /**
     Flag to draw/hide candlestick wicks
     */
    public var wickVisible: Bool?
    
    /**
     Flag to draw/hide candlestick borders around bodies
     */
    public var borderVisible: Bool?
    
    /**
     * Color of borders around candles' bodies. Ignored if borderVisible == false
     * If specified, it overrides both borderUpColor and borderDownColor options
     */
    public var borderColor: ChartColor?
    
    /**
     Color of the border of rising candlesticks. Ignored if borderVisible == false or borderColor is specified
     */
    public var borderUpColor: ChartColor?
    
    /**
     Color of the border of rising candlesticks. Ignored if borderVisible == false or borderColor is specified
     */
    public var borderDownColor: ChartColor?
    
    /**
     * Color of candlestick wicks. Ignored if wickVisible == false
     * If specified, it overrides both wickUpColor and wickDownColor options
     */
    public var wickColor: ChartColor?
    
    /**
     Color of rising candlestick wicks. Ignored if wickVisible == false or wickColor is specified
     */
    public var wickUpColor: ChartColor?
    
    /**
     Color of falling candlestick wicks. Ignored if wickVisible == false or wickColor is specified
     */
    public var wickDownColor: ChartColor?
    
    public init(lastValueVisible: Bool? = nil,
                title: String? = nil,
                priceScaleId: String? = nil,
                visible: Bool? = nil,
                priceLineVisible: Bool? = nil,
                priceLineSource: PriceLineSource? = nil,
                priceLineWidth: LineWidth? = nil,
                priceLineColor: ChartColor? = nil,
                priceLineStyle: LineStyle? = nil,
                priceFormat: PriceFormat? = nil,
                baseLineVisible: Bool? = nil,
                baseLineColor: ChartColor? = nil,
                baseLineWidth: LineWidth? = nil,
                baseLineStyle: LineStyle? = nil,
                autoscaleInfoProvider: AutoscaleInfoProvider? = nil,
                upColor: ChartColor? = nil,
                downColor: ChartColor? = nil,
                wickVisible: Bool? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                borderUpColor: ChartColor? = nil,
                borderDownColor: ChartColor? = nil,
                wickColor: ChartColor? = nil,
                wickUpColor: ChartColor? = nil,
                wickDownColor: ChartColor? = nil) {
        self.lastValueVisible = lastValueVisible
        self.title = title
        self.priceScaleId = priceScaleId
        self.visible = visible
        self.priceLineVisible = priceLineVisible
        self.priceLineSource = priceLineSource
        self.priceLineWidth = priceLineWidth
        self.priceLineColor = priceLineColor
        self.priceLineStyle = priceLineStyle
        self.priceFormat = priceFormat
        self.baseLineVisible = baseLineVisible
        self.baseLineColor = baseLineColor
        self.baseLineWidth = baseLineWidth
        self.baseLineStyle = baseLineStyle
        self.autoscaleInfoProvider = autoscaleInfoProvider
        self.upColor = upColor
        self.downColor = downColor
        self.wickVisible = wickVisible
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.borderUpColor = borderUpColor
        self.borderDownColor = borderDownColor
        self.wickColor = wickColor
        self.wickUpColor = wickUpColor
        self.wickDownColor = wickDownColor
    }
    
}
