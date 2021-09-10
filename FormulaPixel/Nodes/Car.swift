//
//  Car.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Car: PhysicalObject {
    
    // MARK: - Properties
    
    let maxSpeed: CGFloat = 1
    let steeringUnwindSpeed: CGFloat = 0.005 * .pi
    
    var currentSpeed: CGFloat = 0
    
    // MARK: - Initializers
    
    init() {
        let texture = SKTexture(imageNamed: "car_team01_top")
        
        let size = CGSize(width: 60, height: 100)
        super.init(texture: texture, color: .red, size: size)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func placeInCenter(of sceneSize: CGSize) {
        self.position.x = sceneSize.width / 2
        self.position.y = sceneSize.height / 2
    }
}
