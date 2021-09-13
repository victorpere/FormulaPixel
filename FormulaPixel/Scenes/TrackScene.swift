//
//  TrackScene.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-01.
//

import SpriteKit

class TrackScene: SKScene {
    
    // MARK: - Properties
    
    let throttle: Control
    let brake: Control
    let steering: Control
    let playerCar: PlayerCar
    let track: Track
    
    // MARK: - Initializers
    
    override init(size: CGSize) {
        self.brake = Pedal(for: size, height: 85, widthMultiplier: 0.1, horizontalAlignment: .left, verticalAlignment: .bottom, horizontalOffset: 0, verticalOffset: 0, texture: nil, color: .red)
        self.throttle = Pedal(for: size, height: 85, widthMultiplier: 0.2, horizontalAlignment: .left, verticalAlignment: .bottom, horizontalOffset: size.width * 0.1, verticalOffset: 0, texture: nil, color: .blue)
        self.steering = Steering(for: size, height: 85, widthMultiplier: 0.6, horizontalAlignment: .right, verticalAlignment: .bottom, horizontalOffset: 0, verticalOffset: 0, deadZone: 60)
        
        self.playerCar = PlayerCar()
        self.track = Track(trackId: "00", sceneSize: size)
        
        super.init(size: size)
        
        self.backgroundColor = .lightGray
        
        self.addChild(self.track)
        self.addChild(self.playerCar)
        self.addChild(self.throttle)
        self.addChild(self.brake)
        self.addChild(self.steering)
        
        self.physicsWorld.contactDelegate = self
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    func setup() {
        self.brake.name = "Brake"
        self.throttle.name = "Throttle"
        
        self.playerCar.steeringControl = self.steering
        self.playerCar.throttle = self.throttle
        self.playerCar.brake = self.brake
        //self.playerCar.placeInCenter(of: self.size)
        
        self.playerCar.position = CGPoint(x: 56, y: 360)
        self.playerCar.zPosition = self.track.zPosition + 1
    }
    
    // MARK: - UIResponder methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesBegan TrackSene")
        for touch in touches {
            let touchedNodes  = self.nodes(at: touch.location(in: self))
            for node in touchedNodes {
                if let control = node as? Control {
                    control.beginApplying()
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touhesMoved TrackSene")
        for touch in touches {
            let movement = CGVector(from: touch.previousLocation(in: self),
                                    to: touch.location(in: self))

            let previouslyTouchedNodes = self.nodes(at: touch.previousLocation(in: self))
            let touchedNodes  = self.nodes(at: touch.location(in: self))
            for node in touchedNodes {
                if let control = node as? Control {
                    control.move(by: movement)
                }
            }
            for node in previouslyTouchedNodes {
                if let control = node as? Control, !touchedNodes.contains(node) {
                    control.endApplying()
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print("touchesEnded TrackScene")
        for touch in touches {
            let touchedNodes  = self.nodes(at: touch.location(in: self))
            for node in touchedNodes {
                if let control = node as? Control {
                    control.endApplying()
                }
            }
        }
    }
    
    // MARK: - Scene methods
    
    override func update(_ currentTime: TimeInterval) {
        self.playerCar.drive()
    }
}

extension TrackScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        //print("contact \(contact.contactNormal)")
        let bodies = [contact.bodyA, contact.bodyB]
        for body in bodies {
            if body === self.playerCar.physicsBody {
                self.playerCar.didCollide(with: contact.contactNormal)
            }
        }
    }
}
