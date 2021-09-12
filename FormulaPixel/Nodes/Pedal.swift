//
//  GasBrake.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Pedal: ControlArea, Control {

    // MARK: - Control properties
    
    var minValue: CGFloat = 0
    var maxValue: CGFloat = 1
    var value: CGFloat = 0
    var isBeingApplied: Bool = false
    
    // MARK: - Properties
    
        
    // MARK: - Initializers
    
    init(for sceneSize: CGSize, offset: CGFloat, color: UIColor) {
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.25, horizontalAlignment: .left, verticalAlignment: .bottom, horizontalOffset: 0, verticalOffset: offset, texture: nil, color: color)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    func didMove(by vector: CGVector) {
        print("didMove Pedal by vector \(vector)")
        
    }
    
    func move(by value: CGFloat) {
        print("didMove Pedal by value \(value)")
    }
    
    func beginApplying() {
        print("beginApplying Pedal")
        self.isBeingApplied = true
        self.value = self.maxValue
    }
    
    func endApplying() {
        print("endApplying Pedal")
        self.isBeingApplied = false
        self.value = self.minValue
    }
}
