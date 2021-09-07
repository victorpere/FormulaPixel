//
//  GasBrake.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-07.
//

import SpriteKit

class GasBrake: ControlArea {
    
    // MARK: - Initializers
    
    init(for sceneSize: CGSize) {
        super.init(for: sceneSize, height: 100, widthMultiplier: 0.25, horizontalAlignment: .left, verticalAlignment: .bottom, texture: nil, color: .blue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
