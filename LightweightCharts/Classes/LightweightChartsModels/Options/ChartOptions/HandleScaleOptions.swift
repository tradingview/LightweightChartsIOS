import Foundation

/// Enum that describes scaling behavior or boolean flag that disables/enables all kinds of scales
public enum HandleScaleOptions {
    case options(Options)
    case enabled(Bool)
}

// MARK: -
extension HandleScaleOptions {
    
    public struct Options: Codable {
        
        public var mouseWheel: Bool?
        public var pinch: Bool?
        public var axisPressedMouseMove: Bool?
        public var axisDoubleClickReset: Bool?
        
        public init(mouseWheel: Bool? = nil,
                    pinch: Bool? = nil,
                    axisPressedMouseMove: Bool? = nil,
                    axisDoubleClickReset: Bool? = nil) {
            self.mouseWheel = mouseWheel
            self.pinch = pinch
            self.axisPressedMouseMove = axisPressedMouseMove
            self.axisDoubleClickReset = axisDoubleClickReset
        }
        
    }
    
}

// MARK: - Codable
extension HandleScaleOptions: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let enabled = try? container.decode(Bool.self) {
            self = .enabled(enabled)
        } else if let options = try? container.decode(Options.self) {
            self = .options(options)
        } else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Error decoding \(type(of: self))")
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
