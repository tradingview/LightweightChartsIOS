import Foundation

/**
 * Enum of possible crosshair behavior modes.
 * Normal means that the crosshair always follows the pointer.
 * Magnet means that the vertical line of the crosshair follows the pointer,
 * while the horizontal line is placed on the corresponding series point.
 */
public enum CrosshairMode: Int, Codable {
    case normal
    case magnet
}

// MARK: -
/**
 Structure describing crosshair options
 */
public struct CrosshairOptions: Codable {
    
    /**
     Crosshair mode
     */
    public var mode: CrosshairMode?
    
    /**
     Options of the crosshair vertical line
     */
    public var vertLine: CrosshairLineOptions?
    
    /**
     Options of the crosshair horizontal line
     */
    public var horzLine: CrosshairLineOptions?
    
    public init(mode: CrosshairMode? = nil,
                vertLine: CrosshairLineOptions? = nil,
                horzLine: CrosshairLineOptions? = nil) {
        self.mode = mode
        self.vertLine = vertLine
        self.horzLine = horzLine
    }
    
}
