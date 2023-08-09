import Foundation

public struct AxisDoubleClickOptions: Codable {
    
    /**
     * Enable resetting scaling the time axis by double-clicking.
     */
    public var time: Bool?
    
    /**
     *  Enable reseting scaling the price axis by by double-clicking
     */
    public var price: Bool?
    
    public init(time: Bool? = nil, price: Bool? = nil) {
        self.time = time
        self.price = price
    }
    
}
