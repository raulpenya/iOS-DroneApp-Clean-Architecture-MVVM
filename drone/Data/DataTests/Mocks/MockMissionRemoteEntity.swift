//
//  MockMissionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 26/1/23.
//

import Foundation
@testable import Data
import Tracker

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
