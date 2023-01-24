//
//  MockMissionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
@testable import Domain

struct MockMissionRemoteEntity {
    static func getMission() -> TrackerMission {
        return MissionRemoteEntity(drone: MockDroneRemoteEntity.getDrone(), plateau: MockPlateauRemoteEntity.getPlateau(), instructions: MockInstructionsRemoteEntity.getInstructions())
    }
}

struct MockMission {
    static func getMission() -> Mission {
        return Mission(drone: MockDrone.getDrone(), plateau: MockPlateau.getPlateau(), instructions: <#T##Instructions#>)
    }
}
