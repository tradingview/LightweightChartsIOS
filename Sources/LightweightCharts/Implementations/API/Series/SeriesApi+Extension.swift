import Foundation

public extension SeriesApi where Self: SeriesObject {
    
    func priceFormatter() -> PriceFormatterApi {
        let priceFormatter = PriceFormatter(context: context)
        let script = "var \(priceFormatter.jsName) = \(jsName).priceFormatter();"
        context.evaluateScript(script) { _, _ in
        }
        return priceFormatter
    }
    
    func coordinateToPrice(coordinate: Double, completion: @escaping (BarPrice?) -> Void) {
        let script = "\(jsName).coordinateToPrice(\(coordinate));"
        context.evaluateScript(script) { (result, _) in
            completion(result as? BarPrice)
        }
    }
    
    func priceToCoordinate(price: Double, completion: @escaping (Coordinate?) -> Void) {
        let script = "\(jsName).priceToCoordinate(\(price));"
        context.evaluateScript(script) { (result, _) in
            completion(result as? Coordinate)
        }
    }
    
    func barsInLogicalRange(range: FromToRange<Double>, completion: @escaping (BarsInfo?) -> Void) {
        let script = "\(jsName).barsInLogicalRange(\(range.jsonString));"
        context.decodedResult(forScript: script, completion: completion)
    }
    
    func applyOptions(options: Options) {
        let optionsScript = options.optionsScript(for: closureStore)
        let script = """
        \(optionsScript.options)
        \(jsName).applyOptions(\(optionsScript.variableName));
        """
        context.evaluateScript(script, completion: nil)
    }
    
    func options(completion: @escaping (Options?) -> Void) {
        let script = "\(jsName).options();"
        context.decodedResult(forScript: script, completion: completion)
    }
    
    func priceScale() -> PriceScaleApi {
        let priceScale = PriceScale(context: context)
        let script = "var \(priceScale.jsName) = \(jsName).priceScale();"
        context.evaluateScript(script) { _, _ in
        }
        return priceScale
    }
    
    func setData(data: [TickValue]) {
        setSeriesData(data)
    }
    
    func update(bar: TickValue) {
        updateSeriesBar(bar)
    }
    
    func setData(data: [WhitespaceData]) {
        setSeriesData(data)
    }
    
    func update(bar: WhitespaceData) {
        updateSeriesBar(bar)
    }
    
    func setData(data: [SeriesDataType<TickValue>]) {
        setSeriesData(data)
    }
    
    func update(bar: SeriesDataType<TickValue>) {
        updateSeriesBar(bar)
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
    
    func seriesType(completion: @escaping (SeriesType?) -> Void) {
        let script = "\(jsName).seriesType();"
        context.decodedResult(forScript: script, completion: completion)
    }
    
    private func setSeriesData<T: SeriesData>(_ data: [T]) {
        let script = "\(jsName).setData(\(data.jsonString));"
        context.evaluateScript(script, completion: nil)
    }
    
    private func updateSeriesBar<T: SeriesData>(_ bar: T) {
        let script = "\(jsName).update(\(bar.jsonString));"
        context.evaluateScript(script, completion: nil)
    }
    
    
}
