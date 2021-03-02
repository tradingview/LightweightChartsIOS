import Foundation
import UIKit

extension Int {
    
    init(colorComponent: CGFloat) {
        self = Int(round(colorComponent * 255))
    }
    
}
