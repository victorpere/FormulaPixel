//
//  ImmovableNode.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-12.
//

import SpriteKit

class ImmovableNode: SKSpriteNode {
    // MARK: - Properties
    
    let height: CGFloat
    let widthMultiplier: CGFloat
    let horizontalAlignment: ControlAreaHorizontalAlignment
    let verticalAlignment: ControlAreaVerticalAlignment
    let horizontalOffset: CGFloat
    let verticalOffset: CGFloat
    
    // MARK: - Initializers
    
    init(for sceneSize: CGSize,
         height: CGFloat,
         widthMultiplier: CGFloat,
         horizontalAlignment: ControlAreaHorizontalAlignment,
         verticalAlignment: ControlAreaVerticalAlignment,
         horizontalOffset: CGFloat,
         verticalOffset: CGFloat,
         texture: SKTexture?,
         color: UIColor) {
        
        if widthMultiplier > 1 {
            self.widthMultiplier = 1
        } else {
            self.widthMultiplier = widthMultiplier
        }
        
        if height > sceneSize.height {
            self.height = sceneSize.height
        } else {
            self.height = height
        }
        
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.horizontalOffset = horizontalOffset
        self.verticalOffset = verticalOffset
        
        let size = CGSize(width: sceneSize.width * self.widthMultiplier, height: self.height)
        super.init(texture: texture, color: color, size: size)
        
        self.reposition(for: sceneSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func reposition(for sceneSize: CGSize) {
        switch self.horizontalAlignment {
        case .left:
            self.position.x = self.size.width / 2
        case .right:
            self.position.x = sceneSize.width - self.size.width / 2
        }
        
        switch self.verticalAlignment {
        case .bottom:
            self.position.y = self.size.height / 2
        case .top:
            self.position.y = sceneSize.height - self.size.height / 2
        }
        
        self.position.x += self.horizontalOffset
        self.position.y += self.verticalOffset
    }
}

// MARK: - Enums

enum ControlAreaHorizontalAlignment {
    case left
    case right
}

enum ControlAreaVerticalAlignment {
    case top
    case bottom
}
