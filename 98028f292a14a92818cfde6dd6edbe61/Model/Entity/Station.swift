//
//  Station.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import Foundation
import CoreGraphics

struct Station: Decodable {
    
    var name: String!
    var coordinateX: Double!
    var coordinateY: Double!
    var capacity: Int!
    var stock: Int!
    var need: Int!
    
    func distanceTo(point: CGPoint) -> Int {
        return Int(round(Math.CGPointDistance(from: self.getCoordinate(), to: point)))
    }
    
    
    func getCoordinate() -> CGPoint {
        return CGPoint(x: coordinateX, y: coordinateY)
    }
    
    func distanceToWorld() -> Int {
        let world = CGPoint(x: 0, y: 0)
        return Int(round(Math.CGPointDistance(from: self.getCoordinate(), to: world)))
    }
}
