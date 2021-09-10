//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car, Controllable {
    
    // MARK: - Controllable properties
    
    var steeringAngle: CGFloat = 0
    var gasBrake: CGFloat = 0.5
    
    // MARK: - Properties
    
    let steeringRatio: CGFloat = 100
    
    var force: CGVector {
        return CGVector(value: self.gasBrake, angle: self.zRotation)
    }
    
    // MARK: - Methods
    
    func drive() {
        //print("drive PlayerCar \(self.force)")
        
        self.position.x += self.force.dx
        self.position.y += self.force.dy
        self.zRotation += self.steeringAngle / self.steeringRatio
    }
    
}
