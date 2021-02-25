//
//  Int+ColorComponent.swift
//  LightweightCharts
//
//  Created by Дмитрий Белоусов on 26.02.2021.
//

import Foundation
import UIKit

extension Int {
    
    init(colorComponent: CGFloat) {
        self = Int(round(colorComponent * 255))
    }
    
}
