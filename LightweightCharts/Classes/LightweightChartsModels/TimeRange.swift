import Foundation

public struct TimeRange: Codable {
    
    public var from: Time
    public var to: Time
    
    public init(from: Time, to: Time) {
        self.from = from
        self.to = to
    }
    
}
