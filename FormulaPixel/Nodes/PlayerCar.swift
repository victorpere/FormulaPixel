//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car {
    
    // MARK: - Control properties
    
    weak var steeringControl: Control?
    weak var throttle: Control?
    weak var brake: Control?
    
    // MARK: - Properties
    
    fileprivate let steeringRatio: CGFloat = 0.05
    fileprivate let pedalRatio: CGFloat = 0.1
    
    fileprivate var steeringAngle: CGFloat {
        self.steeringControl?.value ?? 0
    }
    
    fileprivate var throttleValue: CGFloat {
        self.throttle?.value ?? 0
    }
    
    fileprivate var brakeValue: CGFloat {
        self.brake?.value ?? 0
    }
    
    // TODO: calculate acceleration based on power and mass
    fileprivate var acceleration: CGFloat {
        return 0.5
    }
    
    // TODO: calculate deceleration based on friction coefficient
    fileprivate var deceleration: CGFloat {
        return 0.01
    }
    
    // TODO: calculate braking based on mass
    fileprivate var braking: CGFloat {
        return 1
    }
    
    // MARK: - Methods
    
    func drive() {
        //print("drive PlayerCar \(self.force)")
        self.currentSpeed += self.throttleValue * self.pedalRatio * self.acceleration
        self.currentSpeed -= self.deceleration
        self.currentSpeed -= self.brakeValue * self.pedalRatio * self.braking
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
                    steeringAngleChange = -self.steeringAngle
                }
                    
                self.steeringControl?.move(by: steeringAngleChange)
            }
        }
    }
    
}
