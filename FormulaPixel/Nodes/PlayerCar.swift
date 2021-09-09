//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car, Controllable {
    
    var gasBrake: CGFloat = 0
    
    // MARK: - Controllable methods
    
    func steer(by angle: CGFloat) {
        print("steer PlayerCar by \(angle)")
        
        self.zRotation += angle
    }
    
    func appyGasBrake(by amount: CGFloat) {
        print("applyGasBrake by \(amount)")
        
        self.gasBrake += amount
    }
}
