import Foundation

public struct Point: Codable {

    public let x: Coordinate
    public let y: Coordinate
    
    public init(x: Coordinate, y: Coordinate) {
        self.x = x
        self.y = y
    }
    
}
