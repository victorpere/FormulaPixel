//
//  Steering.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Steering: ControlArea, Control {
    
    // MARK: - Control properties
    
    var minValue: CGFloat = -.pi / 4
    var maxValue: CGFloat = .pi / 4
    var value: CGFloat = 0
    weak var controlledObject: Controllable?
    
    // MARK: - Properties
    
    let steeringRange: CGFloat
    
    var anglePerWidth: CGFloat {
        return self.steeringRange / self.frame.width
    }

    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        self.steeringRange = self.maxValue - self.minValue
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.75, horizontalAlignment: .right, verticalAlignment: .bottom, texture: nil, color: .green)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    func didMove(by vector: CGVector) {
        print("didMove Steering by \(vector)")
        
        self.value -= vector.dx * self.anglePerWidth

        if self.value > self.maxValue {
            self.value = self.maxValue
        } else if self.value < self.minValue {
            self.value = self.minValue
        }
        
        print("steeringAngle \(self.value)")
        
        self.controlledObject?.steeringAngle = self.value
    }
}
