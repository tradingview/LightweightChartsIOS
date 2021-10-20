import WebKit

public protocol JavaScriptErrorDelegate: AnyObject {
    
    func didFailEvaluateScript(_ script: String, withError error: Error)
    
}

// MARK: -
class WebView: WKWebView {
        
    weak var errorDelegate: JavaScriptErrorDelegate?
    
}

// MARK: - JavaScriptEvaluator
extension WebView: JavaScriptEvaluator {
    
    func evaluateScript(_ script: String, completion: ((Any?, Error?) -> Void)?) {
        evaluateJavaScript(script) { [weak self] (result, error) in
            if let error = error {
                self?.errorDelegate?.didFailEvaluateScript(script, withError: error)
            }
            completion?(result, error)
        }
    }
    
    func decodedResult<T: Decodable>(forScript script: String, completion: @escaping (T?) -> Void) {
        let jsonStringifiedScrpt = "var scriptResult = \(script); JSON.stringify(scriptResult);"
        evaluate(script: jsonStringifiedScrpt, resultType: T.self) { result in
            switch result {
            case let .success(model):
                completion(model)
            case .failure:
                completion(nil)
            }
        }
    }
    
    func evaluate<T: Decodable>(script: String,
                                resultType: T.Type,
                                completion: @escaping (Result<T, Error>) -> Void) {
        evaluateJavaScript(script) { (scriptResult, error) in
            if let error = error {
                self.errorDelegate?.didFailEvaluateScript(script, withError: error)
                completion(.failure(error))
                return
            }
            do {
                let jsonString = (scriptResult as? String) ?? ""
                let jsonData = jsonString.data(using: .utf8) ?? Data()
                let result: T = try self.decodeResult(jsonData)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    private func decodeResult<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
}

// MARK: - JavaScriptMessageProducer
extension WebView: JavaScriptMessageProducer {
    
    func addMessageHandler(_ messageHandler: WKScriptMessageHandler, name: String) {
        configuration.userContentController.add(messageHandler, name: name)
    }
    
}
