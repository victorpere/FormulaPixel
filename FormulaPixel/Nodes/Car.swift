//
//  Car.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Car: PhysicalObject {
    
    // MARK: - Properties
    
    let maxSpeed: CGFloat = Constants.Car.maxSpeed
    let maxReverseSpeed: CGFloat = Constants.Car.maxReverseSpeed
    let steeringUnwindSpeed: CGFloat = Constants.Car.steeringUnwindCoefficient * .pi
    let power: CGFloat = Constants.Car.power
    let grip: CGFloat = Constants.Car.grip
    let brakes: CGFloat = Constants.Car.brakes
    
    weak var surface: Surface?
    
    var linearSpeed: CGFloat = 0
    
    var debugNode: SKLabelNode
    
    var mass: CGFloat {
        return (self.physicsBody?.mass ?? Constants.Car.PhysicsBody.mass)
    }
    
    var debugNodeText: String {
        let formattedSpeed = String(format: "%.2f", self.linearSpeed)
        let formattedAngularVelocity = String(format: "%.2f", self.physicsBody?.angularVelocity ?? 0)
        return "V\(formattedSpeed)\nA\(formattedAngularVelocity)"
    }
    
    // MARK: - Initializers
    
    init(named name: String, withImageNamed imageName: String) {
        self.debugNode = SKLabelNode(fontNamed: Constants.UI.defaultFontName)
        let texture = SKTexture(imageNamed: imageName)
        let size = CGSize(width: 30, height: 50)
        
        super.init(texture: texture, color: .red, size: size)
        
        self.name = name
        self.physicsBody?.mass = Constants.Car.PhysicsBody.mass
        self.physicsBody?.restitution = Constants.Car.PhysicsBody.restitution
        self.physicsBody?.friction = Constants.Car.PhysicsBody.friction
        self.physicsBody?.categoryBitMask = ObjectType.car.rawValue
        self.physicsBody?.contactTestBitMask = ObjectType.track.rawValue | ObjectType.car.rawValue
        
        self.debugNode.isHidden = false
        self.debugNode.fontColor = .green
        self.debugNode.fontSize = 14
        self.debugNode.position = CGPoint(x: self.position.x, y: self.position.y - 35)
        self.addChild(self.debugNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
