import Foundation

public enum TickMarkType: Int, Codable {
    case year
    case month
    case dayOfMonth
    case time
    case timeWithSeconds
}

public struct TickMarkFormatterParameters: Codable {
    
    public let time: EventTime
    public let tickMarkType: TickMarkType
    public let locale: String
    
    public init(time: EventTime, tickMarkType: TickMarkType, locale: String) {
        self.time = time
        self.tickMarkType = tickMarkType
        self.locale = locale
    }
    
}
