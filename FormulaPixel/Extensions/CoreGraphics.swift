//
//  CGVector.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

extension CGVector {
    /// Initializes CGVector by start and end points
    init(from startPoint: CGPoint, to endPoint: CGPoint) {
        self.init(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
    }
    
    /// Initializes CGVector from its linear value and angle
    init(value: CGFloat, angle: CGFloat) {
        self.init(dx: -value * sin(angle), dy: value * cos(angle))
    }
}

extension CGPoint {
    /// Returns angle between two points with centre at self
    func angleBetween(pointA: CGPoint, pointB: CGPoint) -> CGFloat {
        let relPointA = CGPoint(x: pointA.x - self.x, y: pointA.y - self.y)
        let relToPoint = CGPoint(x: pointB.x - self.x, y: pointB.y - self.y)
        
        let tanFrom = relPointA.x / abs(relPointA.y)
        let tanTo = relToPoint.x / abs(relToPoint.y)
        
        let fromAngle = atan(tanFrom)
        let toAngle = atan(tanTo)
    
        let multiplier: CGFloat = relToPoint.y.sign == .minus ? -1 : 1
        
        return (toAngle - fromAngle) * multiplier
    }
}

extension CGFloat {
    
    /// Absoloute value
    var abs: CGFloat {
        CGFloat(Swift.abs(Double(self)))
    }
    
    /// Whether the value is negative
    var negative: Bool {
        return self < 0
    }
    
    /// Returns the value bounded within provided values
    func bound(between value1: CGFloat, and value2: CGFloat) -> CGFloat {
        var minValue = value1
        var maxValue = value2
        if minValue > value2 {
            minValue = value2
            maxValue = value1
        }
        
        if self < minValue {
            return minValue
        } else if self > maxValue {
            return maxValue
        }
        
        return self
    }

}
