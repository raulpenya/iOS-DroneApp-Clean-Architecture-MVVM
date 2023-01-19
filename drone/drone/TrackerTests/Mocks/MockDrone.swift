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
    
    static func getDronePointingNorth() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingNorth())
    }
    
    static func getDronePointingEast() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingEast())
    }
    
    static func getDronePointingSouth() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingSouth())
    }
    
    static func getDronePointingWest() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingWest())
    }
    
    static func getDroneOutOfBoundsPointingNorth() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingNorthOutOfBounds())
    }
    
    static func getREQUESTEDDrone() -> TrackerDrone {
        return MockDrone(currentPosition: MockPosition.getREQUESTEDPosition())
    }
}
