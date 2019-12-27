import Foundation

public enum Time {
    case utc(timestamp: Double)
    case businessDay(BusinessDay)
    case string(String)
}

// MARK: - Codable
extension Time: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let utcTimestamp = try? container.decode(Double.self) {
            self = .utc(timestamp: utcTimestamp)
        } else if let businessDay = try? container.decode(BusinessDay.self) {
            self = .businessDay(businessDay)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Error decoding \(type(of: self))")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .utc(timestamp: timestamp):
            try container.encode(timestamp)
        case let .businessDay(businessDay):
            try container.encode(businessDay)
        case let .string(string):
            try container.encode(string)
        }
    }
    
}
