import Foundation

public extension SeriesApi where Self: SeriesObject {
    
    func priceFormatter() -> PriceFormatterApi {
        let priceFormatter = PriceFormatter(context: context)
        let script = "var \(priceFormatter.jsName) = \(jsName).priceFormatter();"
        context.evaluateScript(script) { _, _ in
        }
        return priceFormatter
    }
    
    func coordinateToPrice(coordinate: Coordinate, completion: @escaping (BarPrice?) -> Void) {
        let script = "\(jsName).coordinateToPrice(\(coordinate));"
        context.evaluateScript(script) { (result, _) in
            completion(result as? BarPrice)
        }
    }
    
    func priceToCoordinate(price: BarPrice, completion: @escaping (Coordinate?) -> Void) {
        let script = "\(jsName).priceToCoordinate(\(price));"
        context.evaluateScript(script) { (result, _) in
            completion(result as? Coordinate)
        }
    }
    
    func applyOptions(options: Options) {
        let formattedJSON = options.formattedJSONtoJavaScript()
        let script = """
        \(formattedJSON.functionsDeclarations)
        \(jsName).applyOptions(\(formattedJSON.optionsScript));
        """
        if let customFormatter = formattedJSON.customFormatter {
            closureStore?.addMethod(customFormatter.function, forName: customFormatter.name)
        }
        context.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (Options?) -> Void) {
        let script = "\(jsName).options();"
        context.decodedResult(forScript: script, completion: completion)
    }
    
    func setData(data: [TickValue]) {
        let script = "\(jsName).setData(\(data.jsonString));"
        context.evaluateScript(script, completion: nil)
    }
    
    func update(bar: TickValue) {
        let script = "\(jsName).update(\(bar.jsonString));"
        context.evaluateScript(script, completion: nil)
    }
    
    func setMarkers(data: [SeriesMarker]) {
        let script = "\(jsName).setMarkers(\(data.jsonString));"
        context.evaluateScript(script, completion: nil)
    }
    
    func createPriceLine(options: PriceLineOptions?) -> PriceLine {
        let priceLine = PriceLine(context: context)
        let options = options ?? PriceLineOptions()
        let script = "var \(priceLine.jsName) = \(jsName).createPriceLine(\(options.jsonString));"
        context.evaluateScript(script, completion: nil)
        return priceLine
    }
    
    func removePriceLine(line: PriceLine) {
        let script = "\(jsName).removePriceLine(\(line.jsName));"
        context.evaluateScript(script, completion: nil)
    }
    
}
