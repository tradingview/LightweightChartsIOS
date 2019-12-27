import Foundation

enum Subscription: String {
    case click = "ClickSubscriber"
    case crosshairMove = "CrosshairMoveSubscriber"
    case visibleTimeRangeChange = "VisibleTimeRangeChangeSubscriber"
    
    var jsRepresentation: String {
        switch self {
        case .click:                    return "Click"
        case .crosshairMove:            return "CrosshairMove"
        case .visibleTimeRangeChange:   return "VisibleTimeRangeChange"
        }
    }
    
}
