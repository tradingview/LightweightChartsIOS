import Foundation

public protocol PriceLineApi: class {
    
    func applyOptions(options: PriceLineOptions)
    func options(completion: @escaping (PriceLineOptions?) -> Void)
    
}
