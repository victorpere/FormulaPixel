//
//  Constants.swift
//  FormulaPixel
//
//  Created by Victor on 2022-12-26.
//

import CoreGraphics

struct Constants {
    struct UI {
        static let defaultFontName = "Helvetica"
    }
    struct Car {
        static let maxSpeed: CGFloat = 150
        static let maxReverseSpeed: CGFloat = 50
        static let steeringUnwindCoefficient: CGFloat = 0.005
        static let power: CGFloat = 500
        static let grip: CGFloat = 2
        static let brakes: CGFloat = 500
        
        struct PhysicsBody {
            static let mass: CGFloat = 1
            static let restitution: CGFloat = 0.2
            static let friction: CGFloat = 0.2
            
        }
    }
}
