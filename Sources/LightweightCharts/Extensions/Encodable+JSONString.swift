import Foundation

extension Encodable {
    
    /// JSON string from object encoded with JSONEncoder.
    var jsonString: String {
        guard let jsonData = try? JSONEncoder().encode(self),
              let jsonString = String(data: jsonData, encoding: .utf8)
        else {
            return ""
        }
        return jsonString
    }
    
}
