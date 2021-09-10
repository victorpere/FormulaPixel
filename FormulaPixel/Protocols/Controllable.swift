//
//  Controllable.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

protocol Controllable: Car {
    var steeringAngle: CGFloat { get set }
    var gasBrake: CGFloat { get set }
}
