import Foundation

/**
 Structure describing grid options
 */
public struct GridOptions {
    
    /**
     Vertical grid line options
     */
    public var verticalLines: GridLineOptions?
    
    /**
     Horizontal grid line options
     */
    public var horizontalLines: GridLineOptions?
    
    public init(verticalLines: GridLineOptions? = nil,
                horizontalLines: GridLineOptions? = nil) {
        self.verticalLines = verticalLines
        self.horizontalLines = horizontalLines
    }
    
}

// MARK: - Codable
extension GridOptions: Codable {
    
    enum CodingKeys: String, CodingKey {
        case verticalLines = "vertLines"
        case horizontalLines = "horzLines"
    }
    
}
