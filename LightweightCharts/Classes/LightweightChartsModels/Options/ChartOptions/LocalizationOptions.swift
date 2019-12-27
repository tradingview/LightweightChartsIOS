import Foundation

public struct LocalizationOptions {
    
    let jsonFlagForReplacing = UUID().uuidString
    
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
    public var priceFormatter: JavaScriptMethod<BarPrice>? {
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
    public var timeFormatter: JavaScriptMethod<EventTime>? {
        get {
            timeFormatterJSFunction?.function
        }
        set {
            timeFormatterJSFunction = newValue != nil ? JSFunction(function: newValue!) : nil
        }
    }
    
    /**
     * One of predefined options to format time. Ignored if timeFormatter has been specified.
     */
    public var dateFormat: DateFormat?
    
    var priceFormatterJSFunction: JSFunction<BarPrice>?
    var timeFormatterJSFunction: JSFunction<EventTime>?
    
    public init(locale: String? = nil,
                dateFormat: DateFormat? = nil,
                priceFormatter: JavaScriptMethod<BarPrice>? = nil,
                timeFormatter: JavaScriptMethod<EventTime>? = nil) {
        self.locale = locale
        self.dateFormat = dateFormat
        
        if let priceFormatter = priceFormatter {
            self.priceFormatterJSFunction = JSFunction(function: priceFormatter)
        }
        if let timeFormatter = timeFormatter {
            self.timeFormatterJSFunction = JSFunction(function: timeFormatter)
        }
    }
    
}

// MARK: - Codable
extension LocalizationOptions: Codable {
    
    enum CodingKeys: String, CodingKey {
        case locale
        case priceFormatter
        case timeFormatter
        case dateFormat
    }
    
    // MARK: Decodable
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        locale = try container.decodeIfPresent(String.self, forKey: .locale)
        dateFormat = try container.decodeIfPresent(DateFormat.self, forKey: .dateFormat)
        
        priceFormatterJSFunction = nil
        timeFormatterJSFunction = nil
    }
    
    // MARK: Encodable
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(locale, forKey: .locale)
        try container.encodeIfPresent(dateFormat, forKey: .dateFormat)
        
        if let priceFormatterJSFunction = priceFormatterJSFunction {
            let script = priceFormatterJSFunction.argumentString(withFlag: jsonFlagForReplacing)
            try container.encode(script, forKey: .priceFormatter)
        }
        
        if let timeFormatterJSFunction = timeFormatterJSFunction {
            let script = timeFormatterJSFunction.argumentString(withFlag: jsonFlagForReplacing)
            try container.encode(script, forKey: .timeFormatter)
        }
    }
    
}
