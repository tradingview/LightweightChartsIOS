import Foundation

public struct AreaSeriesOptions: SeriesOptionsCommon {
    
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
    
    public var topColor: ChartColor?
    public var bottomColor: ChartColor?
    public var invertFilledArea: Bool?
    public var lineColor: ChartColor?
    public var lineStyle: LineStyle?
    public var lineWidth: LineWidth?
    public var crosshairMarkerVisible: Bool?
    public var crosshairMarkerRadius: Double?
    public var crosshairMarkerBorderColor: ChartColor?
    public var crosshairMarkerBackgroundColor: ChartColor?
    public var crosshairMarkerBorderWidth: Double?
    public var lastPriceAnimation: LastPriceAnimationMode?
    
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
                topColor: ChartColor? = nil,
                bottomColor: ChartColor? = nil,
                invertFilledArea: Bool? = nil,
                lineColor: ChartColor? = nil,
                lineStyle: LineStyle? = nil,
                lineWidth: LineWidth? = nil,
                crosshairMarkerVisible: Bool? = nil,
                crosshairMarkerRadius: Double? = nil,
                crosshairMarkerBorderColor: ChartColor? = nil,
                crosshairMarkerBackgroundColor: ChartColor? = nil,
                crosshairMarkerBorderWidth: Double? = nil,
                lastPriceAnimation: LastPriceAnimationMode? = nil) {
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
        self.topColor = topColor
        self.bottomColor = bottomColor
        self.invertFilledArea = invertFilledArea
        self.lineColor = lineColor
        self.lineStyle = lineStyle
        self.lineWidth = lineWidth
        self.crosshairMarkerVisible = crosshairMarkerVisible
        self.crosshairMarkerRadius = crosshairMarkerRadius
        self.crosshairMarkerBorderColor = crosshairMarkerBorderColor
        self.crosshairMarkerBackgroundColor = crosshairMarkerBackgroundColor
        self.crosshairMarkerBorderWidth = crosshairMarkerBorderWidth
        self.lastPriceAnimation = lastPriceAnimation
    }
    
}
