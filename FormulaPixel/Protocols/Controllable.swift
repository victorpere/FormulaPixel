//
//  Controllable.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

protocol Controllable: Car {    
    var steeringControl: Control? { get set }
    var gasBrakeControl: Control? { get set }
}
