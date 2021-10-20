import Foundation
import WebKit

protocol JavaScriptEvaluator: AnyObject {
    
    func evaluateScript(_ script: String, completion: ((Any?, Error?) -> Void)?)
    func decodedResult<T: Decodable>(forScript script: String, completion: @escaping (T?) -> Void)
    func evaluate<T: Decodable>(script: String,
                                resultType: T.Type,
                                completion: @escaping (Result<T, Error>) -> Void)
    
}
