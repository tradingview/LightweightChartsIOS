
import Foundation

/// Structure that describes scaling behavior
public struct HandleScaleOptions: Codable {
    
    public var mouseWheel: Bool?
    public var pinch: Bool?
    public var axisPressedMouseMove: TogglableOptions<AxisPressedMouseMoveOptions>?
    public var axisDoubleClickReset: TogglableOptions<AxisDoubleClickOptions>?
    
    public init(mouseWheel: Bool? = nil,
                pinch: Bool? = nil,
                axisPressedMouseMove: TogglableOptions<AxisPressedMouseMoveOptions>? = nil,
                axisDoubleClickReset: TogglableOptions<AxisDoubleClickOptions>? = nil) {
        self.mouseWheel = mouseWheel
        self.pinch = pinch
        self.axisPressedMouseMove = axisPressedMouseMove
        self.axisDoubleClickReset = axisDoubleClickReset
    }
    
}
