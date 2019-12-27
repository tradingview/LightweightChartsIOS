import Foundation

public struct HandleScaleOptions: Codable {
    
    public var mouseWheel: Bool?
    public var pinch: Bool?
    public var axisPressedMouseMove: Bool?
    public var axisDoubleClickReset: Bool?
    
    public init(mouseWheel: Bool? = nil,
                pinch: Bool? = nil,
                axisPressedMouseMove: Bool? = nil,
                axisDoubleClickReset: Bool? = nil) {
        self.mouseWheel = mouseWheel
        self.pinch = pinch
        self.axisPressedMouseMove = axisPressedMouseMove
        self.axisDoubleClickReset = axisDoubleClickReset
    }
    
}
