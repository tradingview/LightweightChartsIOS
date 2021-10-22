import Foundation
import WebKit

protocol JavaScriptMessageProducer: AnyObject {
    
    func addMessageHandler(_ messageHandler: WKScriptMessageHandler, name: String)
    
}
