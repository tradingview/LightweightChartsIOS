import Foundation

public class SeriesObject: JavaScriptObject {
    
    static var name: String { String(describing: self) }
    
    let jsName: String
    
    unowned var context: JavaScriptEvaluator
    weak var closureStore: ClosuresStore?
    
    required init(context: JavaScriptEvaluator, closureStore: ClosuresStore?) {
        self.context = context
        self.closureStore = closureStore
        self.jsName = Self.name + .uniqueString
    }
    
}
