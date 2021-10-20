import Foundation
import UIKit

extension UIColor {
    
    var components: ColorComponents {
        var components = ColorComponents()
        getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)
        return components
    }
    
}
