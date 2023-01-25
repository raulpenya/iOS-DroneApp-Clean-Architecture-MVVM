//
//  MockMissionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
@testable import Data
@testable import Tracker
import Domain

struct MockMissionRemoteEntity {
    static func getMission() -> TrackerMission {
        return MissionRemoteEntity(drone: MockDroneRemoteEntity.getDrone(), plateau: MockPlateauRemoteEntity.getPlateau(), instructions: MockInstructionsRemoteEntity.getInstructions())
    }
    
    static func getMissionWithWRONGInitialPosition() -> TrackerMission {
        return MissionRemoteEntity(drone: MockDroneRemoteEntity.getDroneWRONGInitialPosition(), plateau: MockPlateauRemoteEntity.getPlateau(), instructions: MockInstructionsRemoteEntity.getInstructions())
    }
    
    static func getMissionWithInstructionsOUTOFBOUNDS() -> TrackerMission {
        return MissionRemoteEntity(drone: MockDroneRemoteEntity.getDrone(), plateau: MockPlateauRemoteEntity.getPlateau(), instructions: MockInstructionsRemoteEntity.getInstructionsOUTOFBOUNDS())
    }
}

struct MockMission {
    static func getMission() -> Mission {
        return Mission(drone: MockDrone.getDrone(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructions())
    }
    
    static func getMissionWithWRONGInitialPosition() -> Mission {
        return Mission(drone: MockDrone.getDroneWRONGInitialPosition(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructions())
    }
    
    static func getMissionWithInstructionsOUTOFBOUNDS() -> Mission {
        return Mission(drone: MockDrone.getDrone(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructions())
    }
}
