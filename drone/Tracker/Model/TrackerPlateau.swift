//
//  TrackerPlateau.swift
//  drone
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public protocol TrackerPlateau {
    var letfBottomCorner: CGPoint { get set }
    var topRightCorner: CGPoint { get set }
}

extension TrackerPlateau {
    func isPositionWithinTheBoundaries(_ point: CGPoint) -> Bool {
        return point.x >= letfBottomCorner.x && point.y >= letfBottomCorner.y && point.x <= topRightCorner.x && point.y <= topRightCorner.y
    }
}
