import Foundation

public enum DateFormat: String, Codable {
    
    /// dd MMM \'yy
    case full = "dd MMM \'yy"
    /// yyyy-MM-dd
    case yearFirstMediumWithHyphen = "yyyy-MM-dd"
    /// yy-MM-dd
    case yearFirstShortWithHyphen = "yy-MM-dd"
    /// yy/MM/dd
    case yearFirstShortWithSlash = "yy/MM/dd"
    /// yyyy/MM/dd
    case yearFirstMediumWithSlash = "yyyy/MM/dd"
    /// dd-MM-yyyy
    case dayFirstMediumWithHyphen = "dd-MM-yyyy"
    /// dd-MM-yy
    case dayFirstShortWithHyphen = "dd-MM-yy"
    /// dd/MM/yy
    case dayFirstShortWithSlash = "dd/MM/yy"
    /// dd/MM/yyyy
    case dayFirstMediumWithSlash = "dd/MM/yyyy"
    /// MM/dd/yy
    case short = "MM/dd/yy"
    /// MM/dd/yyyy
    case medium = "MM/dd/yyyy"
    
}
