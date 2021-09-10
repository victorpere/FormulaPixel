//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car, Controllable {
    
    // MARK: - Control properties
    
    weak var steeringControl: Control?
    weak var gasBrakeControl: Control?
    
    // MARK: - Controllable properties
    
    var steeringAngle: CGFloat {
        self.steeringControl?.value ?? 0
    }
    
    var gasBrake: CGFloat {
        self.gasBrakeControl?.value ?? 0
    }
    
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
        self.currentSpeed = self.currentSpeed.bound(between: 0, and: self.maxSpeed)
        
        if self.currentSpeed > 0 {
            self.zRotation += self.steeringAngle * self.steeringRatio
            let vector = CGVector(value: self.currentSpeed, angle: self.zRotation)
            
            self.position.x += vector.dx
            self.position.y += vector.dy
            
            if self.steeringAngle != 0 && !(self.steeringControl?.isBeingApplied ?? false) {
                // unwind steering
                var steeringAngleChange = self.steeringUnwindSpeed
                
                if self.steeringAngle > 0 {
                    steeringAngleChange.negate()
                }
                
                if (self.steeringAngle + steeringAngleChange).negative != self.steeringAngle.negative {
                    self.steeringControl?.setToValue(0)
                } else {
                    self.steeringControl?.didMove(by: steeringAngleChange)
                }
            }
        }
    }
    
}
