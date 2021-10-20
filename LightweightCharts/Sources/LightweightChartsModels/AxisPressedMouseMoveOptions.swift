import Foundation

public struct AxisPressedMouseMoveOptions: Codable {
    
    public var time: Bool?
    public var price: Bool?
    
    public init(time: Bool? = nil, price: Bool? = nil) {
        self.time = time
        self.price = price
    }
    
}
