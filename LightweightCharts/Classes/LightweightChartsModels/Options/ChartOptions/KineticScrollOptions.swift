import Foundation

/**
 You can disable or enable kinetic scroll via mouse or via touch gestures separately
 */
public struct KineticScrollOptions: Codable {
    
    /**
     If true, kinetic scroll is enabled via touch gestures
     */
    var touch: Bool?
    
    /**
     If true, kinetic scroll is enabled via mouse
     */
    var mouse: Bool?
    
    public init(touch: Bool? = nil, mouse: Bool? = nil) {
        self.touch = touch
        self.mouse = mouse
    }
}
