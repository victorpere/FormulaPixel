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
    
    // MARK: - Initializers
    
    override init(size: CGSize) {
        self.throttle = Pedal(for: size, offset: 100, color: .blue)
        self.brake = Pedal(for: size, offset: 0, color: .red)
        self.steering = Steering(for: size)
        self.playerCar = PlayerCar()
        
        super.init(size: size)
        
        self.backgroundColor = .gray
        
        self.addChild(self.throttle)
        self.addChild(self.brake)
        self.addChild(self.steering)
        self.addChild(self.playerCar)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    func setup() {
        self.playerCar.steeringControl = self.steering
        self.playerCar.throttle = self.throttle
        self.playerCar.brake = self.brake
        self.playerCar.placeInCenter(of: self.size)
    }
    
    // MARK: - UIResponder methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan TrackSene")
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

            let touchedNodes  = self.nodes(at: touch.location(in: self))
            for node in touchedNodes {
                if let control = node as? Control {
                    control.move(by: movement)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded TrackScene")
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
