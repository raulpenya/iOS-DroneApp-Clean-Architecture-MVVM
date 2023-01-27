//
//  TrackerMission.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation
import Tracker

struct MockTrackerMission: TrackerMission {
    var drone: TrackerDrone
    var plateau: TrackerPlateau
    var instructions: TrackerInstructions
    
    static func getREQUESTEDMission() -> TrackerMission {
        let drone = MockTrackerDrone.getREQUESTEDDrone()
        let plateau = MockTrackerPlateau.getREQUESTEDPlateau()
        let instructions = MockTrackerInstructions.getREQUESTEDInstructions()
        return MockTrackerMission(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    static func getMissionWithWRONGInitialPosition() -> TrackerMission {
        let drone = MockTrackerDrone.getDroneOutOfBoundsPointingNorth()
        let plateau = MockTrackerPlateau.getREQUESTEDPlateau()
        let instructions = MockTrackerInstructions.getREQUESTEDInstructions()
        return MockTrackerMission(drone: drone, plateau: plateau, instructions: instructions)
    }
    
    static func getMissionWithWRONGInstruction() -> TrackerMission {
        let drone = MockTrackerDrone.getREQUESTEDDrone()
        let plateau = MockTrackerPlateau.getREQUESTEDPlateau()
        let instructions = MockTrackerInstructions.getWRONGInstructions()
        return MockTrackerMission(drone: drone, plateau: plateau, instructions: instructions)
    }
}
