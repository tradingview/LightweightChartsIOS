import Foundation


public enum SeriesType: String, Decodable {
    case line = "Line"
    case area = "Area"
    case candlestick = "Candlestick"
    case bar = "Bar"
    case histogram = "Histogram"
}
