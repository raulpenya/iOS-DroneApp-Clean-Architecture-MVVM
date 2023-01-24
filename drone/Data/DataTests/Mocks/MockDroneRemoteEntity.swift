//
//  MockDroneRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 23/1/23.
//

import Foundation
@testable import Data
@testable import Tracker

struct MockDroneRemoteEntity {
    static func getDrone() -> TrackerDrone {
        return DroneRemoteEntity(currentPosition: MockPositionRemoteEntity.getPosition())
    }
}
