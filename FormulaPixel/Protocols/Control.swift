//
//  Control.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

protocol Control: ControlArea {
    var minValue: CGFloat { get }
    var maxValue: CGFloat { get }
    var value: CGFloat { get set }
    var controlledObject: Controllable? { get set }
    func didMove(by vector: CGVector)
}
