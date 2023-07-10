
import Foundation

// MARK: -
public enum EventTime {
    case utc(timestamp: Double)
    case businessDay(BusinessDay)
    case businessDayString(String)
}

// MARK: -
public enum EventPrices {
    case barData(BarData)
    case lineData(LineData)
    case none
}

// MARK: -
public struct TouchMouseEventData: Codable {
    
    /**
     * The X coordinate of the mouse pointer in local (DOM content) coordinates.
     */
    public let  clientX: Double?
    
    /**
     * The Y coordinate of the mouse pointer in local (DOM content) coordinates.
     */
    public let  clientY: Double?
    
    /**
     * The X coordinate of the mouse pointer relative to the whole document.
     */
    public let  pageX: Double?
    
    /**
     * The Y coordinate of the mouse pointer relative to the whole document.
     */
    public let  pageY: Double?
    
    /**
     * The X coordinate of the mouse pointer in global (screen) coordinates.
     */
    public let  screenX: Double?
    
    /**
     * The Y coordinate of the mouse pointer in global (screen) coordinates.
     */
    public let  screenY: Double?
    
    /**
     * The X coordinate of the mouse pointer relative to the chart / price axis / time axis canvas element.
     */
    public let  localX: Double?
    
    /**
     * The Y coordinate of the mouse pointer relative to the chart / price axis / time axis canvas element.
     */
    public let  localY: Double?
    
    /**
     * Returns a boolean value that is true if the Ctrl key was active when the key event was generated.
     */
    public let  ctrlKey: Bool?
    
    /**
     * Returns a boolean value that is true if the Alt (Option or ⌥ on macOS) key was active when the
     * key event was generated.
     */
    public let  altKey: Bool?
    
    /**
     * Returns a boolean value that is true if the Shift key was active when the key event was generated.
     */
    public let  shiftKey: Bool?
    
    /**
     * Returns a boolean value that is true if the Meta key (on Mac keyboards, the ⌘ Command key; on
     * Windows keyboards, the Windows key (⊞)) was active when the key event was generated.
     */
    public let  metaKey: Bool?
    
    public init(clientX: Double?,
                clientY: Double?,
                pageX: Double?,
                pageY: Double?,
                screenX: Double?,
                screenY: Double?,
                localX: Double?,
                localY: Double?,
                ctrlKey: Bool?,
                altKey: Bool?,
                shiftKey: Bool?,
                metaKey: Bool?) {
        self.clientX = clientX
        self.clientY = clientY
        self.pageX = pageX
        self.pageY = pageY
        self.screenX = screenX
        self.screenY = screenY
        self.localX = localX
        self.localY = localY
        self.ctrlKey = ctrlKey
        self.altKey = altKey
        self.shiftKey = shiftKey
        self.metaKey = metaKey
    }
    
}


// MARK: -
public struct MouseEventParams: Codable {
    
    public let time: EventTime?
    public let logical: Int?
    public let point: Point?
    public let hoveredObjectId: Int?
    public let sourceEvent: TouchMouseEventData?
    
    public let hoveredSeries: String?
    
    private let seriesData: [String: EventPrices?]
    
    public init(time: EventTime?, logical: Int?, point: Point?, hoveredObjectId: Int?, sourceEvent: TouchMouseEventData?, hoveredSeries: String?) {
        self.time = time
        self.logical = logical
        self.point = point
        self.hoveredObjectId = hoveredObjectId
        self.sourceEvent = sourceEvent
        self.seriesData = [:]
        self.hoveredSeries = hoveredSeries
    }
    
    public func price(forSeries series: SeriesObject) -> EventPrices? {
        seriesData[series.jsName] ?? nil
    }
    
}

// MARK: - EventTime Cadable
extension EventTime: Codable {
    
    // MARK: Decodable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let utcTimestamp = try? container.decode(Double.self) {
            self = .utc(timestamp: utcTimestamp)
        } else if let businessDay = try? container.decode(BusinessDay.self) {
            self = .businessDay(businessDay)
        } else if let businessDayString = try? container.decode(String.self) {
            self = .businessDayString(businessDayString)
        } else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Error decoding \(type(of: self))")
        }
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .utc(timestamp: timestamp):
            try container.encode(timestamp)
        case let .businessDay(businessDay):
            try container.encode(businessDay)
        case let .businessDayString(businessDayString):
            try container.encode(businessDayString)
        }
    }
    
}

// MARK: - EventPrices Cadable
extension EventPrices: Codable {
    
    // MARK: Decodable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let lineData = try? container.decode(LineData.self), lineData.value != nil {
            self = .lineData(lineData)
        } else if let barData = try? container.decode(BarData.self) {
            self = .barData(barData)
        } else {
            self = .none
        }
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .barData(value):
            try container.encode(value)
        case let .lineData(value):
            try container.encode(value)
        case .none:
            break
        }
    }
    
}
