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
    var gasBrake: CGFloat = 0
    
    // MARK: - Properties
    
    let steeringRatio: CGFloat = 0.05
    let pedalRatio: CGFloat = 0.1
    
    // TODO: acceleration
    var acceleration: CGFloat {
        return 0
    }
    
    // MARK: - Methods
    
    func drive() {
        //print("drive PlayerCar \(self.force)")
        
        self.currentSpeed = self.currentSpeed + self.gasBrake * self.pedalRatio
        
        if self.currentSpeed < 0 {
            self.currentSpeed = 0
        } else if self.currentSpeed > self.maxSpeed {
            self.currentSpeed = self.maxSpeed
        }
        
        if self.currentSpeed > 0 {
            self.zRotation += self.steeringAngle * self.steeringRatio
            let vector = CGVector(value: self.currentSpeed, angle: self.zRotation)
            
            self.position.x += vector.dx
            self.position.y += vector.dy
        }
    }
    
}
