//
//  MockTrackerPosition.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockTrackerPosition: TrackerPosition {
    var direction: TrackerDirection
    var coordinate: CGPoint
    
    static func getPositionWithDirection(_ direction: TrackerDirection) -> TrackerPosition {
        return MockTrackerPosition(direction: direction, coordinate: .zero)
    }
    
    static func getPositionPointingNorthOutOfBounds() -> TrackerPosition {
        return MockTrackerPosition(direction: .north, coordinate: CGPoint(x: -1, y: -1))
    }
    
    static func getREQUESTEDPosition() -> TrackerPosition {
        return MockTrackerPosition(direction: .north, coordinate: CGPoint(x: 1, y: 2))
    }
}
