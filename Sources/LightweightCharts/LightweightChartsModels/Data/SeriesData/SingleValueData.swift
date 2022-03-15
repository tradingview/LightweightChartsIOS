import Foundation

/**
 A base interface for a data point of single-value series
 */
public protocol SingleValueData : SeriesData {
    
    /**
     * Price value of data item
     */
    var value: Double? { get }
}
