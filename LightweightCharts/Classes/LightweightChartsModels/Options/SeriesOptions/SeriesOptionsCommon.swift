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
     * @internal
     */
//    var seriesLastValueMode: PriceAxisLastValueMode? { get }

    /**
     Visibility of the price line. Price line is a horizontal line indicating the last price of the series
     */
    var priceLineVisible: Bool? { get }
    
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
    
    var overlay: Bool? { get }
    
    var scaleMargins: PriceScaleMargins? { get }
    
}


extension SeriesOptionsCommon {

    func formattedJSONtoJavaScript() -> SeriesFormattedJSONtoJavaScript {
        var jsonOptions = jsonString
        var functionScript = ""
        var customFormatterFunction: FunctionWithName<BarPrice>?
        
        if let formatter = priceFormat {
            switch formatter {
            case let .custom(customFormatter):
                if let formatterJSFunction = customFormatter.formatterJSFunction {
                    let name = formatterJSFunction.name
                    customFormatterFunction = FunctionWithName(name: name, function: formatterJSFunction.function)
                    let flag = customFormatter.jsonFlagForReplacing
                    functionScript = formatterJSFunction.declarationScript()
                    jsonOptions = jsonOptions
                        .replacingOccurrences(of: "\"\(flag)", with: "")
                        .replacingOccurrences(of: "\(flag)\"", with: "")
                }
            case .builtIn:
                break
            }
        }
        
        return SeriesFormattedJSONtoJavaScript(
            functionsDeclarations: functionScript,
            optionsScript: jsonOptions,
            customFormatter: customFormatterFunction
        )
    }
    
}
