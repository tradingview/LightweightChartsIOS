import Foundation

/// Structure that describes scaling behavior
public struct HandleScaleOptions: Codable {
    
    public var mouseWheel: Bool?
    public var pinch: Bool?
    public var axisPressedMouseMove: TogglableOptions<AxisPressedMouseMoveOptions>?
    public var axisDoubleClickReset: Bool?
    
    public init(mouseWheel: Bool? = nil,
                pinch: Bool? = nil,
                axisPressedMouseMove: TogglableOptions<AxisPressedMouseMoveOptions>? = nil,
                axisDoubleClickReset: Bool? = nil) {
        self.mouseWheel = mouseWheel
        self.pinch = pinch
        self.axisPressedMouseMove = axisPressedMouseMove
        self.axisDoubleClickReset = axisDoubleClickReset
    }
    
}
