//
//  Ttracker.swift
//  Tracker
//
//  Created by raulbot on 18/1/23.
//

import Foundation

public class Tracker {
    public func getResult(from mission: TrackerMission) -> TrackerMissionResult {
        return calculatePath(with: mission)
    }
}

internal extension Tracker { // private methods
    func calculatePath(with mission: TrackerMission) -> TrackerMissionResult {
        let instructions = mission.instructions
        var drone = mission.drone
        let plateau = mission.plateau
        var success = false
        var error: Error? = nil
        for instruction in instructions.instructions {
            let newDrone = execute(instruction: instruction, with: drone)
            success = checkDronePosition(newDrone.currentPosition, in: plateau)
            if !success {
                error = NSError(domain: TrackerErrors.instructionOutOfBounds.localizedDescription,
                                code: TrackerErrors.instructionOutOfBounds.code,
                                userInfo: nil)
                break
            }
            drone = newDrone
        }
        let result = Result(success: success, error: error)
        return MissionResult(mission: mission, result: result)
        
    }
    
    func execute(instruction: TrackerInstruction, with drone: TrackerDrone) -> TrackerDrone {
        return drone.execute(movement: instruction.movement)
    }
    
    func checkDronePosition(_ position: TrackerPosition, in plateau: TrackerPlateau) -> Bool {
        return plateau.isPositionWithinTheBoundaries(position.coordinate)
    }
}
