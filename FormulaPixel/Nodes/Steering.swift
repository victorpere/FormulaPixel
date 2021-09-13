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
    var isBeingApplied: Bool = false
    
    // MARK: - Properties
    
    fileprivate let range: CGFloat
    
    fileprivate var anglePerWidth: CGFloat {
        return self.range / self.frame.width
    }
    
    fileprivate var indicatorPosition: CGFloat {
        -self.value / self.anglePerWidth
    }

    // MARK: - Initializers
    
    init(for sceneSize: CGSize,
         widthMultiplier: CGFloat,
         horizontalAlignment: AreaHorizontalAlignment,
         verticalAlignment: AreaVerticalAlignment,
         horizontalOffset: CGFloat,
         verticalOffset: CGFloat) {
        self.range = self.maxValue - self.minValue
        super.init(for: sceneSize,
                   height: 100,
                   widthMultiplier: widthMultiplier,
                   horizontalAlignment: horizontalAlignment,
                   verticalAlignment: verticalAlignment,
                   horizontalOffset: horizontalOffset,
                   verticalOffset: verticalOffset,
                   texture: nil,
                   color: .green)
        
        self.indicator = SKSpriteNode(texture: nil, color: .yellow, size: CGSize(width: 20, height: self.frame.height))
        self.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(self.indicator!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    func move(by vector: CGVector) {
        //print("didMove Steering by vector \(vector)")
        
        self.value -= vector.dx * self.anglePerWidth
        self.value = self.value.bound(between: self.minValue, and: self.maxValue)
        self.indicator?.position.x = self.indicatorPosition
    }
    
    func move(by value: CGFloat) {
        //print("didMove Steering by value \(value)")
        
        self.value += value
        self.value = self.value.bound(between: self.minValue, and: self.maxValue)
        self.indicator?.position.x = self.indicatorPosition
    }
    
    func beginApplying() {
        print("beginApplying Steering")
        self.isBeingApplied = true
    }
    
    func endApplying() {
        print("endApplying Steering")
        self.isBeingApplied = false
    }
}
