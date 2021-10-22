import Foundation

public enum TogglableOptions<Options> {
    case options(Options)
    case enabled(Bool)
}

// MARK: - Codable
extension TogglableOptions: Codable where Options: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let enabled = try? container.decode(Bool.self) {
            self = .enabled(enabled)
        } else if let options = try? container.decode(Options.self) {
            self = .options(options)
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
        case let .options(options):
            try container.encode(options)
        case let .enabled(enabled):
            try container.encode(enabled)
        }
    }
    
}
