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
    
    fileprivate let steeringRatio: CGFloat = Constants.Car.steeringRatio
    fileprivate let pedalRatio: CGFloat = Constants.Car.pedalRatio
    
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
        return self.power * self.grip / self.mass
    }
    
    // TODO: calculate deceleration based on mass and friction
    fileprivate var deceleration: CGFloat {
        return self.mass * self.grip
    }
    
    // TODO: calculate braking based on braking power, mass and friction
    fileprivate var braking: CGFloat {
        return self.brakes * self.grip / self.mass
    }
    
    // TODO: calculate based on mass and friction
    fileprivate var collisionDeceleration: CGFloat {
        return 0.2
    }
    
    fileprivate var rotationSpeed: CGFloat {
        self.steeringAngle * self.steeringRatio * CGFloat(self.movingDirection.rawValue)
    }
    
    fileprivate var velocity: CGVector {
        CGVector(value: self.linearSpeed, angle: self.zRotation)
    }
    
    fileprivate var movingDirection: MovingDirection {
        MovingDirection(withSpeed: self.linearSpeed)
    }
    
        
    // MARK: - Initializers
    
    
    // MARK: - Methods
    
    func drive() {
        self.linearSpeed += self.throttleValue * self.pedalRatio * self.acceleration
        - self.brakeValue * self.pedalRatio * self.acceleration
        
        if self.linearSpeed != 0 {
            if self.linearSpeed > 0 {
                self.linearSpeed -= self.deceleration
                self.linearSpeed = self.linearSpeed.bound(between: 0, and: self.maxSpeed)
            } else {
                self.linearSpeed += self.deceleration
                self.linearSpeed = self.linearSpeed.bound(between: -self.maxReverseSpeed, and: 0)
            }

        }
        
        DispatchQueue.main.async {
            self.physicsBody?.angularVelocity = self.rotationSpeed
            self.physicsBody?.velocity = self.velocity
        }
        
        self.unwindSteering()
        
        self.debugNode.text = self.debugNodeText
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
