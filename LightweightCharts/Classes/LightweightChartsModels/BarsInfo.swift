import Foundation

public struct BarsInfo: Codable {
    
    public var from: Time?
    public var to: Time?
    public var barsBefore: Double?
    public var barsAfter: Double?
    
    public init(from: Time? = nil, to: Time? = nil, barsBefore: Double? = nil, barsAfter: Double? = nil) {
        self.from = from
        self.to = to
        self.barsBefore = barsBefore
        self.barsAfter = barsAfter
    }
    
}
