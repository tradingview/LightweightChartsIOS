import Foundation

public struct AutoScaleMargins {
    
    /** The number of pixels for bottom margin */
    public var below: Double?
    /** The number of pixels for top margin */
    public var above: Double?
    
}

public struct AutoscaleInfo {
    
    public var priceRange: PriceRange?
    public var margins: AutoScaleMargins?
    
}



public struct PriceRange {
    
    public var minValue: Double?
    public var maxValue: Double?
    
}

public typealias TickMarkFormatter = (_ time: EventTime, _ tickMarkType: TickMarkType, _ locale: String) -> String

// можно выполнять кложуру в аргументе, чтобы изменить текущее значение
public typealias AutoscaleInfoProvider = (_ baseImplementation: () -> AutoscaleInfo?) -> AutoscaleInfo?
