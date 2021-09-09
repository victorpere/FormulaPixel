//
//  CGVector.swift
//  FormulaPixel
//
//  Created by Victor on 2021-09-09.
//

import CoreGraphics

extension CGVector {
    /// Initializes CGVector by delta between to provided points
    init(from startPoint: CGPoint, to endPoint: CGPoint) {
        self.init(dx: endPoint.x - startPoint.x, dy: endPoint.y - startPoint.y)
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

