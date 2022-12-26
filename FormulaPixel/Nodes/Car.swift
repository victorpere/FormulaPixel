//
//  Car.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Car: PhysicalObject {
    
    // MARK: - Properties
    
    let maxSpeed: CGFloat = 150
    let maxReverseSpeed: CGFloat = 50
    let steeringUnwindSpeed: CGFloat = 0.005 * .pi
    
    weak var surface: Surface?
    
    var linearSpeed: CGFloat = 0
    
    var debugNode: SKLabelNode
    
    // MARK: - Initializers
    
    init(named name: String, withImageNamed imageName: String) {
        self.debugNode = SKLabelNode(fontNamed: "Helvetica")
        let texture = SKTexture(imageNamed: imageName)
        let size = CGSize(width: 30, height: 50)
        
        super.init(texture: texture, color: .red, size: size)
        
        self.name = name
        self.physicsBody?.mass = 1
        self.physicsBody?.restitution = 0.2
        self.physicsBody?.friction = 0.5
        self.physicsBody?.categoryBitMask = ObjectType.car.rawValue
        self.physicsBody?.contactTestBitMask = ObjectType.track.rawValue | ObjectType.car.rawValue
        
        self.debugNode.isHidden = true
        self.debugNode.fontColor = .green
        self.debugNode.fontSize = 14
        self.debugNode.position = self.position
        self.addChild(self.debugNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
