import Foundation

public struct HistogramSeriesOptions: SeriesOptionsCommon {
    
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
    
    public var color: ChartColor?
    public var base: Double?
    
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
                color: ChartColor? = nil,
                base: Double? = nil) {
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
        self.color = color
        self.base = base
    }
    
}
