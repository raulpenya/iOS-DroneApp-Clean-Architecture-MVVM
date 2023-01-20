//
//  MockDrone.swift
//  TrackerTests
//
//  Created by raulbot on 18/1/23.
//

import Foundation
import Tracker

struct MockDrone: TrackerDrone {
    var speed: Double = 1
    var currentPosition: TrackerPosition
    
    static func getDrone(speed: Double = 1, direction: TrackerDirection) -> TrackerDrone {
        return MockDrone(speed: speed, currentPosition: MockPosition.getPositionWithDirection(direction))
    }
    
    static func getDroneOutOfBoundsPointingNorth() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingNorthOutOfBounds())
    }
    
    static func getREQUESTEDDrone() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getREQUESTEDPosition())
    }
}
