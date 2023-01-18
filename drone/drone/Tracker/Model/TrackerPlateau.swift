//
//  TrackerPlateau.swift
//  drone
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public protocol TrackerPlateau {
    var topRightCorner: CGPoint { get set }
    func isPositionWithinTheBoundaries(_ point: CGPoint) -> Bool
}

extension TrackerPlateau {
    func isPositionWithinTheBoundaries(_ point: CGPoint) -> Bool {
        return point.x >= 0 && point.y >= 0 && point.x <= topRightCorner.x && point.y <= topRightCorner.y
    }
}
