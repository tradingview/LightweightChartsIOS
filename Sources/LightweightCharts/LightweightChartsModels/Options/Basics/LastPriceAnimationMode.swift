import Foundation

/**
 This enum is used to specify the type of the last price animation for series such as area or line
 */
public enum LastPriceAnimationMode: Int, Codable {
    /**
     Animation is always disabled
     */
    case disabled
    
    /**
     Animation is always enabled
     */
    case continuous
    
    /**
     Animation is active some time after data update
     */
    case onDataUpdate
}
