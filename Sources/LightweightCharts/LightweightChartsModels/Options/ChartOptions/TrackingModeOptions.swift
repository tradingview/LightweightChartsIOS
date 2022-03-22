import Foundation

/**
 * Represent options for the tracking mode's behavior.
 */
public struct TrackingModeOptions: Codable {
    public var exitMode: TrackingModeExitMode?
    
    public init(exitMode: TrackingModeExitMode? = nil) {
        self.exitMode = exitMode
    }
}

/**
 * Determine how to exit the tracking mode.
 *
 * By default, mobile users will long press to deactivate the scroll and have the ability to check values and dates.
 * Another press is required to activate the scroll, be able to move left/right, zoom, etc.
 */
public enum TrackingModeExitMode: Int, Codable {
    /**
     * Tracking Mode will be deactivated on touch end event.
     */
    case onTouchEnd
    /**
     * Tracking Mode will be deactivated on the next tap event.
     */
    case onNextTap
}
