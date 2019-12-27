import Foundation

protocol JavaScriptSyncMethod {
    
    func evaluate(payloadData: Data, with decoder: JSONDecoder) -> String
    
}
