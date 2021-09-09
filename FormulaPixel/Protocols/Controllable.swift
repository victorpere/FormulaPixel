//
//  Controllable.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

protocol Controllable: PhysicalObject {
    func steer(by angle: CGFloat)
    func appyGasBrake(by amount: CGFloat)
}
