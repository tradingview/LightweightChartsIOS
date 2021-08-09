import Foundation

/** Interface to be implemented by the object in order to be used as a price formatter */
public protocol PriceFormatterApi: AnyObject {
    
    /**
     * Formatting function
     * - Parameter price: original price to be formatted
     * - Parameter completion: formatted price
     */
    func format(price: BarPrice, completion: @escaping (String?) -> Void)
    
}
