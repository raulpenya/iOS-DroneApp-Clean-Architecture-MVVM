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
    
    static func getDronePointingNorth() -> MockDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingNorth())
    }
    
    static func getDronePointingEast() -> MockDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingEast())
    }
    
    static func getDronePointingSouth() -> MockDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingSouth())
    }
    
    static func getDronePointingWest() -> MockDrone {
        return MockDrone(currentPosition: MockPosition.getPositionPointingWest())
    }
}
