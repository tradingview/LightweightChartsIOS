import Foundation

public enum SurfaceColor {
    case solid(color: ChartColor)
    case verticalGradient(topColor: ChartColor, bottomColor: ChartColor)
    
    public var type: ColorType {
        switch self {
        case .solid:
            return .solid
        case .verticalGradient:
            return .verticalGradient
        }
    }
}

// MARK: - CodingKeys
extension SurfaceColor {
    enum CodingKeys: String, CodingKey {
        case type
        case color
        case topColor
        case bottomColor
    }
}

// MARK: - Codable
extension SurfaceColor: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let colorType = try container.decode(ColorType.self, forKey: .type)
        
        switch colorType {
        case .solid:
            let color = try container.decode(ChartColor.self, forKey: .color)
            self = .solid(color: color)
        case .verticalGradient:
            let topColor = try container.decode(ChartColor.self, forKey: .topColor)
            let bottomColor = try container.decode(ChartColor.self, forKey: .bottomColor)
            self = .verticalGradient(topColor: topColor, bottomColor: bottomColor)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.type.rawValue, forKey: .type)
        
        switch self {
        case let .solid(color: color):
            try container.encode(color, forKey: .color)
        case let .verticalGradient(topColor: topColor, bottomColor: bottomColor):
            try container.encode(topColor, forKey: .topColor)
            try container.encode(bottomColor, forKey: .bottomColor)
        }
    }
}
