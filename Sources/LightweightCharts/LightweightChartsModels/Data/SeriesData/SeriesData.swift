import Foundation

public protocol SeriesData: Codable {
    
    /**
     The time of the data
     */
    var time: Time { get }
    
}
