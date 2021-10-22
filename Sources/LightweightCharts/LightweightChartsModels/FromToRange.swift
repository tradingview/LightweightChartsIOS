import Foundation

public struct FromToRange<T> {

    public var from: T
    public var to: T
    
    public init(from: T, to: T) {
        self.from = from
        self.to = to
    }
    
}

// MARK: -
extension FromToRange: Codable where T: Codable { }

// MARK: -
public typealias Logical = Double

// MARK: -
public typealias LogicalRange = FromToRange<Logical>

// MARK: -
public typealias TimeRange = FromToRange<Time>
