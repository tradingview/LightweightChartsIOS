import Foundation

/**
 * Represents a type of a base value of baseline series type.
 */
public enum BaseValueType {
    case baseValuePrice(BaseValuePrice)
}


// MARK: - CodingKeys
enum CodingKeys: String, CodingKey {
    case price
    case type
}

// MARK: - Codable
extension BaseValueType: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let price = try container.decode(Double.self, forKey: .price)
        let type = try container.decode(BaseValuePriceType.self, forKey: .type)
        
        self = .baseValuePrice(BaseValuePrice(price: price, type: type))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case let .baseValuePrice(valuePrice: valuePrice):
            try container.encode(valuePrice.price, forKey: .price)
            try container.encode(valuePrice.type, forKey: .type)
        }
    }
}

// MARK: - BaseValuePrice

/**
 * Represents a type of priced base value of baseline series type.
 */
public struct BaseValuePrice {
    
    /**
     * Price value.
     */
    public var price: Double
    
    /**
     * Distinguished type value.
     */
    public var type: BaseValuePriceType
    
    public init(price: Double, type: BaseValuePriceType) {
        self.price = price
        self.type = type
    }
}

// MARK: - BaseValuePriceType
public enum BaseValuePriceType: String, Codable {
    case price = "price"
}
