//
//  File.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-12.
//

import SpriteKit

class Track: ImmovableArea {
    
    
    
    // MARK: - Initializers
    
    init(trackId: String, sceneSize: CGSize) {
        let imageName = "track\(trackId)"
        let texture = SKTexture(imageNamed: imageName)
        //let size = CGSize(width: sceneSize.width, height: texture.size().height * sceneSize.width / texture.size().width)
        let height = texture.size().height * sceneSize.width / texture.size().width
        
        super.init(for: sceneSize, height: height, widthMultiplier: 1, horizontalAlignment: .left, verticalAlignment: .top, horizontalOffset: 0, verticalOffset: 0, texture: texture, color: .clear)
        
        var physicsBodies: [SKPhysicsBody] = []
        physicsBodies.append(SKPhysicsBody(texture: SKTexture(imageNamed: "track\(trackId)outer01"), size: self.size))
        physicsBodies.append(SKPhysicsBody(texture: SKTexture(imageNamed: "track\(trackId)outer02"), size: self.size))
        physicsBodies.append(SKPhysicsBody(texture: SKTexture(imageNamed: "track\(trackId)inner"), size: self.size))
        
        self.physicsBody = SKPhysicsBody(bodies: physicsBodies)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.friction = Constants.Track.PhysicsBody.friction
        self.physicsBody?.restitution = Constants.Track.PhysicsBody.restitution
        self.physicsBody?.categoryBitMask = ObjectType.track.rawValue
        self.physicsBody?.contactTestBitMask = ObjectType.car.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
