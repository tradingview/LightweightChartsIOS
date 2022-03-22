import Foundation

/**
 Represents a bar with a Time and open, high, low, and close prices.
 */
public protocol OhlcData : SeriesData {
    
    /**
     The bar time
     */
    var time: Time { get }

    /**
     The open price
     */
    var open: Double? { get }
    
    /**
     The high price
     */
    var high: Double? { get }
    
    /**
     The low price
     */
    var low: Double? { get }
    
    /**
     The close price
     */
    var close: Double? { get }
}
