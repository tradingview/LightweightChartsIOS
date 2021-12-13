import Foundation

enum Subscription: String {
    case click = "ClickSubscriber"
    case crosshairMove = "CrosshairMoveSubscriber"
    case visibleTimeRangeChange = "VisibleTimeRangeChangeSubscriber"
    case visibleLogicalRangeChange = "VisibleLogicalRangeChangeSubscriber"
    case timeScaleSizeChange = "TimeScaleSizeChangeSubscriber"
    
    var jsRepresentation: String {
        switch self {
        case .click:
            return "Click"
        case .crosshairMove:
            return "CrosshairMove"
        case .visibleTimeRangeChange:
            return "VisibleTimeRangeChange"
        case .visibleLogicalRangeChange:
            return "VisibleLogicalRangeChange"
        case .timeScaleSizeChange:
            return "SizeChange"
        }
    }
    
}
