import Foundation

public struct TimeScaleOptions: Codable {
    
    public var rightOffset: Double?
    public var barSpacing: Double?
    public var fixLeftEdge: Bool?
    public var lockVisibleTimeRangeOnResize: Bool?
    public var rightBarStaysOnScroll: Bool?
    public var borderVisible: Bool?
    public var borderColor: ChartColor?
    public var visible: Bool?
    public var timeVisible: Bool?
    public var secondsVisible: Bool?
    
    public init(rightOffset: Double? = nil,
                barSpacing: Double? = nil,
                fixLeftEdge: Bool? = nil,
                lockVisibleTimeRangeOnResize: Bool? = nil,
                rightBarStaysOnScroll: Bool? = nil,
                borderVisible: Bool? = nil,
                borderColor: ChartColor? = nil,
                visible: Bool? = nil,
                timeVisible: Bool? = nil,
                secondsVisible: Bool? = nil) {
        self.rightOffset = rightOffset
        self.barSpacing = barSpacing
        self.fixLeftEdge = fixLeftEdge
        self.lockVisibleTimeRangeOnResize = lockVisibleTimeRangeOnResize
        self.rightBarStaysOnScroll = rightBarStaysOnScroll
        self.borderVisible = borderVisible
        self.borderColor = borderColor
        self.visible = visible
        self.timeVisible = timeVisible
        self.secondsVisible = secondsVisible
    }

}
