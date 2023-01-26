//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

struct MockDroneRemoteEntity {
    static func getDrone() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPosition())
    }
    
    static func getDroneWRONGInitialPosition() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPositionWRONG())
    }
}
