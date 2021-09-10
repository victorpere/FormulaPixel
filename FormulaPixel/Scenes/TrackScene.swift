//
//  TrackScene.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-01.
//

import SpriteKit

class TrackScene: SKScene {
    
    // MARK: - Properties
    
    let gasBrake: Control
    let steering: Control
    let playerCar: PlayerCar
    
    // MARK: - Initializers
    
    override init(size: CGSize) {
        self.gasBrake = GasBrake(for: size)
        self.steering = Steering(for: size)
        self.playerCar = PlayerCar()
        
        super.init(size: size)
        
        self.backgroundColor = .gray
        
        self.addChild(self.gasBrake)
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
        self.playerCar.gasBrakeControl = self.gasBrake
        self.playerCar.placeInCenter(of: self.size)
    }
    
    // MARK: - UIResponder methods
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touhesMoved ControlArea")
        for touch in touches {
            let movement = CGVector(from: touch.previousLocation(in: self),
                                    to: touch.location(in: self))

            let touchedNode = self.atPoint(touch.location(in: self))
            if let control = touchedNode as? Control {
                control.didMove(by: movement)
            }
        }
    }
    
    // MARK: - Scene methods
    
    override func update(_ currentTime: TimeInterval) {
        self.playerCar.drive()
    }
}
