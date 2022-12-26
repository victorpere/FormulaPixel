//
//  PlayerCar.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class PlayerCar: Car, Driveable {
    
    // MARK: - Properties
    
    weak var steeringControl: Control?
    weak var throttle: Control?
    weak var brake: Control?
    
    
    // MARK: - Private properties
    
    fileprivate let steeringRatio: CGFloat = 0.2
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
        return 120
    }
    
    // TODO: calculate deceleration based on mass and friction
    fileprivate var deceleration: CGFloat {
        return 2
    }
    
    // TODO: calculate braking based on braking power, mass and friction
    fileprivate var braking: CGFloat {
        return 120
    }
    
    // TODO: calculate based on mass and friction
    fileprivate var collisionDeceleration: CGFloat {
        return 0.2
    }
    
    fileprivate var rotationSpeed: CGFloat {
        self.steeringAngle * self.steeringRatio * sqrt(self.linearSpeed.magnitude)
    }
    
    fileprivate var velocity: CGVector {
        CGVector(value: self.linearSpeed, angle: self.zRotation)
    }
    
    
    
    // MARK: - Initializers
    
    
    // MARK: - Methods
    
    func drive() {
        var speed = self.linearSpeed
        if self.linearSpeed <= 0 &&
            (self.brake?.isBeingApplied ?? false) &&
            !(self.throttle?.isBeingApplied ?? false) {
            // Reverse
            speed -= self.brakeValue * self.pedalRatio * self.acceleration
            speed += self.deceleration
            self.linearSpeed = speed.bound(between: -self.maxReverseSpeed, and: 0)
        } else if self.linearSpeed > 0  ||
                    (self.throttle?.isBeingApplied ?? false) ||
                    (self.brake?.isBeingApplied ?? false) {
            speed += self.throttleValue * self.pedalRatio * self.acceleration
            speed -= self.deceleration
            speed -= self.brakeValue * self.pedalRatio * self.braking
            self.linearSpeed = speed.bound(between: 0, and: self.maxSpeed)
        }
        
        if self.linearSpeed != 0 {
            DispatchQueue.main.async {
                self.physicsBody?.angularVelocity = self.rotationSpeed
                self.physicsBody?.velocity = self.velocity
            }
        }
        
        self.unwindSteering()
        
        self.debugNode.text = String(format: "%.1f", self.steeringAngle)
    }
    
    func didCollide(with collisionNormal: CGVector) {
        // TODO: effects

    }
    
    // MARK: - Private methods
    
    fileprivate func unwindSteering() {
        if self.steeringAngle != 0 && !(self.steeringControl?.isBeingApplied ?? false) {
            var steeringAngleChange = self.steeringUnwindSpeed
            
            if self.steeringAngle > 0 {
                steeringAngleChange.negate()
            }
            
            if (self.steeringAngle + steeringAngleChange).sign != self.steeringAngle.sign {
                steeringAngleChange = -self.steeringAngle
            }
                
            self.steeringControl?.move(by: steeringAngleChange)
        }
    }
}
