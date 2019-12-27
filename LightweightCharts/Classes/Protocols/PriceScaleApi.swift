import Foundation

/** Interface to control chart's price scale */
public protocol PriceScaleApi: class {
    
    /**
     * Applies new options to the price scale
     * - Parameter options: any subset of PriceScaleOptions
     */
    func applyOptions(options: PriceScaleOptions)

    /**
     * Returns currently applied options of the price scale
     * - Parameter completion: full set of currently applied options, including defaults
     */
    func options(completion: @escaping (PriceScaleOptions?) -> Void)
    
}
