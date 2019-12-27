import Foundation

public struct PriceLineOptions: Codable {
    
    public var price: BarPrice?
    public var color: ChartColor?
    public var lineWidth: LineWidth?
    public var lineStyle: LineStyle?
    
    public init(price: BarPrice? = nil,
                color: ChartColor? = nil,
                lineWidth: LineWidth? = nil,
                lineStyle: LineStyle? = nil) {
        self.price = price
        self.color = color
        self.lineWidth = lineWidth
        self.lineStyle = lineStyle
    }
    
}
