import Foundation

public struct HandleScrollOptions: Codable {
    
    public var mouseWheel: Bool?
    public var pressedMouseMove: Bool?
    public var horzTouchDrag: Bool?
    public var vertTouchDrag: Bool?
    
    public init(mouseWheel: Bool? = nil,
                pressedMouseMove: Bool? = nil,
                horzTouchDrag: Bool? = nil,
                vertTouchDrag: Bool? = nil) {
        self.mouseWheel = mouseWheel
        self.pressedMouseMove = pressedMouseMove
        self.horzTouchDrag = horzTouchDrag
        self.vertTouchDrag = vertTouchDrag
    }
    
}
