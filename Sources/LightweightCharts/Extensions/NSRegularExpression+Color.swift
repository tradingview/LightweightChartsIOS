import Foundation

extension NSRegularExpression {
    
    /**
     * Regular expression for __rgb(255, 255, 255)__ format strings
     * - group 0 - whole line
     * - group 1 - red
     * - group 2 - green
     * - group 3 - blue
     */
    static var rgb: NSRegularExpression? {
        let pattern = #"rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)"#
        return try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    /**
     * Regular expression for __rgba(255, 255, 255, 1.0)__ format strings
     * - group 0 - whole line
     * - group 1 - red
     * - group 2 - green
     * - group 3 - blue
     * - group 4 - alpha
     */
    static var rgba: NSRegularExpression? {
        let pattern = #"rgba\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*(0|1|1\.0|0\.\d+)\s*\)$"#
        return try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
}
