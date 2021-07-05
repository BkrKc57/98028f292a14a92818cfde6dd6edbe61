//
//  Math.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 3.07.2021.
//

import Foundation
import CoreGraphics

class Math {
    
    class func CGPointDistanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
        return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
    }

    class func CGPointDistance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(CGPointDistanceSquared(from: from, to: to))
    }
    
}
