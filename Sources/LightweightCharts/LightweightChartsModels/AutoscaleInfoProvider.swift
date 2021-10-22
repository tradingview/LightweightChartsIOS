import Foundation

public struct AutoscaleInfoProvider {
    
    public var function: JavaScriptMethod<AutoscaleInfo?, AutoscaleInfo>? { jsFunction?.function }
    
    let jsFunction: JSFunction<AutoscaleInfo?, AutoscaleInfo>?
    
    public init(_ function: JavaScriptMethod<AutoscaleInfo?, AutoscaleInfo>) {
        self.jsFunction = JSFunction(prompt: .autoscaleInfoProvider, function: function)
    }
    
}

// MARK: - Codable
extension AutoscaleInfoProvider: Codable {
    
    public func encode(to encoder: Encoder) throws {
    }
    
    public init(from decoder: Decoder) throws {
        jsFunction = nil
    }
    
}

// MARK: -
public struct AutoScaleMargins: Codable {
    
    /** The number of pixels for bottom margin */
    public var below: Double?
    /** The number of pixels for top margin */
    public var above: Double?
    
    public init(below: Double? = nil, above: Double? = nil) {
        self.below = below
        self.above = above
    }
    
}

// MARK: -
public struct AutoscaleInfo: Codable {
    
    public var priceRange: PriceRange?
    public var margins: AutoScaleMargins?
    
    public init(priceRange: PriceRange? = nil, margins: AutoScaleMargins? = nil) {
        self.priceRange = priceRange
        self.margins = margins
    }
    
}

// MARK: -
public struct PriceRange: Codable {
    
    public var minValue: Double?
    public var maxValue: Double?
    
    public init(minValue: Double? = nil, maxValue: Double? = nil) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
}
