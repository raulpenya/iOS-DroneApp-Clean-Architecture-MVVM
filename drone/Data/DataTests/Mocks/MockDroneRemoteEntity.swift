//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
@testable import Domain

struct MockDroneRemoteEntity {
    static func getDrone() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPosition())
    }
}

struct MockDrone {
    static func getDrone() -> Drone {
        return Drone(currentPosition: MockPosition.getPosition())
    }
}
