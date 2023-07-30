//
//  Constants.swift
//  FormulaPixel
//
//  Created by Victor on 2022-12-26.
//

import CoreGraphics

struct Constants {
    struct UI {
        static let defaultFontName = "Courier"
    }
    struct Car {
        static let maxSpeed: CGFloat = 200
        static let maxReverseSpeed: CGFloat = 50
        static let steeringUnwindCoefficient: CGFloat = 0.005
        static let power: CGFloat = 50
        static let grip: CGFloat = 2
        static let brakes: CGFloat = 500
        static let steeringRatio: CGFloat = 1.8
        static let pedalRatio: CGFloat = 0.1
        
        struct PhysicsBody {
            static let mass: CGFloat = 1
            static let restitution: CGFloat = 0.2
            static let friction: CGFloat = 0.2
            
        }
    }
    struct Track {
        struct PhysicsBody {
            static let restitution: CGFloat = 0
            static let friction: CGFloat = 1
        }
    }
}
