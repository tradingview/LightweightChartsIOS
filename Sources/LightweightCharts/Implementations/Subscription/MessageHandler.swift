import Foundation
import WebKit

protocol MessageHandlerDelegate: AnyObject {
    
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveClickWithParameters parameters: MouseEventParams)
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveCrosshairMoveWithParameters parameters: MouseEventParams)
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleTimeRangeChangeWithParameters parameters: TimeRange?)
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveVisibleLogicalRangeChangeWithParameters parameters: LogicalRange?)
    func messageHandler(_ messageHandler: MessageHandler,
                        didReceiveTimeScaleSizeChangeWithParameters parameters: Rectangle?)
}

// MARK: -
class MessageHandler: NSObject {
    
    weak var delegate: MessageHandlerDelegate?
    
    private func decode<T: Decodable>(_ jsonString: String) throws -> T {
        do {
            let data = jsonString.data(using: .utf8)!
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
}

// MARK: - WKScriptMessageHandler
extension MessageHandler: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        let nameComponents = message.name.components(separatedBy: "_")
        if let namePrefix = nameComponents.first,
            let subscription = Subscription(rawValue: namePrefix) {
            guard let messageBodyJSONString = message.body as? String else { return }
            switch subscription {
            case .click:
                if let parameters: MouseEventParams = try? decode(messageBodyJSONString) {
                    delegate?.messageHandler(self, didReceiveClickWithParameters: parameters)
                }
            case .crosshairMove:
                if let parameters: MouseEventParams = try? decode(messageBodyJSONString) {
                    delegate?.messageHandler(self, didReceiveCrosshairMoveWithParameters: parameters)
                }
            case .visibleTimeRangeChange:
                let parameters: TimeRange? = try? decode(messageBodyJSONString)
                delegate?.messageHandler(self, didReceiveVisibleTimeRangeChangeWithParameters: parameters)
            case .visibleLogicalRangeChange:
                let parameters: LogicalRange? = try? decode(messageBodyJSONString)
                delegate?.messageHandler(self, didReceiveVisibleLogicalRangeChangeWithParameters: parameters)
            case .timeScaleSizeChange:
                let parameters: Rectangle? = try? decode(messageBodyJSONString)
                delegate?.messageHandler(self, didReceiveTimeScaleSizeChangeWithParameters: parameters)
            }
        }
    }
    
}
