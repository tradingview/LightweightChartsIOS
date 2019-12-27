import Foundation

public struct LineSeriesOptions: SeriesOptionsCommon {
    
    public var lastValueVisible: Bool?
    public var title: String?
    public var priceLineVisible: Bool?
    public var priceLineWidth: LineWidth?
    public var priceLineColor: ChartColor?
    public var priceLineStyle: LineStyle?
    public var priceFormat: PriceFormat?
    public var baseLineVisible: Bool?
    public var baseLineColor: ChartColor?
    public var baseLineWidth: LineWidth?
    public var baseLineStyle: LineStyle?
    
    public var color: ChartColor?
    public var lineStyle: LineStyle?
    public var lineWidth: LineWidth?
    public var lineType: LineType?
    public var crosshairMarkerVisible: Bool?
    public var crosshairMarkerRadius: Double?
    
    public var overlay: Bool?
    public var scaleMargins: PriceScaleMargins?
    
    public init(lastValueVisible: Bool? = nil,
                title: String? = nil,
                priceLineVisible: Bool? = nil,
                priceLineWidth: LineWidth? = nil,
                priceLineColor: ChartColor? = nil,
                priceLineStyle: LineStyle? = nil,
                priceFormat: PriceFormat? = nil,
                baseLineVisible: Bool? = nil,
                baseLineColor: ChartColor? = nil,
                baseLineWidth: LineWidth? = nil,
                baseLineStyle: LineStyle? = nil,
                color: ChartColor? = nil,
                lineStyle: LineStyle? = nil,
                lineWidth: LineWidth? = nil,
                lineType: LineType? = nil,
                crosshairMarkerVisible: Bool? = nil,
                crosshairMarkerRadius: Double? = nil,
                overlay: Bool? = nil,
                scaleMargins: PriceScaleMargins? = nil) {
        self.lastValueVisible = lastValueVisible
        self.title = title
        self.priceLineVisible = priceLineVisible
        self.priceLineWidth = priceLineWidth
        self.priceLineColor = priceLineColor
        self.priceLineStyle = priceLineStyle
        self.priceFormat = priceFormat
        self.baseLineVisible = baseLineVisible
        self.baseLineColor = baseLineColor
        self.baseLineWidth = baseLineWidth
        self.baseLineStyle = baseLineStyle
        self.color = color
        self.lineStyle = lineStyle
        self.lineWidth = lineWidth
        self.lineType = lineType
        self.crosshairMarkerVisible = crosshairMarkerVisible
        self.crosshairMarkerRadius = crosshairMarkerRadius
        self.overlay = overlay
        self.scaleMargins = scaleMargins
    }
    
}
