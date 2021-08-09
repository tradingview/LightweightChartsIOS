import Foundation

public protocol PriceLineApi: AnyObject {
    
    func applyOptions(options: PriceLineOptions)
    func options(completion: @escaping (PriceLineOptions?) -> Void)
    
}
