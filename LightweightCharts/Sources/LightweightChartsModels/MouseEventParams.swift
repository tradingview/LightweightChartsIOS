import Foundation

// MARK: -
public enum EventTime {
    case utc(timestamp: Double)
    case businessDay(BusinessDay)
}

// MARK: -
public enum EventPrices {
    case barPrice(BarPrice)
    case barPrices(BarPrices)
    case none
}

// MARK: -
public struct BarPrices: Codable {
    
    public let open: BarPrice
    public let high: BarPrice
    public let low: BarPrice
    public let close: BarPrice
    
    public init(open: BarPrice, high: BarPrice, low: BarPrice, close: BarPrice) {
        self.open = open
        self.high = high
        self.low = low
        self.close = close
    }
    
}

// MARK: -
public struct MouseEventParams: Codable {
    
    public let time: EventTime?
    public let point: Point?
    public let hoveredMarkerId: Int?
    
    private let seriesPrices: [String: EventPrices?]
    
    public init(time: EventTime?, point: Point?, hoveredMarkerId: Int?) {
        self.time = time
        self.point = point
        self.hoveredMarkerId = hoveredMarkerId
        self.seriesPrices = [:]
    }
    
    public func price(forSeries series: SeriesObject) -> EventPrices? {
        seriesPrices[series.jsName] ?? nil
    }
    
}

// MARK: - EventTime Cadable
extension EventTime: Codable {
    
    // MARK: Decodable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let utcTimestamp = try? container.decode(Double.self) {
            self = .utc(timestamp: utcTimestamp)
        } else if let businessDay = try? container.decode(BusinessDay.self) {
            self = .businessDay(businessDay)
        } else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Error decoding \(type(of: self))")
        }
    }
    
    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .utc(timestamp: timestamp):
            try container.encode(timestamp)
        case let .businessDay(businessDay):
            try container.encode(businessDay)
        }
    }
    
}

// MARK: - EventPrices Cadable
extension EventPrices: Codable {
    
    // MARK: Decodable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let barPrice = try? container.decode(BarPrice.self) {
            self = .barPrice(barPrice)
        } else if let barPrices = try? container.decode(BarPrices.self) {
            self = .barPrices(barPrices)
        } else {
            self = .none
        }
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .barPrice(value):
            try container.encode(value)
        case let .barPrices(value):
            try container.encode(value)
        case .none:
            break
        }
    }
    
}
