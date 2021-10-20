import Foundation

/** Interface to control chart's price scale */
public protocol PriceScaleApi: AnyObject {
    
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
    
    /**
     * Returns a width of the price scale if it's visible or 0 if invisible.
     * - Parameter completion: a width of the price scale if it's visible or 0 if invisible
     */
    func width(completion: @escaping (Double?) -> Void)
    
}
