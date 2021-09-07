//
//  TrackScene.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-01.
//

import SpriteKit

class TrackScene: SKScene {
    
    // MARK: - Properties
    
    let gasBrake: GasBrake
    let steering: Steering
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
        self.playerCar.placeInCenter(of: self.size)
    }
}
