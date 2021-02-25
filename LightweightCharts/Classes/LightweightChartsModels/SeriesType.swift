import Foundation


public enum SeriesType: String {
    case line = "Line"
    case area = "Area"
    case candlestick = "Candlestick"
    case bar = "Bar"
    case histogram = "Histogram"
    case none
}

extension SeriesType: Decodable {
    public init(from decoder: Decoder) throws {
        let type = try decoder.singleValueContainer().decode(String.self)
        self = SeriesType(rawValue: type) ?? .none
    }
}
