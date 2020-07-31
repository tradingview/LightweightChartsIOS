import Foundation

public struct LocalizationOptions {
    
    // swiftlint:disable line_length
    /**
     * Current locale, which will be used for formatting dates.
     * [Documentation.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#Locale_identification_and_negotiation)
     */
    public var locale: String?
    // swiftlint:enable line_length
    
    /**
     * User-defined function for price formatting.
     * Could be used for some specific cases, that could not be covered with PriceFormat
     */
    public var priceFormatter: JavaScriptMethod<BarPrice, String>? {
        get {
            priceFormatterJSFunction?.function
        }
        set {
            priceFormatterJSFunction = newValue != nil ? JSFunction(function: newValue!) : nil
        }
    }
    
    /**
     * User-defined function for time formatting.
     */
    public var timeFormatter: JavaScriptMethod<EventTime, String>? {
        get {
            timeFormatterJSFunction?.function
        }
        set {
            timeFormatterJSFunction = newValue != nil ? JSFunction(function: newValue!) : nil
        }
    }
    
    /**
     * Date formatting string.
     * Might contains `yyyy`, `yy`, `MMMM`, `MMM`, `MM` and `dd` literals
     * which will be replaced with corresponding date's value.
     * Ignored if timeFormatter has been specified.
     */
    public var dateFormat: String?
    
    var priceFormatterJSFunction: JSFunction<BarPrice, String>?
    var timeFormatterJSFunction: JSFunction<EventTime, String>?
    
    public init(locale: String? = nil,
                dateFormat: String? = nil,
                priceFormatter: JavaScriptMethod<BarPrice, String>? = nil,
                timeFormatter: JavaScriptMethod<EventTime, String>? = nil) {
        self.locale = locale
        self.dateFormat = dateFormat
        self.priceFormatter = priceFormatter
        self.timeFormatter = timeFormatter
    }
    
}

// MARK: - Codable
extension LocalizationOptions: Codable {
    
    enum CodingKeys: String, CodingKey {
        case locale
        case dateFormat
    }
    
}
