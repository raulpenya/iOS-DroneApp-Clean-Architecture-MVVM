//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
import Domain

struct MockDroneRemoteEntity {
    static func getDrone() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPosition())
    }
    
    static func getDroneWRONGInitialPosition() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPositionWRONG())
    }
}

struct MockDrone {
    static func getDrone() -> Drone {
        return Drone(currentPosition: MockPosition.getPosition())
    }
    
    static func getDroneWRONGInitialPosition() -> Drone {
        return Drone(currentPosition: MockPosition.getPositionWRONG())
    }
}
