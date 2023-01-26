//
//  MockTrackerDrone.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockTrackerDrone: TrackerDrone {
    var speed: Double = 1
    var currentPosition: TrackerPosition
    
    static func getDrone(speed: Double = 1, direction: TrackerDirection) -> TrackerDrone {
        return MockTrackerDrone(speed: speed, currentPosition: MockTrackerPosition.getPositionWithDirection(direction))
    }
    
    static func getDroneOutOfBoundsPointingNorth() -> TrackerDrone {
        return MockTrackerDrone(currentPosition: MockTrackerPosition.getPositionPointingNorthOutOfBounds())
    }
    
    static func getREQUESTEDDrone() -> TrackerDrone {
        return MockTrackerDrone(currentPosition: MockTrackerPosition.getREQUESTEDPosition())
    }
}
