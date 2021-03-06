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
    var isBeingApplied: Bool { get set }
    func move(by vector: CGVector)
    func move(by value: CGFloat)
    func beginApplying()
    func endApplying()
}

extension Control {

}
