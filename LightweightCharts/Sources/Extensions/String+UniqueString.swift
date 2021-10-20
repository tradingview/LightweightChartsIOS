import Foundation

extension String {
    
    static var uniqueString: String {
        UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
}
