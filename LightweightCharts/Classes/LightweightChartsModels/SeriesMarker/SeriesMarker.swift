import Foundation

public enum SeriesMarkerPosition: String, Codable {
    case aboveBar
    case belowBar
    case inBar
}

// MARK: -
public enum SeriesMarkerShape: String, Codable {
    case circle
    case square
    case arrowUp
    case arrowDown
}

// MARK: -
public struct SeriesMarker: Codable {
    
    public var time: Time
    public var position: SeriesMarkerPosition
    public var shape: SeriesMarkerShape
    public var color: ChartColor
    public var id: String?
    
    public init(time: Time,
                position: SeriesMarkerPosition,
                shape: SeriesMarkerShape,
                color: ChartColor,
                id: String?) {
        self.time = time
        self.position = position
        self.shape = shape
        self.color = color
        self.id = id
    }
    
}
