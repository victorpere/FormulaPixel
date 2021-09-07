//
//  Steering.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class Steering: ControlArea {

    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.75, horizontalAlignment: .right, verticalAlignment: .bottom, texture: nil, color: .green)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
