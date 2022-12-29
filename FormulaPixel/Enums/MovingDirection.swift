//
//  Direction.swift
//  FormulaPixel
//
//  Created by Victor on 2022-12-29.
//

import Foundation

enum MovingDirection: Int8 {
    case backward = -1
    case stopped = 0
    case forward = 1
    
    init(withSpeed speed: CGFloat) {
        if speed == 0 {
            self = .stopped
        } else if speed > 0 {
            self = .forward
        } else {
            self = .backward
        }
    }
}
