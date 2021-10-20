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
    
}
