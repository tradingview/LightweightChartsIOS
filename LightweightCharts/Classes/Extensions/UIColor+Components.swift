//
//  UIColor+Components.swift
//  LightweightCharts
//
//  Created by Дмитрий Белоусов on 26.02.2021.
//

import Foundation
import UIKit

extension UIColor {
    
    @discardableResult
    func getRed(
        _ red: UnsafeMutablePointer<Int>?,
        green: UnsafeMutablePointer<Int>?,
        blue: UnsafeMutablePointer<Int>?,
        alpha: UnsafeMutablePointer<CGFloat>?
    ) -> Bool {
        var floatRed: CGFloat = 0
        var floatGreen: CGFloat = 0
        var floatBlue: CGFloat = 0
        var floatAlpha: CGFloat = 0
        
        let result = getRed(&floatRed, green: &floatGreen, blue: &floatBlue, alpha: &floatAlpha)
        
        red?.pointee = Int(colorComponent: floatRed)
        green?.pointee = Int(colorComponent: floatGreen)
        blue?.pointee = Int(colorComponent: floatBlue)
        alpha?.pointee = floatAlpha
        
        return result
    }
    
}
