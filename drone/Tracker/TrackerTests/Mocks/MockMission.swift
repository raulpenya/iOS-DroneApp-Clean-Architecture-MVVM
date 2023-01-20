//
//  MockMission.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct MockMission: TrackerMission {
    var drone: TrackerDrone
    var plateau: TrackerPlateau
    var instructions: TrackerInstructions
    
    static func getREQUESTEDMission() -> TrackerMission {
        let drone = MockDrone.getREQUESTEDDrone()
        let plateau = MockPlateau.getREQUESTEDPlateau()
        let instructions = MockInstructions.getREQUESTEDInstructions()
        return MockMission(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    static func getMissionWithWRONGInitialPosition() -> TrackerMission {
        let drone = MockDrone.getDroneOutOfBoundsPointingNorth()
        let plateau = MockPlateau.getREQUESTEDPlateau()
        let instructions = MockInstructions.getREQUESTEDInstructions()
        return MockMission(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    static func getMissionWithWRONGInstruction() -> TrackerMission {
        let drone = MockDrone.getREQUESTEDDrone()
        let plateau = MockPlateau.getREQUESTEDPlateau()
        let instructions = MockInstructions.getWRONGInstructions()
        return MockMission(drone: drone, plateau: plateau, instructions: instructions)
    }
}
