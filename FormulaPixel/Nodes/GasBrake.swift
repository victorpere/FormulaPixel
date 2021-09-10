//
//  GasBrake.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class GasBrake: ControlArea, Control {

    // MARK: - Control properties
    
    var minValue: CGFloat = -1
    var maxValue: CGFloat = 1
    var value: CGFloat = 0
    weak var controlledObject: Controllable?
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        super.init(for: sceneSize, height: 200, widthMultiplier: 0.25, horizontalAlignment: .left, verticalAlignment: .bottom, texture: nil, color: .blue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    func didMove(by vector: CGVector) {
        print("didMove GasBrake by \(vector)")
        
        self.value += vector.dy
        
        if self.value > self.maxValue {
            self.value = self.maxValue
        } else if self.value < self.minValue {
            self.value = self.minValue
        }
        
        self.controlledObject?.gasBrake = self.value
    }
}
