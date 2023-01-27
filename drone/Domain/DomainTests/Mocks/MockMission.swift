//
//  MockMissionRemoteEntity.swift
//  DataTests
//
//  Created by raulbot on 24/1/23.
//

import Foundation
import Domain

struct MockMission {
    static func getMission() -> Mission {
        return Mission(drone: MockDrone.getDrone(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructions())
    }
    
    static func getMissionWithWRONGInitialPosition() -> Mission {
        return Mission(drone: MockDrone.getDroneWRONGInitialPosition(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructions())
    }
    
    static func getMissionWithInstructionsOUTOFBOUNDS() -> Mission {
        return Mission(drone: MockDrone.getDrone(), plateau: MockPlateau.getPlateau(), instructions: MockInstructions.getInstructionsOUTOFBOUNDS())
    }
}
