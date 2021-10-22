import Foundation

public struct PriceLineOptions: Codable {
    
    public var price: Double?
    public var color: ChartColor?
    public var lineWidth: LineWidth?
    public var lineStyle: LineStyle?
    public var axisLabelVisible: Bool?
    public var title: String?
    
    public init(price: Double? = nil,
                color: ChartColor? = nil,
                lineWidth: LineWidth? = nil,
                lineStyle: LineStyle? = nil,
                axisLabelVisible: Bool? = nil,
                title: String? = nil) {
        self.price = price
        self.color = color
        self.lineWidth = lineWidth
        self.lineStyle = lineStyle
        self.axisLabelVisible = axisLabelVisible
        self.title = title
    }
    
}
