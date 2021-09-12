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
    
//    init(for sceneSize: CGSize, horizontalOffset: CGFloat, verticalOffset: CGFloat, color: UIColor) {
//        super.init(for: sceneSize, height: 100, widthMultiplier: 0.25, horizontalAlignment: .left, verticalAlignment: .bottom, horizontalOffset: horizontalOffset, verticalOffset: verticalOffset, texture: nil, color: color)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Control methods
    
    func move(by vector: CGVector) {

    }
    
    func move(by value: CGFloat) {

    }
    
    func beginApplying() {
        print("beginApplying Pedal \(self.name ?? "")")
        self.isBeingApplied = true
        self.value = self.maxValue
    }
    
    func endApplying() {
        print("endApplying Pedal \(self.name ?? "")")
        self.isBeingApplied = false
        self.value = self.minValue
    }
}
