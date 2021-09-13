//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car {
    
    // MARK: - Properties
    
    weak var steeringControl: Control?
    weak var throttle: Control?
    weak var brake: Control?
    
    
    // MARK: - Private properties
    
    fileprivate let steeringRatio: CGFloat = 0.03
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
    
    // TODO: calculate acceleration based on power, mass and friction (grip)
    fileprivate var acceleration: CGFloat {
        return 0.4
    }
    
    // TODO: calculate deceleration based on mass and friction
    fileprivate var deceleration: CGFloat {
        return 0.01
    }
    
    // TODO: calculate braking based on braking power, mass and friction
    fileprivate var braking: CGFloat {
        return 0.5
    }
    
    // TODO: calculate based on mass and friction
    fileprivate var collisionDeceleration: CGFloat {
        return 0.2
    }
    
    fileprivate var rotationSpeed: CGFloat {
        self.steeringAngle * self.steeringRatio * sqrt(self.linearSpeed)
    }
    
    fileprivate var velocity: CGVector {
        CGVector(value: self.linearSpeed, angle: self.zRotation)
    }
    
    // MARK: - Methods
    
    func drive() {
        self.linearSpeed += self.throttleValue * self.pedalRatio * self.acceleration
        self.linearSpeed -= self.deceleration
        self.linearSpeed -= self.brakeValue * self.pedalRatio * self.braking
        self.linearSpeed = self.linearSpeed.bound(between: 0, and: self.maxSpeed)
        
        if self.linearSpeed > 0 {
            self.zRotation += self.rotationSpeed
            
            self.position.x += self.velocity.dx
            self.position.y += self.velocity.dy
        }
        
        self.unwindSteering()
    }
    
    func didCollide(with collisionNormal: CGVector) {
        // TODO: apply vector to reduce speed
        self.linearSpeed -= self.collisionDeceleration
    }
    
    // MARK: - Private methods
    
    fileprivate func unwindSteering() {
        if self.steeringAngle != 0 && !(self.steeringControl?.isBeingApplied ?? false) {
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
