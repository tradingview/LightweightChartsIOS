import Foundation

/**
 * Structure describing options common for all types of series
 */
public protocol SeriesOptionsCommon: Codable {
    
    /**
     Visibility of the label with the latest visible price on the price scale
     */
    var lastValueVisible: Bool? { get }
    
    /**
     Title of the series. This label is placed with price axis label
     */
    var title: String? { get }
    
    /**
     Target price scale to bind new series to
     */
    var priceScaleId: String? { get }
    
    /**
     Visibility of series.
     */
    var visible: Bool? { get }
    
    /**
     Visibility of the price line. Price line is a horizontal line indicating the last price of the series
     */
    var priceLineVisible: Bool? { get }
    
    /**
     Enum of possible modes of priceLine source
     */
    var priceLineSource: PriceLineSource? { get }
    
    /**
     Width of the price line. Ignored if priceLineVisible is false
     */
    var priceLineWidth: LineWidth? { get }
    
    /**
     Color of the price line. Ignored if priceLineVisible is false
     */
    var priceLineColor: ChartColor? { get }
    
    /**
     Price line style. Suitable for percentage and indexedTo100 scales
     */
    var priceLineStyle: LineStyle? { get }
    
    /**
     Formatting settings associated with the series
     */
    var priceFormat: PriceFormat? { get }
    
    /**
     Visibility of base line. Suitable for percentage and indexedTo100 scales
     */
    var baseLineVisible: Bool? { get }
    
    /**
     Color of the base line in IndexedTo100 mode
     */
    var baseLineColor: ChartColor? { get }
    
    /**
     Base line width. Suitable for percentage and indexedTo100 scales. Ignored if baseLineVisible is not set
     */
    var baseLineWidth: LineWidth? { get }
    
    /**
     Base line style. Suitable for percentage and indexedTo100 scales. Ignored if baseLineVisible is not set
     */
    var baseLineStyle: LineStyle? { get }
    
    /**
     Function that overrides calculating of visible prices range
     */
    var autoscaleInfoProvider: AutoscaleInfoProvider? { get }
    
}

// MARK: -
extension SeriesOptionsCommon {
    
    func optionsScript(for closuresStore: ClosuresStore?) -> (options: String, variableName: String) {
        let variableName = "options"
        var optionsScript = "var \(variableName) = \(jsonString);"
        if case let .custom(customFormatter) = priceFormat, let formatter = customFormatter.formatterJSFunction {
            closuresStore?.addMethod(formatter.function, forName: formatter.name)
            optionsScript.append("\(variableName).priceFormat.formatter = \(formatter.script());")
        }
        if let provider = autoscaleInfoProvider?.jsFunction {
            closuresStore?.addMethod(provider.function, forName: provider.name)
            optionsScript.append("\(variableName).autoscaleInfoProvider = \(provider.script());")
        }
        return (optionsScript, variableName)
    }
    
}
