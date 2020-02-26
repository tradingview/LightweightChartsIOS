import Foundation

public enum DateFormat: String, Codable {
    
    /// \'yy MMM dd
    case yearFirstShortMonthMedium = "\'yy MMM dd"
    /// \'yy MMMM dd
    case yearFirstShortMonthFull = "\'yy MMMM dd"
    /// yyyy MMM dd
    case yearFirstFullMonthMedium = "yyyy MMM dd"
    /// yyyy MMMM dd
    case yearFirstFullMonthFull = "yyyy MMMM dd"
    /// dd MMM \'yy
    case full = "dd MMM \'yy"
    /// dd MMMM \'yy
    case dayFirstMonthFullYearShort = "dd MMMM \'yy"
    /// dd MMM yyyy
    case dayFirstMonthMediumYearFull = "dd MMM yyyy"
    /// dd MMMM yyyy
    case dayFirstMonthFullYearFull = "dd MMMM yyyy"
    /// MMM dd, \'yy
    case monthFirstMediumYearShortWithComma = "MMM dd, \'yy"
    /// MMMM dd, \'yy
    case monthFirstFullYearShortWithComma = "MMMM dd, \'yy"
    /// MMM dd, yyyy
    case monthFirstMediumYearFullWithComma = "MMM dd, yyyy"
    /// MMMM dd, yyyy
    case monthFirstFullYearFullWithComma = "MMMM dd, yyyy"
    /// yyyy-MM-dd
    case yearFirstMediumWithHyphen = "yyyy-MM-dd"
    /// yy-MM-dd
    case yearFirstShortWithHyphen = "yy-MM-dd"
    /// yy/MM/dd
    case yearFirstShortWithSlash = "yy/MM/dd"
    /// yyyy/MM/dd
    case yearFirstMediumWithSlash = "yyyy/MM/dd"
    /// yy.MM.dd
    case yearFirstShortMonthShortWithDots = "yy.MM.dd"
    /// yyyy.MM.dd
    case yearFirstFullMonthShortWithDots = "yyyy.MM.dd"
    /// dd-MM-yyyy
    case dayFirstMediumWithHyphen = "dd-MM-yyyy"
    /// dd-MM-yy
    case dayFirstShortWithHyphen = "dd-MM-yy"
    /// dd/MM/yy
    case dayFirstShortWithSlash = "dd/MM/yy"
    /// dd/MM/yyyy
    case dayFirstMediumWithSlash = "dd/MM/yyyy"
    /// dd.MM.yy
    case dayFirstMonthShortYearShortWithDots = "dd.MM.yy"
    /// dd.MM.yyyy
    case dayFirstMonthShortYearFullWithDots = "dd.MM.yyyy"
    /// MM-dd-yy
    case monthFirstShortYearShortWithHyphen = "MM-dd-yy"
    /// MM-dd-yyyy
    case monthFirstShortYearFullWithHyphen = "MM-dd-yyyy"
    /// MM/dd/yy
    case short = "MM/dd/yy"
    /// MM/dd/yyyy
    case medium = "MM/dd/yyyy"
    /// MM.dd.yy
    case monthFirstShortYearShortWithDots = "MM.dd.yy"
    /// MM.dd.yyyy
    case monthFirstShortYearFullWithDots = "MM.dd.yyyy"
    
}
