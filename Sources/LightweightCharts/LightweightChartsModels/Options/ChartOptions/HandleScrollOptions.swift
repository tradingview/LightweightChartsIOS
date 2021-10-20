import Foundation

/// Enum that describes scrolling behavior or boolean flag that disables/enables all kinds of scrolls
public enum HandleScrollOptions {
    case options(Options)
    case enabled(Bool)
}

// MARK: -
extension HandleScrollOptions {
    
    public struct Options: Codable {
        
        public var mouseWheel: Bool?
        public var pressedMouseMove: Bool?
        public var horzTouchDrag: Bool?
        public var vertTouchDrag: Bool?
        
        public init(mouseWheel: Bool? = nil,
                    pressedMouseMove: Bool? = nil,
                    horzTouchDrag: Bool? = nil,
                    vertTouchDrag: Bool? = nil) {
            self.mouseWheel = mouseWheel
            self.pressedMouseMove = pressedMouseMove
            self.horzTouchDrag = horzTouchDrag
            self.vertTouchDrag = vertTouchDrag
        }
        
    }
    
}

// MARK: - Codable
extension HandleScrollOptions: Codable {
    
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
