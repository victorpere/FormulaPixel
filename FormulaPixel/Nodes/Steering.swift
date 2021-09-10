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
    
    let steeringRange: CGFloat
    
    var anglePerWidth: CGFloat {
        return self.steeringRange / self.frame.width
    }
    
    fileprivate var controllerPosition: CGFloat {
        -self.value / self.anglePerWidth
    }

    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        self.steeringRange = self.maxValue - self.minValue
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.75, horizontalAlignment: .right, verticalAlignment: .bottom, texture: nil, color: .green)
        
        self.controller = SKSpriteNode(texture: nil, color: .yellow, size: CGSize(width: 20, height: self.frame.height))
        self.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(self.controller!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Control methods
    
    func didMove(by vector: CGVector) {
        print("didMove Steering by vector \(vector)")
        
        self.value -= vector.dx * self.anglePerWidth
        self.value = self.value.bound(between: self.minValue, and: self.maxValue)
        self.controller?.position.x = self.controllerPosition
    }
    
    func didMove(by value: CGFloat) {
        print("didMove Steering by value \(value)")
        
        self.value += value
        self.value = self.value.bound(between: self.minValue, and: self.maxValue)
        self.controller?.position.x = self.controllerPosition
    }
    
    func beginApplying() {
        print("set to true")
        self.isBeingApplied = true
    }
    
    func endApplying() {
        print("set to false")
        self.isBeingApplied = false
    }
    
    func setToValue(_ value: CGFloat) {
        self.value = value
        self.value = self.value.bound(between: self.minValue, and: self.maxValue)
        self.controller?.position.x = self.controllerPosition
    }
}
