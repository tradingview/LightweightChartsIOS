import Foundation

public enum SeriesDataType<T>: SeriesData where T: SeriesData {
    
    case data(T)
    case whitespace(WhitespaceData)
    
    public var time: Time {
        switch self {
        case let .data(data):
            return data.time
        case let .whitespace(whitespaceData):
            return whitespaceData.time
        }
    }
    
}

// MARK: - Codable
extension SeriesDataType: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let data = try? container.decode(T.self) {
            self = .data(data)
        } else if let whitespaceData = try? container.decode(WhitespaceData.self) {
            self = .whitespace(whitespaceData)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Error decoding \(type(of: self))"
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .data(data):
            try container.encode(data)
        case let .whitespace(whitespaceData):
            try container.encode(whitespaceData)
        }
    }
    
}
