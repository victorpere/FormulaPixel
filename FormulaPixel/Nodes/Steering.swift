//
//  Steering.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Steering: ControlArea {
    
    // MARK: - Properties
    
    let steeringRange: CGFloat = .pi / 2
    
    var anglePerWidth: CGFloat {
        return self.steeringRange / self.frame.width
    }

    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.75, horizontalAlignment: .right, verticalAlignment: .bottom, texture: nil, color: .green)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    override func didMove(by vector: CGVector) {
        print("didMove Steering by \(vector)")
        
        // Calculate angle of rotation
        // send angle to controlledObject
        
        let angle = vector.dx * self.anglePerWidth
        self.controlledObject?.steer(by: angle)
    }
}
