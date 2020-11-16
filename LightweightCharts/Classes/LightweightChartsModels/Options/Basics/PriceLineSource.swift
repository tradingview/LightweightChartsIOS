import Foundation

public enum PriceLineSource: Int, Codable {
    /**
     * The last bar data
     */
    case lastBar
    /**
     * The last visible bar in viewport
     */
    case lastVisible
}
