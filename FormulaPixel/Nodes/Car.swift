//
//  Car.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Car: PhysicalObject {
    
    // MARK: - Properties
    
    let mass: CGFloat = 1
    let maxSpeed: CGFloat = 3
    let maxReverseSpeed: CGFloat = 1
    let steeringUnwindSpeed: CGFloat = 0.005 * .pi
    
    weak var surface: Surface?
    
    var linearSpeed: CGFloat = 0
    
    // MARK: - Initializers
    
    init() {
        let texture = SKTexture(imageNamed: "car_team01_top")
        
        let size = CGSize(width: 30, height: 50)
        super.init(texture: texture, color: .red, size: size)
        
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.categoryBitMask = ObjectType.car.rawValue
        self.physicsBody?.contactTestBitMask = ObjectType.track.rawValue | ObjectType.car.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
